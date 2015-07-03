//
//  TwitterClient.h
//  Twitter
//
//  Created by Anson Ng on 6/28/15.
//  Copyright (c) 2015 Anson Ng. All rights reserved.
//

#import "BDBOAuth1RequestOperationManager.h"
#import "User_NOUSE.h"
#import "ModelList.h"
#import "Const.h"
@interface TwitterClient : BDBOAuth1RequestOperationManager

+ (TwitterClient *)sharedInstance;

//get home time line
- (void)getHomeTimelineWithParams:(NSDictionary *)params completion:(void (^)(TweetList *tweetList, NSError *error))completion;
//login
- (void) loginWithCompletion:(void (^)(User *user, NSError *error))completion;
- (void) openURL:(NSURL *)url;

//insert
- (void) insertNewPost:(NSString *)status completion:(ApiSuccessBlock)completion failure:(ApiFailureBlock)failure;

//reply
- (void) replyPost:(NSString *)status inReplyTweetId:(NSString *)tweetId completion:(ApiSuccessBlock)completion failure:(ApiFailureBlock)failure;

//retweet
- (void) retweetsWithTweetId:(NSString *)tweetId completion:(ApiSuccessBlock)completion failure:(ApiFailureBlock)failure;
//add favourite
- (void) addFavourite:(NSString *)tweetId completion:(ApiSuccessBlock)completion failure:(ApiFailureBlock)failure;
- (void) removeFavourite:(NSString *)tweetId completion:(ApiSuccessBlock)completion failure:(ApiFailureBlock)failure;
@end
