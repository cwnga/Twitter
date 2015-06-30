//
//  AccountManager.h
//  Twitter
//
//  Created by Anson Ng on 6/30/15.
//  Copyright (c) 2015 Anson Ng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "User.h"
@interface AccountManager : NSObject

+ (User *)currentUser;
+ (void)setCurrentUser:(User *)currentUser;
+ (void)logout;

@end
