//
//  OperationDelegate.h
//  Twitter
//
//  Created by Anson Ng on 7/1/15.
//  Copyright (c) 2015 Anson Ng. All rights reserved.
//

#ifndef Twitter_OperationDelegate_h
#define Twitter_OperationDelegate_h


#import <Foundation/Foundation.h>
#import "Tweet.h"
@protocol OperationDelegate <NSObject>

@required

- (void)tapReplyDelegate:(id)sender tweet:(Tweet *)tweet;
- (void)tapRetweetDelegate:(id)sender tweet:(Tweet *)tweet;
- (void)tapFavoriteDelegate:(id)sender tweet:(Tweet *)tweet;

@optional

@end
#endif
