//
//  TouchLabAndImageV.h
//  YJBK
//
//  Created by kk on 16/8/4.
//  Copyright © 2016年 程国治. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TouchLabAndImageV : UIView
///初始化
- (instancetype)initWithFrame:(CGRect)frame;

///点击回调
- (void)touchAction:(void(^)())block;

@property (nonatomic, strong)UILabel *lab;

@property (nonatomic, strong)UIImageView *imageV;

///横向居中
- (void)hengxiangjuzhong;

@end
