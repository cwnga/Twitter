//
//  CalculatorHelper.h
//  YDevelopKit
//
//  Created by Jeff Lin on 5/21/15.
//  Copyright (c) 2015 Yahoo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

/**
 *  @brief Get random float value between bound
 *
 *  @param maxBound
 *  @param minBound
 *
 *  @return <#return value description#>
 */
CGFloat randomFloatnumber(CGFloat maxBound, CGFloat minBound);

/**
 *  @brief Calculate currect discount level
 *
 *  @param price            sell price
 *  @param marketPrice      origin price
 *
 *  @return 0.0 for no discount, NAN for marketPrice <= price or 0.1%
 */
CGFloat getDiscountFromPrices(CGFloat price, CGFloat marketPrice);

/**
 *  @brief change the input frame's height to zero
 *
 *  @param Frame  input a CGRect Frame
 *
 *  @return original width, zero height CGRect
 */
CGRect shrinkToZeroHeight(CGRect Frame);

/**
 *  @brief change the input frame's width to screen wide
 *
 *  @param Frame  input a CGRect Frame
 *
 *  @return original height, screen wide CGRect
 */
CGRect extendToScreenWidth(CGRect Frame);

/**
 *  @brief return a device's CGSize with screen wide but zero height.
 *
 *  @return Expected CGSize.
 */
CGSize cgSizeZeroHeight();

/**
 *  @brief return a device's screen size.
 *
 *  @return Expected CGSize.
 */
CGSize screenSize();
