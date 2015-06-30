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
@interface TwitterClient : BDBOAuth1RequestOperationManager

+ (TwitterClient *)sharedInstance;


- (void)getHomeTimelineWithParams:(NSDictionary *)params completion:(void (^)(TweetList *tweetList, NSError *error))completion;
//login
- (void) loginWithCompletionv1:(void (^)(User_NOUSE *user, NSError *error))completion;
- (void) openURLv1:(NSURL *)url;

//login

- (void) loginWithCompletion:(void (^)(User *user, NSError *error))completion;
- (void) openURL:(NSURL *)url;

//normal
- (void)getHomeTimelineWithParams:(NSDictionary *)params completionV1:(void (^)(NSArray *tweets, NSError *error))completion;

@end
