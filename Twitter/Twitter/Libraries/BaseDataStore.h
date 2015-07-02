//
//  BaseDataStore.h
//  Twitter
//
//  Created by Anson Ng on 6/30/15.
//  Copyright (c) 2015 Anson Ng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Const.h"

@interface BaseDataStore : NSObject
@property (strong, nonatomic) NSMutableArray *data;
@property (assign, nonatomic) NSInteger offset;
@property (assign, nonatomic) NSInteger limit;
@property (assign, nonatomic) NSInteger totalCount;

- (void)reloadWithCleanUp:(ApiSuccessBlock)success failure:(ApiFailureBlock)failure;
- (void)loadNextBunchWithSuccess:(ApiSuccessBlock)success failure:(ApiFailureBlock)failure;
- (void)beginWithSuccess:(ApiSuccessBlock)success failure:(ApiFailureBlock)failure;
- (void)fetchDataWithSuccess:(ApiSuccessBlock)success failure:(ApiFailureBlock)failure;
- (void)populateDataWithResponse:(id)response;


@end
