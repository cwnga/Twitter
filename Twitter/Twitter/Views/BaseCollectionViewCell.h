//
//  BaseCollectionViewCell.h
//  Twitter
//
//  Created by Anson Ng on 6/28/15.
//  Copyright (c) 2015 Anson Ng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseCollectionViewCell : UICollectionViewCell

/**
 * @brief Setting leading margin distance for cell.
 */
@property (assign, nonatomic) CGFloat leadingMargin;

/**
 * @brief Setting tailing margin distance for cell.
 */
@property (assign, nonatomic) CGFloat tailingMargin;

/**
 * @brief Setting border color for cell.
 */
@property (strong, nonatomic) UIColor *borderColor;

/**
 * @brief Setting border height for cell.
 */
@property (assign, nonatomic) CGFloat borderHeight;


/**
 * @brief Default set up component method.
 */
- (void)setupComponent;

@end
