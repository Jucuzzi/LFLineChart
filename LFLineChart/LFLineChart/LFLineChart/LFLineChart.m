//
//  LFLineChart.m
//  LFLineChart
//
//  Created by 王力丰 on 2018/2/7.
//  Copyright © 2018年 LiFeng Wang. All rights reserved.
//

#import "LFLineChart.h"

#import "LFChartLineView.h"
#import "LFAxisView.h"

@interface LFLineChart() {
    
    NSMutableArray *xMarkTitles;
    NSMutableArray *valueArray;
    
}

/**
 *  表名标签
 */
@property (nonatomic, strong) UILabel *titleLab;

/**
 *  显示折线图的可滑动视图
 */
@property (nonatomic, strong) UIScrollView *scrollView;

/**
 *  折线图
 */
@property (nonatomic, strong) LFChartLineView *chartLineView;

/**
 *  X轴刻度标签 和 对应的折线图点的值
 */
@property (nonatomic, strong) NSArray *xMarkTitlesAndValues;

@end

@implementation LFLineChart

- (void)setXScaleMarkLEN:(CGFloat)xScaleMarkLEN {
    _xScaleMarkLEN = xScaleMarkLEN;
}

- (void)setYMarkTitles:(NSArray *)yMarkTitles {
    _yMarkTitles = yMarkTitles;
}

- (void)setMaxValue:(CGFloat)maxValue {
    _maxValue = maxValue;
    
}

- (void)setTitle:(NSString *)title {
    _title = title;
    
}

- (void)setXMarkTitlesAndValues:(NSArray *)xMarkTitlesAndValues titleKey:(NSString *)titleKey valueKey:(NSString *)valueKey {
    
    _xMarkTitlesAndValues = xMarkTitlesAndValues;
    
    if (xMarkTitles) {
        [xMarkTitles removeAllObjects];
    }
    else {
        xMarkTitles = [NSMutableArray arrayWithCapacity:0];
        
    }
    
    if (valueArray) {
        [valueArray removeAllObjects];
    }
    else {
        valueArray = [NSMutableArray arrayWithCapacity:0];
    }
    
    for (NSDictionary *dic in xMarkTitlesAndValues) {
        
        [xMarkTitles addObject:[dic objectForKey:titleKey]];
        [valueArray addObject:[dic objectForKey:valueKey]];
    }
}

#pragma mark 绘图
- (void)mapping {
    
    static CGFloat topToContainView = 0.f;
    
    if (self.title) {
        
        self.titleLab = [[UILabel alloc] initWithFrame:CGRectMake(0, 5, CGRectGetWidth(self.frame), 20)];
        self.titleLab.text = self.title;
        self.titleLab.font = [UIFont systemFontOfSize:15];
        self.titleLab.textAlignment = NSTextAlignmentCenter;
        [self addSubview:self.titleLab];
        topToContainView = 25;
    }
    
    if (!self.xMarkTitlesAndValues) {
        
        xMarkTitles = @[@1,@2,@3,@4,@5].mutableCopy;
        valueArray = @[@2,@2,@2,@2,@2].mutableCopy;
        
        NSLog(@"折线图需要一个显示X轴刻度标签的数组xMarkTitles");
        NSLog(@"折线图需要一个转折点值的数组valueArray");
    }
    
    
    if (!self.yMarkTitles) {
        self.yMarkTitles = @[@0,@1,@2,@3,@4,@5];
        NSLog(@"折线图需要一个显示Y轴刻度标签的数组yMarkTitles");
    }
    
    
    if (self.maxValue == 0) {
        self.maxValue = 5;
        NSLog(@"折线图需要一个最大值maxValue");
        
    }
    
    self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, topToContainView, self.frame.size.width,self.frame.size.height - topToContainView)];
    [self.scrollView setShowsHorizontalScrollIndicator:NO];
    [self.scrollView setShowsVerticalScrollIndicator:NO];
    [self addSubview:self.scrollView];
    
    self.chartLineView = [[LFChartLineView alloc] initWithFrame:self.scrollView.bounds];
    
    self.chartLineView.yMarkTitles = self.yMarkTitles;
    self.chartLineView.xMarkTitles = xMarkTitles;
    self.chartLineView.xScaleMarkLEN = self.xScaleMarkLEN;
    self.chartLineView.valueArray = valueArray;
    self.chartLineView.maxValue = self.maxValue;
    
    [self.scrollView addSubview:self.chartLineView];
    __block NSUInteger i = 0;
    [valueArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([obj isEqualToString:@"-1"]) {
            i = idx;
            *stop = YES;
        }
    }];
    if (i >6) {
        self.scrollView.contentOffset = CGPointMake(self.xScaleMarkLEN *(i - 6) ,0);
    }
    
    
    [self.chartLineView mapping];
    
    self.scrollView.contentSize = self.chartLineView.bounds.size;
    
}

#pragma mark 更新数据
- (void)reloadDatas {
    [self.chartLineView reloadDatas];
}
@end
