//
//  LFCircleView.m
//  LFLineChart
//
//  Created by 王力丰 on 2018/2/7.
//  Copyright © 2018年 LiFeng Wang. All rights reserved.
//

#import "LFCircleView.h"

@implementation LFCircleView

- (instancetype)initWithCenter:(CGPoint)center radius:(CGFloat)radius {
    
    self = [super init];
    
    if (self) {
        self.frame = CGRectMake(center.x - radius, center.y - radius, radius * 2.0, radius * 2.0);
        self.backgroundColor = [UIColor whiteColor];
        self.layer.cornerRadius = radius;
        self.layer.masksToBounds = YES;
    }
    return self;
}

- (void)setBorderWidth:(CGFloat)borderWidth {
    _borderWidth = borderWidth;
    self.layer.borderWidth = borderWidth;
}

- (void)setBorderColor:(UIColor *)borderColor {
    _borderColor = borderColor;
    self.layer.borderColor = borderColor.CGColor;
}

@end
