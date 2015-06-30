
//
//  Tweet.m
//  Twitter
//
//  Created by Anson Ng on 6/28/15.
//  Copyright (c) 2015 Anson Ng. All rights reserved.
//

#import "Tweet_NOUSE.h"

@implementation Tweet_NOUSE
- (instancetype)initWithDictionary: (NSDictionary *)dictionary
{
    self = [super init];
    if (self) {
        NSString *createAtString = dictionary[@"created_at"];
        self.user = [[User_NOUSE alloc]initWithDictionary:dictionary[@"user"]];
        self.text = dictionary[@"text"];
        NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
        formatter.dateFormat = @"EEE MMM d HH:mm:ss Z y";
        self.createdAt = [formatter dateFromString:createAtString];
      //  self.createdAt = createAtString;
     }
    return self;
}
+ (NSArray *) tweetsWithArray:(NSArray *)array
{
    NSMutableArray *tweets = [NSMutableArray array];
    for (NSDictionary *dictionary in array) {
        [tweets addObject:[[Tweet_NOUSE alloc] initWithDictionary:dictionary]];
    }
         return tweets;
}
@end
