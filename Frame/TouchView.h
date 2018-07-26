//
//  TouchView.h
//  fdshajda
//
//  Created by 程国治 on 16/4/26.
//  Copyright © 2016年 CGZ. All rights reserved.
//

#import <UIKit/UIKit.h>
///TouchView
@interface TouchView : UIView

@property (nonatomic, strong)UIButton *bt;

///初始化
- (instancetype)initWithFrame:(CGRect)frame;

///点击回调
- (void)touchAction:(void(^)())block;
@end
