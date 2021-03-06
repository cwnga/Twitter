//
//  TweetList.m
//  Twitter
//
//  Created by Anson Ng on 6/29/15.
//  Copyright (c) 2015 Anson Ng. All rights reserved.
//

#import "TweetList.h"


@implementation TweetList

+ (instancetype) tweetsWithArray:(NSArray *)array error:(NSError *__autoreleasing *)error
{
    NSDictionary *tweets = @{@"tweets": array};
    return [[TweetList alloc]initWithDictionary:tweets error:error];
}

- (NSString *) getLastTweetId
{
    NSString *lastTweetId = nil;
    lastTweetId = ((Tweet*)[self.tweets lastObject]).tweetId;
    return lastTweetId;
}
- (NSString *) getFirstTweetId
{
    NSString *lastTweetId = nil;
    lastTweetId = ((Tweet*)[self.tweets firstObject]).tweetId;
    return lastTweetId;
}
@end
