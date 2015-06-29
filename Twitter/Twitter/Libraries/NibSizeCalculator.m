//
//  NibSizeCalculator.m
//  YDevelopKit
//
//  Created by Chih Feng Sung on 10/21/13.
//  Copyright (c) 2013 Yahoo. All rights reserved.
//

#import "NibSizeCalculator.h"

@interface NibSizeCalculator ()

@property (nonatomic, strong) NSMutableDictionary *nibSizeDict;

@end

@implementation NibSizeCalculator

+ (id)sharedInstance
{
    static NibSizeCalculator *instance = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        @synchronized(self) {
            instance = [[NibSizeCalculator alloc] init];
            instance.nibSizeDict = [[NSMutableDictionary alloc] init];
        }
    });
    
    return instance;
}


- (CGSize)sizeForNibNamed:(NSString *)nibName
{
    return  [[NibSizeCalculator sharedInstance] sizeForNibNamed:nibName withstyle:NibDefaultScaling];
}


- (CGSize)sizeForNibNamed:(NSString *)nibName withstyle:(NibSizeStyle)style
{
    return [self sizeForNibNamed:nibName withstyle:style fitSize:screenSize()];
}

- (CGSize)sizeForNibNamed:(NSString *)nibName withstyle:(NibSizeStyle)style fitSize:(CGSize)containerSize
{
    CGSize nibSize = cgSizeZeroHeight();
    NSString *nibWithStyle = [NSString stringWithFormat:@"%@_%lu", nibName, (unsigned long)style];
    if ([self.nibSizeDict objectForKey:nibWithStyle]) {
        NSString *sizeString = [self.nibSizeDict objectForKey:nibWithStyle];
        nibSize = CGSizeFromString(sizeString);
    } else {
        UIView *nibView = [[[NSBundle mainBundle] loadNibNamed:nibName owner:self options:nil] lastObject];
        if (nibView != nil) {
            nibSize = nibView.bounds.size;
            CGSize targetSize = containerSize;
            CGFloat ratio = targetSize.width / nibSize.width;
            CGFloat ratioNibHeight = ratio * nibSize.height;
            CGFloat heightAdjustment = (ratioNibHeight - screenSize().width) / ratio;
            
            switch (style) {
                case NibOriginalSize:
                    break;
                case NibBottomFixedScaliing:
                    nibSize.width = ratio * nibSize.width;
                    nibSize.height = targetSize.width + heightAdjustment;
                    break;
                case NibFixedHeightScaling:
                    nibSize.width = ratio * nibSize.width;
                    nibSize.height = nibSize.height;
                    break;
                case NibDefaultScaling:
                default:
                    nibSize.width = ratio * nibSize.width;
                    nibSize.height = ratio * nibSize.height;
                    break;
            }
            [self.nibSizeDict setObject:NSStringFromCGSize(nibSize) forKey:nibWithStyle];
        }
    }
    return nibSize;
}

@end
