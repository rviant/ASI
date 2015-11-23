//
//  ForgotPasswordViewController.h
//  
//
//  Created by Luis Andres Castillo Hernandez on 11/21/15.
//
//

#import <UIKit/UIKit.h>

@interface ForgotPasswordViewController : UIViewController<UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UIScrollView *scrollview;

@property (weak, nonatomic) IBOutlet UITextField *accountTypeTextfield;
@property (weak, nonatomic) IBOutlet UITextField *cellphoneTextfield;
@property (weak, nonatomic) IBOutlet UIButton *resetPasswordButton;

- (IBAction)startResetPasswordProcess:(id)sender;

@property (weak, nonatomic) IBOutlet UILabel *verificationCodeLabel;
@property (weak, nonatomic) IBOutlet UILabel *passwordLabel;
@property (weak, nonatomic) IBOutlet UILabel *confirmNewPasswordLabel;

@property (weak, nonatomic) IBOutlet UITextField *verificationCodeTextfield;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextfield;
@property (weak, nonatomic) IBOutlet UITextField *confirmNewPasswordTextfield;

@property (weak, nonatomic) IBOutlet UIButton *updatePasswordButton;


- (IBAction)updatePassword:(id)sender;


@end
