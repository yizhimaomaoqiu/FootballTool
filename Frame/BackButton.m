//
//  BackButton.m
//  zx_app
//
//  Created by 张加勇 on 2017/1/3.
//  Copyright © 2017年 Wmd. All rights reserved.
//

#import "BackButton.h"

@interface BackButton ()

@property (nonatomic, strong)UIImageView *imageV;

@property (nonatomic, strong)UILabel *label;

@end


@implementation BackButton

- (void)addTheSubview{
    UIImage *image = [UIImage imageNamed:@"tback.png"];
    _imageV = [[UIImageView alloc] initWithFrame:CGRectMake(0, (self.frame.size.height - 20 / image.WHProportion) / 2, 20, 20 / image.WHProportion)];
    [_imageV setImage:image];
    // 创建label
    
    _label = [[UILabel alloc] initWithFrame:CGRectMake(20, 0, self.frame.size.width - 20, self.frame.size.height)];
    _label.font = Font(17);
    _label.textColor = [UIColor whiteColor];
    [_label setText:@"返回"];
    
    // 添加到button中
    [self addSubview:_label];
    [self addSubview:_imageV];
}

- (void)setImage:(UIImage *)image title:(NSString *)title{
    [_imageV setImage:image];
    [_label setText:title];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
