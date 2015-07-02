//
//  Tweet.m
//  Twitter
//
//  Created by Anson Ng on 6/29/15.
//  Copyright (c) 2015 Anson Ng. All rights reserved.
//

#import "Tweet.h"

@implementation Tweet

+ (JSONKeyMapper*)keyMapper
{
    return [[JSONKeyMapper alloc] initWithDictionary:@{
                                                       @"id": @"tweetId",
                                                       @"description": @"descriptionString",
                                                       @"profile_image_url": @"profileImageUrl",
                                                       @"screen_name": @"screenName",
                                                       @"retweeted_status": @"retweet",
                                                       @"retweet_count": @"retweetCount",
                                                       @"favorite_count": @"favoriteCount",
                                                       @"favorited": @"isFavorited"
                                                       
                                                       }];
}

+(BOOL)propertyIsOptional:(NSString*)propertyName
{
    return YES;
}

@end
