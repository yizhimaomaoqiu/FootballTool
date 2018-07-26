
//
//  TouchLabAndImageV.m
//  YJBK
//
//  Created by kk on 16/8/4.
//  Copyright © 2016年 程国治. All rights reserved.
//

#import "TouchLabAndImageV.h"

@interface TouchLabAndImageV ()

{
    void (^ViewClick)();//声明一个block
}
@property (nonatomic, strong)UIButton *bt;

@end

@implementation TouchLabAndImageV


- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self createframe:frame];
    }
    return self;
}
- (void)createframe:(CGRect)frame{
    
    self.userInteractionEnabled = YES;
    self.bt = [UIButton buttonWithType:UIButtonTypeCustom];
    self.bt.frame = CGRectMake(0, 0, frame.size.width, frame.size.height);
    [self.bt addTarget:self action:@selector(nagenaa) forControlEvents:UIControlEventTouchUpInside];
    self.bt.backgroundColor = [UIColor clearColor];
    [self addSubview:self.bt];
    
    self.imageV = [[UIImageView alloc]initWithFrame:CGRectMake(frame.size.width / 10 * 3, frame.size.width / 5, frame.size.width / 5 * 2, frame.size.width / 5 * 2)];
    [self.bt addSubview:self.imageV];

    
    self.lab = [[UILabel alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(self.imageV.frame) + 10, frame.size.width, 25)];
    self.lab.textAlignment = NSTextAlignmentCenter;
    self.lab.font = Font(16);
    self.lab.textColor = [UIColor blackColor];
    [self.bt addSubview:self.lab];
    
    [self.bt bringSubviewToFront:self.imageV];
}

///横向居中
- (void)hengxiangjuzhong{
    self.imageV.frame = CGRectMake(self.bounds.size.width / 4, self.bounds.size.height / 4, self.bounds.size.height / 2, self.bounds.size.height / 2);
    self.lab.frame = CGRectMake(self.bounds.size.width / 4 + self.bounds.size.height / 2 + 5, self.bounds.size.height / 4, self.bounds.size.width - (self.bounds.size.width / 4 + self.bounds.size.height / 2), self.bounds.size.height / 2);
    self.lab.textAlignment = NSTextAlignmentLeft;
}

- (void)touchAction:(void(^)())block{
    ViewClick = block;
}

- (void)nagenaa{
    
    ViewClick();
    
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
