//
//  TweetList.h
//  Twitter
//
//  Created by Anson Ng on 6/29/15.
//  Copyright (c) 2015 Anson Ng. All rights reserved.
//

#import "BaseJsonModel.h"
#import "Tweet.h"
@interface TweetList : BaseJsonModel
+ (instancetype) tweetsWithArray:(NSArray *)array error:(NSError *__autoreleasing *)error;

@property (strong, nonatomic) NSArray<Tweet> *tweets;

@end
