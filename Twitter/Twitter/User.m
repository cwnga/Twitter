//
//  User.m
//  Twitter
//
//  Created by Anson Ng on 6/28/15.
//  Copyright (c) 2015 Anson Ng. All rights reserved.
//

#import "User.h"

@implementation User
- (instancetype)initWithDictionary: (NSDictionary *)dictionary
{
    self = [super init];
    if (self) {
        self.name = dictionary[@"name"];
        self.screenname = dictionary[@"screen)name"];
        self.profileImageUrl = dictionary[@"profile_image_url"];
        self.tagline = dictionary[@"description"];
    }
    return self;
}
@end
