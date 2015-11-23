//
//  API.m
//  asi
//
//  Created by Luis Andres Castillo Hernandez on 11/21/15.
//  Copyright © 2015 FIU. All rights reserved.
//

#import "API.h"
#import <UIKit/UIKit.h>

@implementation API



-(id)init
{
    self = [super init];
    if (self)
    {
        url = [[NSMutableDictionary alloc]init];
        
        [url setObject:@"http://luiscastillo.me/asi/Code/Web/jsonPOST_login.php" forKey:@"login"];
        [url setObject:@"http://luiscastillo.me/asi/Code/Web/jsonPOST_saveNewAccount.php" forKey:@"createAccount"];
        [url setObject:@"http://luiscastillo.me/asi/Code/Web/jsonPOST_forgotPassword1.php" forKey:@"forgotPassword1"];
        [url setObject:@"http://luiscastillo.me/asi/Code/Web/jsonPOST_forgotPassword2.php" forKey:@"forgotPassword2"];
        
        
        //fetch back files from core data or receive user data from server
    }
    return self;

}

/* */
-(NSString *)getUrl:(NSString *)key
{
    return [url valueForKey:key];
}


/* validating email */
- (BOOL) validateEmail: (NSString *) candidate {
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    //  return 0;
    return [emailTest evaluateWithObject:candidate];
}





@end
