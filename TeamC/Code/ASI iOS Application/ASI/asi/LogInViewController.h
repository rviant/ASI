//
//  ViewController.h
//  asi
//
//  Created by Luis Andres Castillo Hernandez on 11/21/15.
//  Copyright (c) 2015 FIU. All rights reserved.
//

#import <UIKit/UIKit.h>
@class API;

@interface LogInViewController : UIViewController<UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *userNameTextfield;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextfield;

@property (weak, nonatomic) IBOutlet UIScrollView *scrollview;



//model
@property (strong, nonatomic) API *api;



@end

