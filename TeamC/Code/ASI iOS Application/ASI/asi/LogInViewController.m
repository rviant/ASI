//
//  ViewController.m
//  asi
//
//  Created by Luis Andres Castillo Hernandez on 11/21/15.
//  Copyright (c) 2015 FIU. All rights reserved.
//

#import "LogInViewController.h"
#import "API.h"

#import "tutorHomeViewController.h"
#import "ManagerHomeViewController.h"
#import "StudentSessionsTableViewController.h"

@interface LogInViewController ()

@end

@implementation LogInViewController


@synthesize userNameTextfield, passwordTextfield, scrollview;


//MARK: View loading

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.api = [[API alloc]init];
    
}//eo-view


-(void)viewDidAppear:(BOOL)animated
{
    //hiding nav bar
    self.navigationController.navigationBarHidden = true;
    
    [self setUpTapGesture];

}//eo-view


//MARK: Memory

    - (void)didReceiveMemoryWarning {
        [super didReceiveMemoryWarning];
        // Dispose of any resources that can be recreated.
    }


//MARK: verify Data Enter
-(BOOL)verifyDataEnter
{
    //checking for valid input
    NSCharacterSet *charSet = [NSCharacterSet whitespaceCharacterSet];
    NSString * testing;
    NSString *trimmedString;
    
    
    testing         = userNameTextfield.text;
    trimmedString   = [testing stringByTrimmingCharactersInSet:charSet];
    if ([trimmedString isEqualToString:@""]) {
        [self scrollVievEditingFinished]; //take scroll to textfield so user can see their error
        
        // it's empty or contains only white spaces
        [self showAlert:@"Login" withMessage:@"Please enter your first name" and:@"Okay"];
        return 0;
    }
    
    testing = passwordTextfield.text; //not required
    trimmedString = [testing stringByTrimmingCharactersInSet:charSet];
    if ([trimmedString isEqualToString:@""]) {
        [self scrollVievEditingFinished]; //take scroll to textfield so user can see their error
      
        // it's empty or contains only white spaces
        [self showAlert:@"" withMessage:@"Please enter your password" and:@"Okay"];
        return 0;
    }
    
    return true;
}//eom

//MARK: Sign In

    - (IBAction)signInUser:(id)sender
    {
        bool result = [self verifyDataEnter];
        if(result)
        {
            [self sendDataLoginDataToServer];
        }
    }//eo-action

         
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
      


//MARK: Navigation

    /* preparing the data to sent to the next view controller */
    -(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
        if([segue.identifier isEqualToString:@"staffHome"]){
    //        UINavigationController *navigationController = [segue destinationViewController];
    //        StaffHomeViewController *controller = (StaffHomeViewController *) navigationController.topViewController;
    //        controller.username = username.text;
        }
        else if([segue.identifier isEqualToString:@"employerHome"])
        {
    //        UINavigationController *navigationController = [segue destinationViewController];
    //        EmployerHomeViewController *controller = (EmployerHomeViewController *) navigationController.topViewController;
    //        controller.username = username.text;
        }
        
    }//eom



    -(void)goToStudentHomeView
    {
        
        UIStoryboard * diffStoryboard = [UIStoryboard storyboardWithName:@"Student" bundle:nil];
       
        StudentSessionsTableViewController * homeView = [diffStoryboard instantiateViewControllerWithIdentifier:@"studentHome"];
        
        [self presentViewController:homeView animated:true completion:nil ];
        
    }//eom


    -(void)goToTutorHomeView
    {
        
        UIStoryboard * diffStoryboard = [UIStoryboard storyboardWithName:@"Tutor" bundle:nil];
        
        tutorHomeViewController * homeView = [diffStoryboard instantiateViewControllerWithIdentifier:@"tutorHome"];
        
        [self presentViewController:homeView animated:true completion:nil ];
        
    }//eom


    -(void)goToManagerHomeView
    {
        
        UIStoryboard * diffStoryboard = [UIStoryboard storyboardWithName:@"Manager" bundle:nil];
        
        ManagerHomeViewController * homeView = [diffStoryboard instantiateViewControllerWithIdentifier:@"managerHome"];
        
        [self presentViewController:homeView animated:true completion:nil ];
        
    }//eom


//MARK: textfield delegates
    /* dimisses UITextField as soon the return key is pressed */
    -(BOOL)textFieldShouldReturn:(UITextField *)textField {
        
        if(textField == self.userNameTextfield){
            [self.userNameTextfield resignFirstResponder];
            [self.passwordTextfield becomeFirstResponder];
        }
        else if(textField == self.passwordTextfield){
            [self.passwordTextfield resignFirstResponder];
        }
        
        [self scrollVievEditingFinished];//moving scrollview
        
        return YES;
    }//eom


    /* uitextfield is about to be edit*/
    - (BOOL) textFieldShouldBeginEditing:(UITextField *)textField
    {
        [self scrollViewAdaptToStartEditingTextField:textField];
        return YES;
    }



//MARK: Scrollview
    - (void) scrollViewAdaptToStartEditingTextField:(UITextField*)textField
    {
        CGPoint point = CGPointMake(0, textField.frame.origin.y - 3 * textField.frame.size.height);
        [scrollview setContentOffset:point animated:YES];
    }//eom

    - (void) scrollVievEditingFinished
    {
        CGPoint point = CGPointMake(0, 0);
        [scrollview setContentOffset:point animated:YES];
    }//eom

//MARK: Tap guesture

    /*sets up taps gesture*/
    -(void)setUpTapGesture
    {
        //to dismiss keyboard when a tap is done outside the textfield
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(dismissKeyboard:)];
        [self.view addGestureRecognizer:tap];
        
    }//eoom

    /* dimisses keyboard upon touching background */
    - (void)dismissKeyboard:(UITapGestureRecognizer *)recognizer {
        [self.view endEditing:YES];
    }


//MARK: process Server Responce

    /*
     process Server Responce
     */
    -(void) processServerResponce:(NSDictionary *) responce
    {
        //    NSLog(@"[1] responce: %@", responce);
        
        NSDictionary * userResults      = [responce objectForKey:@"results"];
        int usertype                    = [[userResults objectForKey:@"usertype"] intValue];
        //NSDictionary * responceMessage  = [userResults objectForKey:@"message"];
        //NSString * message              = [NSString stringWithFormat:@"%@", responceMessage];
        
        NSLog(@"[1] results is %@", userResults);
        NSLog(@"[1] usertype is %d", usertype);
        
        /*
         return 1       - student
         return 2       - tutors
         return 3       - manager
         return 0       - DB not responding
         return -1 -2   - valid user with INCORRECT Credentials
         return -3      - no user found
         return -4      - account locked
         */
        if(usertype == 3) //manager user
        {
            [self goToManagerHomeView];
        }
        else if(usertype == 2) //tutors user
        {
            [self goToTutorHomeView];
        }
        else if(usertype == 1) //student user
        {
            [self goToStudentHomeView];
        }
        else if(usertype == 0)//db issues
        {
            [self showAlert:@"Log In" withMessage:@"We Apologize but our system is currently down" and:@"Okay"];
        }
        else if(usertype == -1)//invalid credentials
        {
            [self showAlert:@"Log In" withMessage:@"Invalid credentials" and:@"Okay"];
        }
        else if(usertype == -2)//account locked
        {
            //notifying user code was accepted
            [self showAlert:@"Log In" withMessage:@"Account locked, please reset your password" and:@"Okay"];
        }
        else if(usertype == -3)//no user found
        {
            [self showAlert:@"Log In" withMessage:@"No account found with the provided credentials" and:@"Okay"];
        }
    }//eom

/************************************/
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
        
        NSString *dataResponce = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        NSLog(@"[2] responce from server %@",dataResponce);
        
        // Get JSON objects into initial array
        NSArray *rawExhibits2 = (NSArray *)[NSJSONSerialization JSONObjectWithData:[dataResponce dataUsingEncoding:NSUTF8StringEncoding] options:0 error:NULL];
        NSLog(@"[3] responce from server %@",rawExhibits2);
        
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


//MARK: Login POST request

    /*
     
     */
    -(void)sendDataLoginDataToServer
    {
        NSString *serverAddress = [self.api getUrl:@"login"];
        
        /*** preparing data to be sent ***/
        NSMutableDictionary * logInfo = [self prepareLogInData];
        NSLog(@"");
        NSLog(@" about to send the following data: %@", logInfo);
        NSLog(@"");
        
        /*** Sending data ***/
        NSMutableURLRequest *request = [[NSMutableURLRequest alloc]
                                        initWithURL:[NSURL URLWithString:  serverAddress ]];
        
        [request setHTTPMethod:@"POST"]; //request type
        
        //sending data
        NSError *error;
        NSData *postdata = [NSJSONSerialization dataWithJSONObject:logInfo options:0 error:&error];
        
        [request setHTTPBody:postdata];
        
        //        NSURLConnection *connection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
        //        NSURLConnection *connection = [NSURLConnection connectionWithRequest:request delegate:self];
        
        [NSURLConnection connectionWithRequest:request delegate:self];
        
    }//eo-action


    /*
     prepare log in data
     */
    -(NSMutableDictionary *) prepareLogInData
    {
        //creating initial list
        NSMutableDictionary * finalList = [[NSMutableDictionary alloc] init];
        
        finalList[@"username"]       = self.userNameTextfield.text;
        finalList[@"password"]              = self.passwordTextfield.text;
        
        return finalList;
    }//eom


@end
