//
//  RepeatLableView.m
//  RepeatLableView
//
//  Created by chenjie on 16/4/13.
//  Copyright © 2016年 chenjie. All rights reserved.
//

#import "RepeatLableView.h"

@interface RepeatLableView ()

@property (nonatomic, strong)UILabel *lab1;
@property (nonatomic, strong)UILabel *lab2;

@end

@implementation RepeatLableView

//用代码初始化
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        _font = (_font == nil) ? [UIFont systemFontOfSize:15] : _font;
        _textColor = (_textColor == nil) ? [UIColor blackColor] : _textColor;
        _durationTime = (_durationTime == 0) ? 5 : _durationTime;
        _repeatCount = (_repeatCount != 0) ? _repeatCount : 0;
        //超出主view部分剪切.
        self.clipsToBounds = YES;
        
    }
    return self;
}



//重写set方法添加控件
- (void)setText:(NSString *)text{
    _text = text;
    for (UIView *view in self.subviews) {
        [view removeFromSuperview];
    }
    _lab1 = nil;
    _lab2 = nil;
    [self reloadView];
}

//创建view
- (void)reloadView{

    //计算宽度
    CGSize textSize = [self.text sizeWithAttributes:@{NSFontAttributeName:self.font}];
    CGFloat width = textSize.width > self.frame.size.width ? textSize.width : self.frame.size.width;
    
    //是否需要移动
    BOOL moveNeed = (width > self.bounds.size.width) ? YES : NO;
    
    //创建label-1  宽度增加了30,起到间隔作用,不需要可不加
    if (!_lab1) {
        _lab1 = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, width, self.bounds.size.height)];
    }
    _lab1.backgroundColor = [UIColor clearColor];
    _lab1.textAlignment = NSTextAlignmentLeft;
    _lab1.font = _font;
    _lab1.text = _text;
    _lab1.textColor = _textColor;
    if (self.textAlignment) {
        _lab1.textAlignment = self.textAlignment;
    }
    
    if (!moveNeed) {
        
        [self addSubview:_lab1];
        
    }else{
    
    
        //不添加这个view的话整个视图就跟着跑了
        UIView *contentView = [[UIView alloc] initWithFrame:self.bounds];
        contentView.backgroundColor = [UIColor clearColor];
        [self addSubview:contentView];
        
        [contentView addSubview:_lab1];

        //创建label-2
        if (_lab2) {
            _lab2 = [[UILabel alloc] initWithFrame:CGRectMake(_lab1.frame.size.width, 0, width, self.bounds.size.height)];
        }
        _lab2.backgroundColor = [UIColor clearColor];
        _lab2.textAlignment = NSTextAlignmentLeft;
        _lab2.text = _text;
        _lab2.font = _font;
        _lab2.textColor = _textColor;
        if (self.textAlignment) {
            _lab1.textAlignment = self.textAlignment;
        }
        [contentView addSubview:_lab2];

        //动画 - > 改变x
        CAKeyframeAnimation *moveAnimation = [CAKeyframeAnimation animationWithKeyPath:@"transform.translation.x"];
        //关键帧.动画对象在指定时间内依次执行关键帧.
        //从x=0开始,执行到x=0(需求:停顿一下) 再从x = 0 执行到最后.
        moveAnimation.values = @[@0,@0 ,@(- _lab1.frame.size.width)];
        //keyTimes对应执行上面的values属性,x = 0到x = 0 执行了总时间的0.1(因为keyTimes与values是一一对应的)达到停顿效果,x = 0 到最后可以自定义.
        moveAnimation.keyTimes = @[@0, @0.100, @0.868, @1.0];
        moveAnimation.duration = _durationTime;
        moveAnimation.repeatCount = (self.repeatCount == 0 )? INT16_MAX : self.repeatCount;

        [contentView.layer addAnimation:moveAnimation forKey:@"move"];
    }
}

- (void)setTextColor:(UIColor *)textColor{
    _textColor = textColor;
    _lab1.textColor = textColor;
    _lab2.textColor = textColor;
}

@end
