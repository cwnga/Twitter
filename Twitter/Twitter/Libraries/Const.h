//
//  Const.h
//  Twitter
//
//  Created by Anson Ng on 6/30/15.
//  Copyright (c) 2015 Anson Ng. All rights reserved.
//

//#ifndef Twitter_Const_h
//#define Twitter_Const_h
#import "AFHTTPRequestOperation.h"
typedef void(^ApiSuccessBlock)(AFHTTPRequestOperation *operation, id response);
typedef void(^ApiFailureBlock)(AFHTTPRequestOperation *operation, NSError *err);
extern NSString * UserDidLoginNotification;
extern NSString * UserDidLogoutNotification;

//#endif
