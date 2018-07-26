//
//  QuXian_VC.m
//  Frame
//
//  Created by 程国治 on 2018/7/24.
//  Copyright © 2018年 程国治. All rights reserved.
//

#import "QuXian_VC.h"
#import "WZCChartLine.h"
@interface QuXian_VC ()
///是否添加平影响
@property (nonatomic, assign)BOOL isAddPing;

@end

@implementation QuXian_VC{
    
    WZCChartLine *v;
}

- (void)action{
    if (_pingArr){
        if (_isAddPing) {
            self.navigationItem.rightBarButtonItem.title = @"添加平影响";
            _isAddPing = NO;
            [self change];
        }else{
            self.navigationItem.rightBarButtonItem.title = @"取消平影响";
            _isAddPing = YES;
            [self change];
        }
    }else{
        [SVProgressHUD showErrorWithStatus:@"不存在平数组"];
    }
    
}

- (void)change{
    if (_isAddPing){
        CGFloat ping20 = [_pingArr[0] floatValue] - [_pingArr[3] floatValue];
        CGFloat ping10 = [_pingArr[1] floatValue] - [_pingArr[4] floatValue];
        CGFloat ping6 = [_pingArr[2] floatValue] - [_pingArr[5] floatValue];
        NSArray *zhu = @[
                         @([_zhuArr[0] floatValue] + self.jiajianqiu - (ping20 > 0 ? (ping20 / 4) : 0)),
                         @([_zhuArr[1] floatValue] + self.jiajianqiu - (ping10 > 0 ? (ping10 / 4) : 0)),
                         @([_zhuArr[2] floatValue]),
                         @([_zhuArr[3] floatValue]),
                         @([_zhuArr[4] floatValue]),
                         @([_zhuArr[5] floatValue] + self.jiajianqiu - (ping6 > 0 ? (ping6 / 4) : 0))
                         ];
        NSArray *ke = @[
                        @([_keArr[0] floatValue] + (ping20 < 0 ? (ping20 / 4) : 0)),
                        @([_keArr[1] floatValue] + (ping10 < 0 ? (ping10 / 4) : 0)),
                        @([_keArr[2] floatValue]),
                        @([_keArr[3] floatValue]),
                        @([_keArr[4] floatValue]),
                        @([_keArr[5] floatValue] + (ping6 < 0 ? (ping6 / 4) : 0))
                        ];
        v.y_values = @[zhu, ke];
        [v startDrawWithLineType:WZCChartLineTypeCurve];
    }else{
        NSArray *arr = @[@([_zhuArr[0] floatValue] + self.jiajianqiu), @([_zhuArr[1] floatValue] + self.jiajianqiu), @([_zhuArr[2] floatValue]), @([_zhuArr[3] floatValue]), @([_zhuArr[4] floatValue]), @([_zhuArr[5] floatValue] + self.jiajianqiu)];
        v.y_values = @[arr, _keArr];
        [v startDrawWithLineType:WZCChartLineTypeCurve];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIBarButtonItem *item = [[UIBarButtonItem alloc]initWithTitle:@"添加平影响" style:UIBarButtonItemStylePlain target:self action:@selector(action)];
    self.navigationItem.rightBarButtonItem = item;
    
    self.title = @"折线图";
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    v = [[WZCChartLine alloc]initWithFrame:CGRectMake(10, 100, [UIScreen mainScreen].bounds.size.width - 20, [UIScreen mainScreen].bounds.size.width - 20)];
    v.x_values = @[@"20场", @"10场", @"9场", @"8场", @"7场", @"6场"];
    NSArray *arr = @[@([_zhuArr[0] floatValue] + self.jiajianqiu), @([_zhuArr[1] floatValue] + self.jiajianqiu), @([_zhuArr[2] floatValue]), @([_zhuArr[3] floatValue]), @([_zhuArr[4] floatValue]), @([_zhuArr[5] floatValue] + self.jiajianqiu)];
    v.y_values = @[arr, _keArr];
    v.y_titles = @[@"主", @"客"];
    [v setXCoordinatesLocationInYValue:0];
    [v setCoordPlusAndMinusSymmetryShowZeroPoint:YES];
    v.colorsArray = @[[UIColor redColor], [UIColor blueColor]];
    [self.view addSubview:v];
    
    [v startDrawWithLineType:WZCChartLineTypeCurve];
    
    UILabel *lab = [[UILabel alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(v.frame) + 50, [UIScreen mainScreen].bounds.size.width, 100)];
    lab.backgroundColor = [UIColor clearColor];
    lab.text = [NSString stringWithFormat:@"主:   %@\n客:   %@", [self.zhuArr componentsJoinedByString:@", "], [self.keArr componentsJoinedByString:@", "]];
    lab.textColor = [UIColor blackColor];
    lab.textAlignment = NSTextAlignmentCenter;
    lab.numberOfLines = 0;
    lab.font = Font(15);
    [self.view addSubview:lab];
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
