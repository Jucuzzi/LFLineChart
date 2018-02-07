//
//  LFChartLineView.h
//  LFLineChart
//
//  Created by 王力丰 on 2018/2/7.
//  Copyright © 2018年 LiFeng Wang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LFAxisView.h"

@interface LFChartLineView : LFAxisView

@property (nonatomic, strong) NSArray *valueArray;

@property (nonatomic, assign) CGFloat maxValue;

/**
 *  绘图
 */
- (void)mapping;

/**
 *  更新折线图数据
 */
- (void)reloadDatas;

@end
