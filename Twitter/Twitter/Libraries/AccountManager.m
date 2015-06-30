//
//  AccountManager.m
//  Twitter
//
//  Created by Anson Ng on 6/30/15.
//  Copyright (c) 2015 Anson Ng. All rights reserved.
//

#import "AccountManager.h"
#import "TwitterClient.h"

NSString * const currentUserKey = @"currentUserKey";
@implementation AccountManager

static User *_currentUser = nil;

+ (User *)currentUser
{
    if (_currentUser == nil) {
        NSData *data = [[NSUserDefaults standardUserDefaults] objectForKey:currentUserKey];
        if (data != nil) {
            NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:NULL];
            NSError *error = nil;
            _currentUser = [[User alloc] initWithDictionary:dictionary error:&error];
        }
    }
    
    return _currentUser;
    
}
+ (void)setCurrentUser:(User *)currentUser
{
    _currentUser = currentUser;
    if (_currentUser != nil) {
        NSDictionary *dic = [currentUser toDictionary];
        NSData *data = [NSJSONSerialization dataWithJSONObject: dic options:0 error:NULL];
        [[NSUserDefaults standardUserDefaults] setObject:data forKey:currentUserKey];
    } else {
        [[NSUserDefaults standardUserDefaults] setObject:nil forKey:currentUserKey];
    }
    [[NSUserDefaults standardUserDefaults]synchronize];
}

+ (void)logout
{
    
    [self setCurrentUser:nil];
    [[TwitterClient sharedInstance].requestSerializer removeAccessToken];
    [[NSNotificationCenter defaultCenter] postNotificationName:UserDidLogoutNotification object:nil];
}

@end
