//
//  API.h
//  asi
//
//  Created by Luis Andres Castillo Hernandez on 11/21/15.
//  Copyright © 2015 FIU. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface API: NSObject
{
    NSMutableDictionary * url;

}


-(NSString *)getUrl:(NSString *)key;
- (BOOL) validateEmail: (NSString *) candidate;




@end
