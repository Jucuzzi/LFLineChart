//
//  LFAxisView.h
//  LFLineChart
//
//  Created by 王力丰 on 2018/2/7.
//  Copyright © 2018年 LiFeng Wang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LFAxisView : UIView

/**
 *  Y轴刻度标签
 */
@property (nonatomic, strong) NSArray *yMarkTitles;
/**
 *  X轴刻度标签
 */
@property (nonatomic, strong) NSArray *xMarkTitles;

/**
 *  与x轴平行的网格线的间距
 */
@property (nonatomic, assign) CGFloat xScaleMarkLEN;

/**
 *  网格线的起始点
 */
@property (nonatomic, assign) CGPoint startPoint;

/**
 *  x 轴长度
 */
@property (nonatomic, assign) CGFloat yAxis_L;
/**
 *  y 轴长度
 */
@property (nonatomic, assign) CGFloat xAxis_L;

/**
 *  绘图
 */
- (void)mapping;
/**
 *  更新做标注数据
 */
- (void)reloadDatas;

@end
