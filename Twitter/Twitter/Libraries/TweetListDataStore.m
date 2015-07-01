//
//  TweetListDataStore.m
//  Twitter
//
//  Created by Anson Ng on 7/1/15.
//  Copyright (c) 2015 Anson Ng. All rights reserved.
//

#import "TweetListDataStore.h"
#import "TwitterClient.h"
@interface TweetListDataStore()

@end
@implementation TweetListDataStore

- (instancetype) init
{
    self = [super init];
    self.params = [[NSMutableDictionary alloc] init];
    self.params[@"count"] = @(self.limit);
    return self;
}

- (void)loadNextBunchWithSuccess:(ApiSuccessBlock)success failure:(ApiFailureBlock)failure
{
    [self beginWithSuccess:success failure:failure];
}

- (void)fetchDataWithSuccess:(ApiSuccessBlock)success failure:(ApiFailureBlock)failure
{
    //params[@"since_id"] =
    //if (self.data
    NSLog(@"params::%@", self.params);
    [[TwitterClient sharedInstance] getHomeTimelineWithParams:self.params completion:^(TweetList *tweetList, NSError *error) {
        success(nil, tweetList);
    }];
  //  [[self service] getMessageBoardListWithCriteria:[self criteria] range:[self range] success:success failure:failure];
}

- (void)populateDataWithResponse:(id)response
{
    NSLog(@"response:%@", response);
    TweetList *tweetList = (TweetList *)response;
    
    if([tweetList.tweets count] > 0) {
        self.totalCount = self.totalCount  + [tweetList.tweets count];
        [[self data] addObjectsFromArray:tweetList.tweets];
        self.params[@"since_id"] = [tweetList getLastTweetId];
    }
}

@end
