//
//  TouchLabView.m
//  zx_app
//
//  Created by 程国治 on 16/5/27.
//  Copyright © 2016年 Wmd. All rights reserved.
//

#import "TouchLabView.h"

@interface TouchLabView ()
{
    void (^ViewClick)();//声明一个block
}

@end

@implementation TouchLabView

- (void)setFrame:(CGRect)frame{
    [super setFrame:frame];
    self.bt.frame = CGRectMake(0, 0, frame.size.width, frame.size.height);
}

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
    [self.bt addTarget:self action:@selector(nagena) forControlEvents:UIControlEventTouchUpInside];
    self.bt.backgroundColor = [UIColor clearColor];
    [self addSubview:self.bt];
    
    
    self.lab = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
    self.lab.textAlignment = NSTextAlignmentCenter;
    [self.bt addSubview:self.lab];
    
    self.bt.sd_layout.spaceToSuperView(UIEdgeInsetsMake(0, 0, 0, 0));
    self.lab.sd_layout.spaceToSuperView(UIEdgeInsetsMake(0, 0, 0, 0));
}

- (void)sizeToFit{
    [self.lab sizeToFit];
    CGRect rect = CGRectMake(self.frame.origin.x, self.frame.origin.y, CGRectGetWidth(self.frame),  CGRectGetHeight(self.frame));
    self.frame = CGRectMake(rect.origin.x, rect.origin.y, self.lab.frame.size.width, self.lab.frame.size.height);
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
    
//    ViewClick();
}

@end
