//
//  User.h
//  Twitter
//
//  Created by Anson Ng on 6/28/15.
//  Copyright (c) 2015 Anson Ng. All rights reserved.
//

#import <Foundation/Foundation.h>
extern NSString * UserDidLoginNotification;
extern NSString * UserDidLogoutNotification;

@interface User_NOUSE : NSObject
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *screenname;
@property (nonatomic, strong) NSString *profileImageUrl;
@property (nonatomic, strong) NSString *tagline;

- (instancetype)initWithDictionary: (NSDictionary *)dictionary;


+ (User_NOUSE *)currentUser;
+ (void)setCurrentUser:(User_NOUSE *)currentUser;
+ (void)logout;
@end
