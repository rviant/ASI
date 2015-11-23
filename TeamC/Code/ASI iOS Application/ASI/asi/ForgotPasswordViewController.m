//
//  ForgotPasswordViewController.m
//  
//
//  Created by Luis Andres Castillo Hernandez on 11/21/15.
//
//

#import "ForgotPasswordViewController.h"

@interface ForgotPasswordViewController ()

@end

@implementation ForgotPasswordViewController

@synthesize scrollview;
@synthesize accountTypeTextfield, cellphoneTextfield, resetPasswordButton;
@synthesize verificationCodeLabel, verificationCodeTextfield;
@synthesize passwordLabel, passwordTextfield;
@synthesize confirmNewPasswordLabel, confirmNewPasswordTextfield;

//MARK: View Loading
    - (void)viewDidLoad
    {
        [super viewDidLoad];
        // Do any additional setup after loading the view.
    }//eo-view

    -(void)viewDidAppear:(BOOL)animated
    {
        [self setUpTapGesture];
    }//eo-view

    -(void)viewWillDisappear:(BOOL)animated
    {

    }//eo-view

//MARK: Memory
    - (void)didReceiveMemoryWarning {
        [super didReceiveMemoryWarning];
        // Dispose of any resources that can be recreated.
    }


//MARK: Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }


//MARK: Alert

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
        [scrollview setContentOffset:point animated:YES];
    }

    - (void) scrollVievEditingFinished
    {
        CGPoint point = CGPointMake(0, 0);
        [scrollview setContentOffset:point animated:YES];
    }



//MARK: textfield
    /* dimisses UITextField as soon the return key is pressed */
    -(BOOL)textFieldShouldReturn:(UITextField *)textField
    {
        [textField resignFirstResponder];
        
        if(textField == self.accountTypeTextfield){
            [self.cellphoneTextfield becomeFirstResponder];
        }
        else if(textField == self.cellphoneTextfield){
            //ready for part 1
        }
        else if(textField == self.verificationCodeTextfield){
            [self.passwordTextfield becomeFirstResponder];
        }
        else if(textField == self.passwordTextfield){
            [self.confirmNewPasswordTextfield becomeFirstResponder];
        }
        else if(textField == self.confirmNewPasswordTextfield){
            //ready for part 2
        }
        
        [self scrollVievEditingFinished];
        
        return YES;
    }//eom

    /* uitextfield is about to be edit*/
    - (BOOL) textFieldShouldBeginEditing:(UITextField *)textField
    {
        //moving scrollview up to textfield
        [self scrollViewAdaptToStartEditingTextField:textField];
        return YES;
    }//eom


//MARK: Forgot password Part 1

    -(BOOL) verifyPart1Data
    {
        //checking for valid input
        NSCharacterSet *charSet = [NSCharacterSet whitespaceCharacterSet];
        NSString * testing;
        NSString *trimmedString;
        
        testing = self.cellphoneTextfield.text;
        trimmedString = [testing stringByTrimmingCharactersInSet:charSet];
        if ([trimmedString isEqualToString:@""]) {
            [self scrollVievEditingFinished]; //take scroll to textfield so user can see their error
           
            // it's empty or contains only white spaces
            [self showAlert:@"Registration Field" withMessage:@"Please enter your cellphone number" and:@"Okay"];
            return 0;
        }
        else if( self.cellphoneTextfield.text.length < 10)
        {
            [self scrollVievEditingFinished]; //take scroll to textfield so user can see their error
            // it's empty or contains only white spaces
            [self showAlert:@"Registration Field" withMessage:@"Please make sure to enter your complete cellphone number" and:@"Okay"];
            return 0;
        }
        
        return 1;
    }//eom



//MARK: Actions

- (IBAction)startResetPasswordProcess:(id)sender
{
    
    
}//eo-a


- (IBAction)updatePassword:(id)sender
{
    
    
}//eo-a


//MARK:




//MARK:


@end
