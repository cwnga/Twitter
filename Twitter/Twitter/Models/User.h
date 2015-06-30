//
//  User.h
//  Twitter
//
//  Created by Anson Ng on 6/29/15.
//  Copyright (c) 2015 Anson Ng. All rights reserved.
//

#import "BaseJsonModel.h"

@interface User : BaseJsonModel
@property (strong, nonatomic) NSString* userId;
@property (strong, nonatomic) NSString* name;
@property (strong, nonatomic) NSString* descriptionString;
@property (strong, nonatomic) NSString* location;
@property (strong, nonatomic) NSString* profileImageUrl;
@property (strong, nonatomic) NSString* screenName;
@end
