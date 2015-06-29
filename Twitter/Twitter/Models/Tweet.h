//
//  Tweet.h
//  Twitter
//
//  Created by Anson Ng on 6/28/15.
//  Copyright (c) 2015 Anson Ng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "User.h"

@interface Tweet : NSObject
@property (nonatomic, strong) NSString *text;
@property (nonatomic, strong) NSDate *createdAt;

@property (nonatomic, strong) User *user;

- (instancetype)initWithDictionary: (NSDictionary *)dictionary;
+ (NSArray *) tweetsWithArray:(NSArray *)array;
@end
