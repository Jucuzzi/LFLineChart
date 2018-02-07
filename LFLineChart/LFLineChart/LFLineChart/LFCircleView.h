//
//  LFCircleView.h
//  LFLineChart
//
//  Created by 王力丰 on 2018/2/7.
//  Copyright © 2018年 LiFeng Wang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LFCircleView : UIView

@property (nonatomic, assign) CGFloat borderWidth;
@property (nonatomic, assign) UIColor *borderColor;

- (instancetype)initWithCenter:(CGPoint)center radius:(CGFloat)radius;

@end
