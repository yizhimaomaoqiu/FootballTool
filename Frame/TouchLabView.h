//
//  TouchLabView.h
//  zx_app
//
//  Created by 程国治 on 16/5/27.
//  Copyright © 2016年 Wmd. All rights reserved.
//

#import <UIKit/UIKit.h>
///TouchView上面还带个UILab
@interface TouchLabView : UIView

@property (nonatomic, strong)UIButton *bt;

///初始化
- (instancetype)initWithFrame:(CGRect)frame;

///点击回调
- (void)touchAction:(void(^)())block;

@property (nonatomic, strong)UILabel *lab;

- (void)sizeToFit;

@end
