//
//  Tweet.h
//  Twitter
//
//  Created by Anson Ng on 6/29/15.
//  Copyright (c) 2015 Anson Ng. All rights reserved.
//

#import "BaseJsonModel.h"
#import "User.h"

@protocol Tweet
@end

@interface Tweet : BaseJsonModel

@property (strong, nonatomic) NSString *tweetId;
@property (strong, nonatomic) NSString *text;
@property (strong, nonatomic) User *user;

@end
