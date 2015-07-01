//
//  TweetListCollectionViewCell.h
//  Twitter
//
//  Created by Anson Ng on 6/28/15.
//  Copyright (c) 2015 Anson Ng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseCollectionViewCell.h"
@class TweetListCollectionViewCell;
@protocol TweetListCollectionViewCellDelegate <NSObject>

- (void) tapReplyButtonEvent:(TweetListCollectionViewCell *)tweetListCollectionViewCell;

- (void) tapRetweetButtonEvent:(TweetListCollectionViewCell *)tweetListCollectionViewCell;

- (void) tapAddFavoriteButtonEvent:(TweetListCollectionViewCell *)tweetListCollectionViewCell;

- (void) tapRemoveFavoriteButtonEvent:(TweetListCollectionViewCell *)tweetListCollectionViewCell;


@end
@interface TweetListCollectionViewCell : BaseCollectionViewCell

@property (weak, nonatomic) IBOutlet UILabel *userNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *tweetLabel;
@property (weak, nonatomic) IBOutlet UIImageView *userProfileImageView;
@property (weak, nonatomic) id <TweetListCollectionViewCellDelegate> delegate;
@end
