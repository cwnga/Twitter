//
//  NibSizeCalculator.h
//  YDevelopKit
//
//  Created by Chih Feng Sung on 10/21/13.
//  Copyright (c) 2013 Yahoo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "CalculatorHelper.h"

typedef NS_ENUM(NSUInteger, NibSizeStyle) {
    NibOriginalSize = 0,
    NibDefaultScaling,
    NibBottomFixedScaliing,
    NibFixedHeightScaling
};


@interface NibSizeCalculator : NSObject

/**
 * @brief Geting a shared instance of NibSizeCalculator.
 *
 * @return Instance of NibSizeCalculator.
 */
+ (id)sharedInstance;

/**
 * @brief This is a method for nibsize calculation with default style.
 *
 * @param nibName input nibfile identifier, shoulf be in string.
 *
 * @return CGSize of the calculated nibfile.
 */
- (CGSize)sizeForNibNamed:(NSString *)nibName;

/**
 * @brief This is a method for nibsize calculation, various of calculation style parameter can be input here
 *
 * @param nibName input nibfile identifier, shoulf be in string
 *
 * @param style There are currently 5 types of style, as following:
 *        NibOriginalSize = return original nibfile size,
 *                          e.g. input nibsize  = (320, 480),
 *                          output size = (320, 480),
 *                          used in little occations
 *      NibDefaultScaling = return aspect ratio fill nibfile size,
 *                          e.g. input nibsize  = (320, 480) screenwidth = 640.0f,
 *                          output size = (640, 960),
 *                          often used for banner cells, text cells and pure pic cells
 * NibBottomFixedScaliing = return aspect scaled for the image part, but original height for the text field part nibfile size,
 *                          e.g. input nibsize  = (320, 480) screenwidth = 640.0f,
 *                          output size = (640, 800),
 *                          often used for largecell and discovery item cells
 *
 *  NibFixedHeightScaling = return width scaled to screen, height fixed to nibsize,
 *                          e.g. input nibsize  = (320, 480) screenwidth = 640.0f,
 *                          output size = (640, 480),
 *                          often used for pure text cells, since fontsize does not scale up in autolayout
 *
 * @return CGSize of the calculated nibfile.
 */
- (CGSize)sizeForNibNamed:(NSString *)nibName withstyle:(NibSizeStyle)style;

/**
 * @brief  Same as sizeForNibNamed:, use assigned size instead
 *
 * @param nibName input nibfile identifier, shoulf be in string
 *
 * @param style same as sizeForNibNamed:
 *
 * @param containerSize bounds that nib file will fit.
 *
 * @return CGSize of the calculated nibfile.
 */
- (CGSize)sizeForNibNamed:(NSString *)nibName withstyle:(NibSizeStyle)style fitSize:(CGSize)containerSize;


@end
