//
//  BaseDataStore.m
//  Twitter
//
//  Created by Anson Ng on 6/30/15.
//  Copyright (c) 2015 Anson Ng. All rights reserved.
//

#import "BaseDataStore.h"

@implementation BaseDataStore
- (instancetype) init
{
    self = [super init];
    self.data = [[NSMutableArray alloc] init];
    self.offset = 0;
    self.limit = 20;
    return self;
}

- (void)loadNextBunchWithSuccess:(ApiSuccessBlock)success failure:(ApiFailureBlock)failure
{
        [self beginWithSuccess:success failure:failure];
}

- (void)beginWithSuccess:(ApiSuccessBlock)success failure:(ApiFailureBlock)failure
{
    
    [self fetchDataWithSuccess:^(AFHTTPRequestOperation *operation, id response) {
        [self populateDataWithResponse:response];
    success(operation, response);
    } failure:^(AFHTTPRequestOperation *operation, NSError *err) {
        failure(operation ,err);
    }];
}

- (void)reloadWithCleanUp:(ApiSuccessBlock)success failure:(ApiFailureBlock)failure
{
    self.offset = 0;
    self.data = [[NSMutableArray alloc] init];
    self.totalCount =0;
    
    [self fetchDataWithSuccess:^(AFHTTPRequestOperation *operation, id response) {
        [self populateDataWithResponse:response];
        success(operation, response);
    } failure:^(AFHTTPRequestOperation *operation, NSError *err) {
        failure(operation ,err);
    }];

    
}
- (void)fetchDataWithSuccess:(ApiSuccessBlock)success failure:(ApiFailureBlock)failure
{
    
   // [[self service] getMessageBoardListWithCriteria:[self criteria] range:[self range] success:success failure:failure];
}

- (void)populateDataWithResponse:(id)response
{

}


@end
