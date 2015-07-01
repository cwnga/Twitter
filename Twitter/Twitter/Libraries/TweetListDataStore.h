//
//  TweetListDataStore.h
//  Twitter
//
//  Created by Anson Ng on 7/1/15.
//  Copyright (c) 2015 Anson Ng. All rights reserved.
//

#import "BaseDataStore.h"

@interface TweetListDataStore : BaseDataStore

//@property (assign, nonatomic) NSInteger totalCount;
@property (strong, nonatomic) NSMutableDictionary *params;

@end
