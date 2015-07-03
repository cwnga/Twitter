//
//  PosterCollectionViewCell.m
//  Twitter
//
//  Created by Anson Ng on 7/2/15.
//  Copyright (c) 2015 Anson Ng. All rights reserved.
//

#import "TweetDetailPosterCollectionViewCell.h"

@implementation TweetDetailPosterCollectionViewCell

- (void)awakeFromNib {
    // Initialization code
}
- (IBAction)tapRely:(id)sender {
    if (self.delegate) {
        [self.delegate tapReplyDelegate:self tweet:nil];
    }
}
- (IBAction)tapRetweet:(id)sender {
    
    if (self.delegate) {
        [self.delegate tapRetweetDelegate:self tweet:nil];
    }
}
- (IBAction)tapFavorite:(id)sender {
    
    if (self.delegate) {
        [self.delegate tapFavoriteDelegate:self tweet:nil];
    }
}


- (void)prepareForReuse
{
    [super prepareForReuse];
    self.userImageView.image = [UIImage imageNamed:@"default_profile"];
    [self.replyButton setSelected:NO];
    [self.retweetButton setSelected:NO];
    [self.favoriteButton setSelected:NO];
}


@end
