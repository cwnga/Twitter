//
//  TweetListCollectionViewCell.m
//  Twitter
//
//  Created by Anson Ng on 6/28/15.
//  Copyright (c) 2015 Anson Ng. All rights reserved.
//

#import "TweetListCollectionViewCell.h"
@interface TweetListCollectionViewCell()



@end

@implementation TweetListCollectionViewCell


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self setupView];
    }
    return self;
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    [self setupView];
}

- (void)setupView
{
    
    self.borderHeight = 1.0f;
    self.borderColor = [UIColor grayColor];
    [self setBackgroundColor: [UIColor whiteColor]];
}

- (void)prepareForReuse
{
    [super prepareForReuse];
}

- (IBAction)tapReplayButton:(id)sender
{
    
    if (self.delegate) {
        [self.delegate tapReplyDelegate:self tweet:self.tweet];
    }
}

- (IBAction)tapRetweetButton:(id)sender
{
    
    if (self.delegate) {
        [self.delegate tapRetweetDelegate:self tweet:self.tweet];
    }
}
- (IBAction)tapFavoriteButton:(id)sender
{
    if (self.delegate) {
        [self.delegate tapFavoriteDelegate:self tweet:self.tweet];
    }
}

@end
