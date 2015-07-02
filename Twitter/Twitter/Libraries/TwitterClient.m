//
//  TwitterClient.m
//  Twitter
//
//  Created by Anson Ng on 6/28/15.
//  Copyright (c) 2015 Anson Ng. All rights reserved.
//

#import "TwitterClient.h"
#import "Tweet_NOUSE.h"
#import "AccountManager.h"
NSString * const kTwitterCumsumerKey = @"yXEm8MC63kGlbq0OCtuxFvEIZ";
NSString * const kTwitterConsumerSecret = @"oF1AlLdDW4a9zpvYOen4gARoLjfDRELq34hpPwsVP1wbPp5bka";
//NSString * const kTwitterCumsumerKey = @"B6sA1AwNT52H5Lm6QqOaVw7b1";
//NSString * const kTwitterConsumerSecret = @"ZiInXEV5tcoEISpdZYcBWQbKo38c0ir3t4kTt8gRqOJpGgBgRq";

//Consumer Key (API Key)	B6sA1AwNT52H5Lm6QqOaVw7b1
//Consumer Secret (API Secret)	ZiInXEV5tcoEISpdZYcBWQbKo38c0ir3t4kTt8gRqOJpGgBgRq

NSString * const kTwitterBaseUrl = @"https://api.twitter.com";
@interface TwitterClient()

@property (strong, nonatomic) void (^loginCompletion) (User *user, NSError *error);
@end
@implementation TwitterClient
+ (TwitterClient *)sharedInstance
{
    static TwitterClient *instance = nil;
    static dispatch_once_t onceToken;
   // dispatch_one(&onceToken,
    dispatch_once(&onceToken, ^{
        if (instance == nil) {
            NSURL *baseUrl = [[NSURL alloc] initWithString:kTwitterBaseUrl] ;
            instance = [[TwitterClient alloc]initWithBaseURL:baseUrl consumerKey:kTwitterCumsumerKey consumerSecret:kTwitterConsumerSecret];
        }
    });
    
    return instance;
}

#pragma mark - real

- (void) loginWithCompletion:(void (^)(User *user, NSError *error))completion;
{
    self.loginCompletion = completion;
    [self.requestSerializer removeAccessToken];
    [self fetchRequestTokenWithPath:@"oauth/request_token" method:@"GET" callbackURL: [[NSURL alloc] initWithString:@"cptwitterdemo://oauth"] scope:nil success:^(BDBOAuth1Credential *requestToken) {
        NSLog(@"got the request token!");
        NSURL *authURL = [NSURL URLWithString:[NSString stringWithFormat:@"https://api.twitter.com/oauth/authorize?oauth_token=%@", requestToken.token]];
        [[UIApplication sharedApplication] openURL:authURL];
    } failure:^(NSError *error) {
        NSLog(@"fail to got the request token!");
        self.loginCompletion(nil, error);
        
    }];
    
    
}

-(void) openURL:(NSURL *)url
{
    [self fetchAccessTokenWithPath:@"oauth/access_token" method:@"POST" requestToken:[BDBOAuth1Credential credentialWithQueryString:url.query] success:^(BDBOAuth1Credential *accessToken) {
        NSLog(@"got the access token!");
        
        [self GET:@"1.1/account/verify_credentials.json" parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
            // NSLog(@"get current user, %@", responseObject);
            NSLog(@"openUrl::%@", responseObject);
            AccountManager *accountManager = [[AccountManager alloc] init];
            NSError *error = nil;
            User *user =[[User alloc] initWithDictionary:responseObject error:&error];
            [AccountManager setCurrentUser:user];
            self.loginCompletion(user, nil);
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            NSLog(@"fail get current user, %@", error);
            self.loginCompletion(nil, error);
        }];
        
    } failure:^(NSError *error) {
        self.loginCompletion(nil, error);
        
    }];
}


- (void)getHomeTimelineWithParams:(NSDictionary *)params completion:(void (^)(TweetList *tweetList, NSError *error))completion
{
    [self GET:@"1.1/statuses/home_timeline.json" parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        //<#code#>
        NSError *error = Nil;
        TweetList *tweets = [TweetList tweetsWithArray:responseObject error:&error];
        completion(tweets, nil);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        //<#code#>
        completion(nil, error);
    }
     ];
}



- (void) insertNewPost:(NSString *)status completion:(ApiSuccessBlock)completion failure:(ApiFailureBlock)failure
{
    NSMutableDictionary *parameters = [[NSMutableDictionary alloc] init];
    parameters[@"status"] = status;
    
    [self POST:@"1.1/statuses/update.json" parameters:parameters success:completion failure:failure];
}

- (void) replyPost:(NSString *)status inReplyTweetId:(NSString *)tweetId completion:(ApiSuccessBlock)completion failure:(ApiFailureBlock)failure;
{
    NSMutableDictionary *parameters = [[NSMutableDictionary alloc] init];
    parameters[@"status"] = status;
    parameters[@"in_reply_to_status_id"] = tweetId;
    
    [self POST:@"1.1/statuses/update.json" parameters:parameters success:completion failure:failure];
}

- (void) addFavourite:(NSString *)tweetId completion:(ApiSuccessBlock)completion failure:(ApiFailureBlock)failure
{
    
    NSMutableDictionary *parameters = [[NSMutableDictionary alloc] init];

    parameters[@"id"] = tweetId;
    
    [self POST:@"1.1/favorites/create.json" parameters:parameters success:completion failure:failure];
    
}
- (void) removeFavourite:(NSString *)tweetId completion:(ApiSuccessBlock)completion failure:(ApiFailureBlock)failure
{
    NSMutableDictionary *parameters = [[NSMutableDictionary alloc] init];
    
    parameters[@"id"] = tweetId;
    
    [self POST:@"1.1/favorites/create.json" parameters:parameters success:completion failure:failure];
    
}


@end
