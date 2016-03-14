//
//  StudentScheduleViewController.m
//  asi
//
//  Created by Eric Aguiar on 11/21/15.
//  Copyright (c) 2015 FIU. All rights reserved.
//

#import "StudentScheduleViewController.h"

@interface StudentScheduleViewController ()

@end

@implementation StudentScheduleViewController

@synthesize studentScheduleScrollView, studentScheduleSearchBar;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//MARK: Tap Gesture
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


//MARK: Scrollview
- (void) scrollViewAdaptToStartEditingTextField:(UITextField*)textField
{
    CGPoint point = CGPointMake(0, textField.frame.origin.y - 3 * textField.frame.size.height);
    [studentScheduleScrollView setContentOffset:point animated:YES];
}

- (void) scrollVievEditingFinished
{
    CGPoint point = CGPointMake(0, 0);
    [studentScheduleScrollView setContentOffset:point animated:YES];
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
