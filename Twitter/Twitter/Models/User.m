//
//  User.m
//  Twitter
//
//  Created by Anson Ng on 6/29/15.
//  Copyright (c) 2015 Anson Ng. All rights reserved.
//

#import "User.h"

@implementation User

+ (JSONKeyMapper*)keyMapper
{
    return [[JSONKeyMapper alloc] initWithDictionary:@{
                                                       @"id": @"userId",
                                                       @"description": @"descriptionString",
                                                       @"profile_image_url": @"profileImageUrl",
                                                       @"screen_name": @"screenName"
                                                       }];
}

@end
