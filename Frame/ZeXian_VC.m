//
//  ZeXian_VC.m
//  Frame
//
//  Created by 程国治 on 2018/7/23.
//  Copyright © 2018年 程国治. All rights reserved.
//

#import "ZeXian_VC.h"
#import "SCChart.h"
@interface ZeXian_VC ()<SCChartDataSource>

///是否添加平影响
@property (nonatomic, assign)BOOL isAddPing;
@property (nonatomic, strong)SCChart *chartView;
@end

@implementation ZeXian_VC

- (void)action{
    if (_pingArr){
        if (_isAddPing) {
            self.navigationItem.rightBarButtonItem.title = @"添加平影响";
            _isAddPing = NO;
            [self.chartView strokeChart];
        }else{
            self.navigationItem.rightBarButtonItem.title = @"取消平影响";
            _isAddPing = YES;
            [self.chartView strokeChart];
        }
    }else{
        [SVProgressHUD showErrorWithStatus:@"不存在平数组"];
    }
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIBarButtonItem *item = [[UIBarButtonItem alloc]initWithTitle:@"添加平影响" style:UIBarButtonItemStylePlain target:self action:@selector(action)];
    self.navigationItem.rightBarButtonItem = item;
    
    self.title = @"折线图";
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    SCChart *chartView = [[SCChart alloc] initwithSCChartDataFrame:CGRectMake(10, 100, [UIScreen mainScreen].bounds.size.width - 20, [UIScreen mainScreen].bounds.size.width - 20) withSource:self withStyle:SCChartLineStyle];
    [chartView showInView:self.view];
    self.chartView = chartView;

    UILabel *lab = [[UILabel alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(chartView.frame) + 50, [UIScreen mainScreen].bounds.size.width, 100)];
    lab.backgroundColor = [UIColor clearColor];
    lab.text = [NSString stringWithFormat:@"主:   %@\n客:   %@", [self.zhuArr componentsJoinedByString:@", "], [self.keArr componentsJoinedByString:@", "]];
    lab.textColor = [UIColor blackColor];
    lab.textAlignment = NSTextAlignmentCenter;
    lab.numberOfLines = 0;
    lab.font = Font(15);
    [self.view addSubview:lab];
}

- (NSArray *)SCChart_xLableArray:(SCChart *)chart {
    return @[@"20场", @"10场", @"6场"];
}

- (NSArray *)SCChart_yValueArray:(SCChart *)chart {
    if (_isAddPing){
        CGFloat ping20 = [_pingArr[0] floatValue] - [_pingArr[3] floatValue];
        CGFloat ping10 = [_pingArr[1] floatValue] - [_pingArr[4] floatValue];
        CGFloat ping6 = [_pingArr[2] floatValue] - [_pingArr[5] floatValue];
        NSArray *zhu = @[
                         @([_zhuArr[0] floatValue] + self.jiajianqiu - (ping20 > 0 ? (ping20 / 4) : 0)),
                         @([_zhuArr[1] floatValue] + self.jiajianqiu - (ping10 > 0 ? (ping10 / 4) : 0)),
                         @([_zhuArr[2] floatValue] + self.jiajianqiu - (ping6 > 0 ? (ping6 / 4) : 0))
                         ];
        NSArray *ke = @[
                        @([_keArr[0] floatValue] + (ping20 < 0 ? (ping20 / 4) : 0)),
                        @([_keArr[1] floatValue] + (ping10 < 0 ? (ping10 / 4) : 0)),
                        @([_keArr[2] floatValue] + (ping6 < 0 ? (ping6 / 4) : 0))
                        ];
        return @[zhu, ke];
    }else{
        NSArray *arr = @[@([_zhuArr[0] floatValue] + self.jiajianqiu), @([_zhuArr[1] floatValue] + self.jiajianqiu), @([_zhuArr[2] floatValue] + self.jiajianqiu)];
        return @[arr, _keArr];
    }
}

- (NSArray *)SCChart_ColorArray:(SCChart *)chart {
    return @[[UIColor redColor], [UIColor blueColor]];
}

- (BOOL)SCChart:(SCChart *)chart ShowHorizonLineAtIndex:(NSInteger)index {
    return YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
