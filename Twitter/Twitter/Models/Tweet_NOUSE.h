//
//  Tweet.h
//  Twitter
//
//  Created by Anson Ng on 6/28/15.
//  Copyright (c) 2015 Anson Ng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "User_NOUSE.h"

@interface Tweet_NOUSE : NSObject
@property (nonatomic, strong) NSString *text;
@property (nonatomic, strong) NSDate *createdAt;

@property (nonatomic, strong) User_NOUSE *user;

- (instancetype)initWithDictionary: (NSDictionary *)dictionary;
+ (NSArray *) tweetsWithArray:(NSArray *)array;
@end
