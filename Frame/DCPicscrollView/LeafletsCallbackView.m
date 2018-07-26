//
//  LeafletsCallbackView.m
//  fdshajda
//
//  Created by 张加勇 on 16/4/12.
//  Copyright © 2016年 CGZ. All rights reserved.
//

#import "LeafletsCallbackView.h"

@implementation LeafletsCallbackView
- (id)initWithFrame:(CGRect)frame block:(void (^) ()) moreclick url:(NSString *)url zhanweitu:(NSString *)zhanweitu{
    
    self = [super initWithFrame:frame];
    
    //给view里的block赋值
    moreViewClick = moreclick;
    if (self) {
        UIImageView *image = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
        [image sd_setImageWithURL:[NSURL URLWithString:url] placeholderImage:[UIImage imageNamed:zhanweitu]];
        [self addSubview:image];
        
    }
    return self;
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    [super touchesEnded:touches withEvent:event];
    NSLog(@"more点击结束");
    //在此处使用点击block
    moreViewClick();
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
