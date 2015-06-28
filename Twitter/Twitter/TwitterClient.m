//
//  TwitterClient.m
//  Twitter
//
//  Created by Anson Ng on 6/28/15.
//  Copyright (c) 2015 Anson Ng. All rights reserved.
//

#import "TwitterClient.h"
#import "Tweet.h"
NSString * const kTwitterCumsumerKey = @"yXEm8MC63kGlbq0OCtuxFvEIZ";
NSString * const kTwitterConsumerSecret = @"oF1AlLdDW4a9zpvYOen4gARoLjfDRELq34hpPwsVP1wbPp5bka";
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

- (void) loginWithCompletion:(void (^)(User *user, NSError *error))completion
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
            User *user =[[User alloc] initWithDictionary:responseObject];
               NSLog(@"openURL user::%@", user);
            
            
            [User setCurrentUser:user];
            NSLog(@"openURL current user: %@", user.name);
            self.loginCompletion(user, nil);
            
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            NSLog(@"fail get current user, %@", error);
            self.loginCompletion(nil, error);
            
        }];
        
        
//        [[TwitterClient sharedInstance] GET:@"1.1/statuses/home_timeline.json" parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
//            // NSLog(@"tweets, %@", responseObject);
//            
//            NSArray *tweets = [Tweet tweetsWithArray:responseObject];
//            for (Tweet *tweet in tweets) {
//                NSLog(@"tweet: %@, created:%@ ,", tweet.text, tweet.createdAt);
//            }
//        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//            NSLog(@"fail get tweets, %@", error);
//            
//        }];
//        
    } failure:^(NSError *error) {
        NSLog(@"fail got the access token!");
              self.loginCompletion(nil, error);
        
    }];

    
}

- (void)homeTimelineWithParams:(NSDictionary *)params completion:(void (^)(NSArray *tweets, NSError *error))completion
{
    [self GET:@"1.1/statuses/home_timeline.json" parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        //<#code#>
        NSArray *tweets = [Tweet tweetsWithArray:responseObject];
        completion(tweets, nil);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        //<#code#>
        completion(nil, error);
    }
     ];
}

@end
