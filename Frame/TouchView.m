//
//  TouchView.m
//  fdshajda
//
//  Created by 程国治 on 16/4/26.
//  Copyright © 2016年 CGZ. All rights reserved.
//

#import "TouchView.h"
@interface TouchView ()
{
    void (^ViewClick)();//声明一个block
}

@end
@implementation TouchView
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
    [self.bt addTarget:self action:@selector(nagena) forControlEvents:UIControlEventTouchUpInside];
    self.bt.backgroundColor = [UIColor clearColor];
    [self addSubview:self.bt];
    
    self.bt.sd_layout.spaceToSuperView(UIEdgeInsetsMake(0, 0, 0, 0));
    
}

- (void)nagena{
    ViewClick();
}

- (void)touchAction:(void(^)())block{
    
    ViewClick = block;
}
- (BOOL)canBecomeFirstResponder
{
    return YES;
}
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    
//        ViewClick();
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
