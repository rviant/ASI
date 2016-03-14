//
//  StudentSessionsTableViewController.m
//  asi
//
//  Created by Eric Aguiar on 11/21/15.
//  Copyright (c) 2015 FIU. All rights reserved.
//

#import "StudentSessionsTableViewController.h"
#import "API.h"

@interface StudentSessionsTableViewController ()

@end

@implementation StudentSessionsTableViewController

@synthesize studentSessionsTableView, studentSessionsSearchBar, initialCities, filterdCities, isFiltered;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    self.api = [[API alloc]init];
    
    
    [self getDataFromServer];
    
    // Alloc and init our initial data
    initialCities = [[NSMutableArray alloc] initWithObjects:@"London", @"New York", @"Berlin", @"Bombay", @"Kuala Lumpur", @"Beijing", @"Sydney", nil];
   
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//MARK: JSON Get
-(void)getDataFromServer
{
    [self.navigationController setToolbarHidden:NO];
    
    NSString *serverAddress          = [self.api getUrl:@"query"];
    NSMutableDictionary * dataSending   = [self prepareServerGetData];
    
    
    /*** Sending data ***/
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc]
                                    initWithURL:[NSURL URLWithString:  serverAddress ]];
    
    [request setHTTPMethod:@"POST"]; //request type
    
    //sending data
    NSError *error;
    NSData *postdata = [NSJSONSerialization dataWithJSONObject:dataSending options:0 error:&error];
    
    [request setHTTPBody:postdata];
    
    //        NSURLConnection *connection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
    //        NSURLConnection *connection = [NSURLConnection connectionWithRequest:request delegate:self];
    
    [NSURLConnection connectionWithRequest:request delegate:self];

}//eom

-(NSMutableDictionary *) prepareServerGetData
{
    //creating initial list
    NSMutableDictionary * finalList = [[NSMutableDictionary alloc] init];
    
    NSString *querySending = @"SELECT * FROM tutor_session;";
    
    
    
    
    
    finalList[@"query"]  = querySending;
    
    return finalList;
}//eom


//MARK: JSON POST functions

/* responce from server */
- (void) connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
    
    NSLog(@" responce: %@", httpResponse.description);
    
}//eo-action


/* data received from server */
- (void)connection:(NSURLConnection *)connection didReceiveData:(nonnull NSData *)data
{
    
    NSDictionary * rawExhibits = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
    NSLog(@"[1] from server replied: %@",rawExhibits);
    
    //NSString *dataResponce = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    //NSLog(@"[2] responce from server %@",dataResponce);
    
    // Get JSON objects into initial array
    //NSArray *rawExhibits2 = (NSArray *)[NSJSONSerialization JSONObjectWithData:[dataResponce dataUsingEncoding:NSUTF8StringEncoding] options:0 error:NULL];
    //NSLog(@"[3] responce from server %@",rawExhibits2);
    
    //processing responce
    [self processServerResponce:rawExhibits];
}//eom

/*
 - (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
 {
 data = [[NSMutableData alloc] init];
 NSLog(@"Data Data , %@", data);
 }
 */

/* error occurred sending data to server */
-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    NSLog(@" Failed with error '%@'", error);
}//eom



//MARK: process Server Responce

/*
 process Server Responce
 */
-(void) processServerResponce:(NSDictionary *) responce
{
        NSLog(@"[1] responce: %@", responce);
    
    NSDictionary * userResults      = [responce objectForKey:@"results"];
    int usertype                    = [[userResults objectForKey:@"usertype"] intValue];
    //NSDictionary * responceMessage  = [userResults objectForKey:@"message"];
    //NSString * message              = [NSString stringWithFormat:@"%@", responceMessage];
    
    NSLog(@"[1] results is %@", userResults);
    NSLog(@"[1] usertype is %d", usertype);
    

}//eom

//MARK: Alert Message
/* create UIAlert*/
-(void) showAlert:(NSString*)title withMessage:(NSString*)message and:(NSString*) cancelTitle
{
    
    //creating UIAlert
    UIAlertView * alert =[[UIAlertView alloc] initWithTitle:title
                                                    message:message
                                                   delegate:self
                                          cancelButtonTitle:cancelTitle
                                          otherButtonTitles: nil];
    [alert show];//display alert
}//eom


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    
    if (isFiltered == YES)
    {
        return filterdCities.count;
    }
    else
    {
        return initialCities.count;
    }
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"StudentSessionsCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    
    if(cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    // cell.textLabel.text = [NSString stringWithFormat:@"StudentSessionsCell %ld", (long)indexPath.row];
    
    if (isFiltered == YES)
    {
        cell.textLabel.text = [filterdCities objectAtIndex:indexPath.row];
    }
    else
    {
        cell.textLabel.text = [initialCities objectAtIndex:indexPath.row];
    }
    
     // Configure the cell...
    
    return cell;
}

//#pragma mark - UITabelView Delegate methods
//
//- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    
//}


#pragma mark - UISearchBarDelegate Methods
- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
    if (searchText.length == 0)
    {
        //Set our boolean flag
        isFiltered = NO;
    }
    else
    {
        //Set our boolean flag
        isFiltered = YES;
        
        //Alloc  an init our filteredDad
        filterdCities = [[NSMutableArray alloc] init];
        
        //Fast enumeration
        for (NSString *cityName in initialCities) {
            NSRange cityNameRange = [cityName rangeOfString:searchText options:NSCaseInsensitiveSearch];
            
            if (cityNameRange.location != NSNotFound)
            {
                [filterdCities addObject:cityName];
            }
        }
    }
    
    //Reload our table view
    [studentSessionsTableView reloadData];
}

- (void) searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    [studentSessionsSearchBar resignFirstResponder];
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
