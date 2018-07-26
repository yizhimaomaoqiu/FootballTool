//
//  Picker.m
//  zx_app
//
//  Created by 张加勇 on 16/6/22.
//  Copyright © 2016年 Wmd. All rights reserved.
//

#import "Picker.h"
@interface Picker ()<UIPickerViewDataSource, UIPickerViewDelegate>

{
    void (^ViewClick)(NSString *biaoTi);//声明一个block
}

@property (nonatomic, strong)UIPickerView *picker;

@property (nonatomic, strong)NSArray *arr;

@property (nonatomic, copy)NSString *result;

@property (nonatomic, assign)NSInteger row;

@end


@implementation Picker

+ (void)creatfatherView:(UIView *)fatherView biaoTi:(NSString *)biaoTi arr:(NSArray *)arr Block:(void(^)(NSString *text , NSInteger row))block{
    
    Picker *obj = [[Picker alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    obj.backgroundColor = COLORWITHRGB(100, 100, 100, 0.8);
    [obj creat:arr biaoTi:biaoTi Block:^(NSString *biaoTi , NSInteger row) {
        block(biaoTi, row);
    }];
    [fatherView addSubview:obj];
    [fatherView bringSubviewToFront:obj];
    
    
}
- (void)creat:(NSArray *)arr biaoTi:(NSString *)biaoTi Block:(void(^)(NSString *biaoTi, NSInteger row))block{
    self.result = [arr objectAtIndex:0];
    self.arr = arr;
    self.picker = [[UIPickerView alloc]initWithFrame:CGRectMake(0, SCREEN_HEIGHT / 3 * 2, SCREEN_WIDTH, SCREEN_HEIGHT / 3)];
    self.picker.backgroundColor = [UIColor whiteColor];
    self.picker.dataSource = self;
    self.picker.delegate = self;
    [self addSubview:self.picker];
    
    UIView *hengtiao = [[UIView alloc]initWithFrame:CGRectMake(0, self.picker.frame.origin.y - 45, self.picker.frame.size.width, 45)];
    hengtiao.backgroundColor = [UIColor colorWithRed:240.f/250.f green:240.f/250.f blue:240.f/250.f alpha:1];
    [self addSubview:hengtiao];
    
    ///取消touch
    TouchView *quxiao = [[TouchView alloc]initWithFrame:CGRectMake(0, 0, 60, hengtiao.frame.size.height)];
    UILabel *quxiaoLab = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 60, hengtiao.frame.size.height)];
    quxiaoLab.text = @"取消";
    quxiaoLab.textAlignment = NSTextAlignmentCenter;
    quxiaoLab.textColor = SubTitleFontColor;
    quxiaoLab.font = Font(16);
    quxiaoLab.backgroundColor = [UIColor clearColor];
    [quxiao addSubview:quxiaoLab];
    [hengtiao addSubview:quxiao];
    ///完成touch
    TouchView *wancheng = [[TouchView alloc]initWithFrame:CGRectMake(hengtiao.frame.size.width - 60, 0, 60, hengtiao.frame.size.height)];
    UILabel *wanchengLab = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 60, hengtiao.frame.size.height)];
    wanchengLab.text = @"完成";
    wanchengLab.textAlignment = NSTextAlignmentCenter;
    wanchengLab.textColor = COLORWITHRGB(59, 130, 248, 1);
    wanchengLab.font = Font(16);
    wanchengLab.backgroundColor = [UIColor clearColor];
    [wancheng addSubview:wanchengLab];
    [hengtiao addSubview:wancheng];
    ///中间标题
    UILabel *biaoti = [[UILabel alloc]initWithFrame:CGRectMake(hengtiao.frame.size.width / 2 - 100, 0, 200, hengtiao.frame.size.height)];
    biaoti.text = biaoTi;
    biaoti.textAlignment = NSTextAlignmentCenter;
    biaoti.textColor = [UIColor blackColor];
    biaoti.font = Font(16);
    biaoti.backgroundColor = [UIColor clearColor];
    [hengtiao addSubview:biaoti];
    
    [wancheng touchAction:^{
        [self removeFromSuperview];
        block(self.result, self.row);
    }];
    
    [quxiao touchAction:^{
        [self removeFromSuperview];
    }];

    TouchView *touchView = [[TouchView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT / 3 * 2 - 45)];
    touchView.backgroundColor = [UIColor clearColor];
    [touchView touchAction:^{
        [self removeFromSuperview];
    }];
    [self addSubview:touchView];

}
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView
numberOfRowsInComponent:(NSInteger)component
{
    // 由于该控件只包含一列，因此无须理会列序号参数component
    // 该方法返回self.arr.count，表明arr包含多少个元素，该控件就包含多少行
    return self.arr.count;
}

- (NSString *)pickerView:(UIPickerView *)pickerView
             titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    // 由于该控件只包含一列，因此无须理会列序号参数component
    // 该方法根据row参数返回arr中的元素，row参数代表列表项的编号，
    // 因此该方法表示第几个列表项，就使用arr中的第几个元素
    return [self.arr objectAtIndex:row];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:
(NSInteger)row inComponent:(NSInteger)component
{
    self.result = [self.arr objectAtIndex:row];
    self.row = row;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
