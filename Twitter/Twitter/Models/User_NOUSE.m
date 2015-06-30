//
//  User.m
//  Twitter
//
//  Created by Anson Ng on 6/28/15.
//  Copyright (c) 2015 Anson Ng. All rights reserved.
//

#import "User_NOUSE.h"
#import "TwitterClient.h"


 NSString * UserDidLoginNotification = @"UserDidLoginNotification";
 NSString * UserDidLogoutNotification = @"UserDidLogoutNotification";


@interface User_NOUSE()

@property (nonatomic, strong) NSDictionary *dictionary;
@end

@implementation User_NOUSE

- (instancetype)initWithDictionary: (NSDictionary *)dictionary
{
    self = [super init];
    if (self) {
        self.dictionary = dictionary;
        self.name = dictionary[@"name"];
        self.screenname = dictionary[@"screen)name"];
        self.profileImageUrl = dictionary[@"profile_image_url"];
        self.tagline = dictionary[@"description"];
    }
    return self;
}




static User_NOUSE *_currentUser = nil;
NSString * const kCurrentUserKey = @"kCurrentUserKey";

+ (User_NOUSE *)currentUser
{
    if (_currentUser == nil) {
        NSData *data = [[NSUserDefaults standardUserDefaults] objectForKey:kCurrentUserKey];
        if (data != nil) {
            NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:NULL];
            _currentUser = [[User_NOUSE alloc] initWithDictionary:dictionary];
            
        }
    }
    
    return _currentUser;
}
+ (void)setCurrentUser:(User_NOUSE *)currentUser
{
    _currentUser = currentUser;
    if (_currentUser != nil) {
        
        NSLog(@"currentUser::%@", currentUser.dictionary);
        NSData *data = [NSJSONSerialization dataWithJSONObject:currentUser.dictionary options:0 error:NULL];
        [[NSUserDefaults standardUserDefaults] setObject:data forKey:kCurrentUserKey];
        
        //_currentUser = currentUser;
    } else {
        [[NSUserDefaults standardUserDefaults] setObject:nil forKey:kCurrentUserKey];
    }
    [[NSUserDefaults standardUserDefaults]synchronize];
}

+ (void)logout
{
    [User_NOUSE setCurrentUser:nil];
    [[TwitterClient sharedInstance].requestSerializer removeAccessToken];
    [[NSNotificationCenter defaultCenter] postNotificationName:UserDidLogoutNotification object:nil];
}
@end
