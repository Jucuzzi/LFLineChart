# LFLineChart
An iOS line chart to show data in line view
![](https://github.com/Jucuzzi/LFLineChart/blob/master/Preview.jpg)
## 如何使用
### 然后你只需要在需要使用到的地方加入以下代码
```c
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
```
### 其中需要重点设置的是这几个属性
```c
y轴最大值：self.lineChart.maxValue
x轴间距：self.lineChart.xScaleMarkLEN
y轴坐标显示值（已隐去）：self.lineChart.yMarkTitles
x轴坐标显示值：[self.lineChart setXMarkTitlesAndValues:orderedArray titleKey:@"item" valueKey:@"count"];
```
## 使用要求
iOS8.0及以上
## 关于控件的使用背景
优雅的带有渐变色的折线图，需要纵坐标可以自行加上，图比较简洁清晰，希望可以满足大家的需求
有问题可以及时反馈给我

email：917609510@qq.com

