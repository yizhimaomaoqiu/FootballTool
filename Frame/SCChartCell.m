//
//  TableViewCell.m
//  UUChartView
//
//  Created by shake on 15/1/4.
//  Copyright (c) 2015年 uyiuyao. All rights reserved.
//

#import "SCChartCell.h"
#import "SCChart.h"

@interface SCChartCell ()<SCChartDataSource>
{
    NSIndexPath *path;
    SCChart *chartView;
}
@property (nonatomic, strong)UILabel *lab;
@end

@implementation SCChartCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self creatUI];
    }
    return self;
}

- (void)creatUI{
    
    self.lab = [[UILabel alloc]initWithFrame:CGRectMake(10, 10, SCREEN_WIDTH - 20, 70)];
    self.lab.backgroundColor = [UIColor clearColor];
    self.lab.textColor = [UIColor blackColor];
    self.lab.textAlignment = NSTextAlignmentCenter;
    self.lab.font = [UIFont systemFontOfSize:15];
    self.lab.numberOfLines = 0;
    [self.contentView addSubview:self.lab];
    
}

- (void)setStr:(NSString *)str{
    _str = str;
    self.lab.text = str;
}

- (void)configUI{
    if (!chartView) {
        chartView = [[SCChart alloc] initwithSCChartDataFrame:CGRectMake(40, 90, SCREEN_WIDTH - 80, SCREEN_WIDTH - 80)
                                                   withSource:self
                                                    withStyle:SCChartLineStyle];
        [chartView showInView:self.contentView];
    }
    [chartView strokeChart];
}

#pragma mark - @required
//横坐标标题数组
- (NSArray *)SCChart_xLableArray:(SCChart *)chart {
    return @[@"初指", @"即指"];
}

//数值多重数组
- (NSArray *)SCChart_yValueArray:(SCChart *)chart {
    return self.Yarr;
}

#pragma mark - @optional
//颜色数组
- (NSArray *)SCChart_ColorArray:(SCChart *)chart {
    return @[[UIColor redColor],[UIColor greenColor],[UIColor blueColor]];
}

#pragma mark 折线图专享功能
//标记数值区域
- (CGRange)SCChartMarkRangeInLineChart:(SCChart *)chart {
    return CGRangeMake(20, 20);
}

//判断显示横线条
- (BOOL)SCChart:(SCChart *)chart ShowHorizonLineAtIndex:(NSInteger)index {
    return YES;
}

//判断显示最大最小值
- (BOOL)SCChart:(SCChart *)chart ShowMaxMinAtIndex:(NSInteger)index {
    return NO;
}
@end
