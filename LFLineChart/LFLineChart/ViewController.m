//
//  ViewController.m
//  LFLineChart
//
//  Created by 王力丰 on 2018/2/7.
//  Copyright © 2018年 LiFeng Wang. All rights reserved.
//

#import "ViewController.h"
#import "LFLineChart.h"

@interface ViewController (){}
@property (nonatomic, strong) LFLineChart *lineChart;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initView];
}

- (void)initView {
    // 初始化折线图
    self.lineChart = [[LFLineChart alloc] initWithFrame:CGRectMake(10, 80, [UIScreen mainScreen].bounds.size.width - 20, [UIScreen mainScreen].bounds.size.width *3/5)];
    self.lineChart.backgroundColor = [UIColor whiteColor];
    // 设置折线图属性
    self.lineChart.title = @""; // 折线图名称
    NSMutableArray *orderedArray = [[NSMutableArray alloc]init];
    float max = 0;
    for(int i = 0; i < 24; i++){
        NSMutableDictionary *dict = [[NSMutableDictionary alloc] init];
        NSString *xValue;
        NSString *yValue;
        if (i<10) {
            xValue = [NSString stringWithFormat:@"0%d:00",i];
        } else {
            xValue = [NSString stringWithFormat:@"%d:00",i];
        }
        yValue = [NSString stringWithFormat:@"%u",arc4random() % 100];
        if ([yValue floatValue]>max) {
            max = [yValue floatValue];
        }
        dict = [@{
                  @"item" : xValue, @"count":yValue
                  } mutableCopy];
        [orderedArray addObject:dict];
    }
    
    self.lineChart.maxValue = max;
    if (max == 0) {
        self.lineChart.maxValue = 5;
    }
    self.lineChart.xScaleMarkLEN = 60;
    self.lineChart.yMarkTitles = @[@"0",[NSString stringWithFormat:@"%.2lf",max/5],[NSString stringWithFormat:@"%.2lf",max*2/5],[NSString stringWithFormat:@"%.2lf",max*3/5],[NSString stringWithFormat:@"%.2lf",max*4/5],[NSString stringWithFormat:@"%.2lf",max]]; // Y轴刻度标签
    
    [self.lineChart setXMarkTitlesAndValues:orderedArray titleKey:@"item" valueKey:@"count"]; // X轴刻度标签及相应的值
    
    //设置完数据等属性后绘图折线图
    [self.lineChart mapping];
    [self.view addSubview:self.lineChart];
    //头顶上的时间标志
    UILabel * unitLabel = [[UILabel alloc]initWithFrame:CGRectMake(20, 60, 100, 15)];
    unitLabel.text = @"电量(度)";
    unitLabel.textColor = [UIColor lightGrayColor];
    unitLabel.font = [UIFont systemFontOfSize:15.f];
    [self.view addSubview:unitLabel];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
