//
//  BaseCollectionViewCell.m
//  Twitter
//
//  Created by Anson Ng on 6/28/15.
//  Copyright (c) 2015 Anson Ng. All rights reserved.
//

#import "BaseCollectionViewCell.h"

@interface BaseCollectionViewCell ()

@property (strong, nonatomic) CALayer *borderLayer;

@end


@implementation BaseCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) {
        [self setupComponent];
    }
    
    return self;
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    [self setupComponent];
}

- (void)setupComponent
{
    self.borderLayer = [CALayer layer];
    self.borderLayer.backgroundColor = [UIColor grayColor].CGColor;
    
    [self.contentView.layer addSublayer:self.borderLayer];
}

- (void)setBorderColor:(UIColor *)borderColor
{
    _borderColor = borderColor;
    self.borderLayer.backgroundColor = borderColor.CGColor;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    CGFloat borderWidth = CGRectGetWidth(self.frame) - self.leadingMargin - self.tailingMargin;
    CGFloat borderHeight = (self.borderHeight) ? self.borderHeight : 1.0f;
    CGFloat borderX = self.leadingMargin;
    CGFloat borderY = CGRectGetHeight(self.frame) - borderHeight;
    
    [CATransaction begin];
    [CATransaction setValue:@(YES) forKey:kCATransactionDisableActions];
    self.borderLayer.frame = CGRectMake(borderX, borderY, borderWidth, borderHeight);
    [CATransaction commit];
}

@end
