//
//  TouchImageView.m
//  zx_app
//
//  Created by 程国治 on 16/5/29.
//  Copyright © 2016年 Wmd. All rights reserved.
//

#import "TouchImageView.h"

@interface TouchImageView ()
{
    void (^ViewClick)();//声明一个block
}
@property (nonatomic, strong)UIButton *bt;
@end

@implementation TouchImageView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self createframe:frame];
    }
    return self;
}
- (void)createframe:(CGRect)frame{
    
    self.bt = [UIButton buttonWithType:UIButtonTypeCustom];
    self.bt.frame = CGRectMake(0, 0, frame.size.width, frame.size.height);
    [self.bt addTarget:self action:@selector(nagena) forControlEvents:UIControlEventTouchUpInside];
    self.bt.backgroundColor = [UIColor clearColor];
    [self addSubview:self.bt];
    
    
    self.imageV = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
    [self.bt addSubview:self.imageV];
}

- (void)setFrame:(CGRect)frame{
    [super setFrame:frame];
    self.bt.frame = frame;
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
- (void)ImageWithUrl:(NSString *)url placeholder:(NSString *)placeholder{
    [self.imageV sd_setImageWithURL:[NSURL URLWithString:url] placeholderImage:[UIImage imageNamed:placeholder]];
}

- (void)imageWIthimage:(UIImage *)image{
    self.imageV.image = image;
}


@end
