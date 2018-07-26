//
//  OrangeBack_Button.m
//  Test
//
//  Created by admin on 18/1/4.
//  Copyright © 2018年 admin. All rights reserved.
//

#import "OrangeBack_Button.h"

@interface OrangeBack_Button ()

@property (nonatomic, strong)UIView *backview;

@property (nonatomic, strong)UILabel *textLab;

@end

@implementation OrangeBack_Button

+ (instancetype)buttonWithType:(UIButtonType)buttonType{
    OrangeBack_Button *bt = [super buttonWithType:buttonType];
    if (self) {
        [bt addTarget:bt action:@selector(down) forControlEvents:UIControlEventTouchDown];
        [bt addTarget:bt action:@selector(up) forControlEvents:UIControlEventTouchUpInside];
        [bt addTarget:bt action:@selector(up) forControlEvents:UIControlEventTouchUpOutside];
    }
    return bt;
}

- (void)setFrame:(CGRect)frame{
    [super setFrame:frame];
    if (!self.backview) {
        self.backview = [[UIView alloc]init];
        self.backview.backgroundColor = [UIColor orangeColor];
        [self addSubview:self.backview];
        self.backview.userInteractionEnabled = NO;
    }
    self.backview.frame = CGRectMake(4, 4, frame.size.width - 8, frame.size.height - 8);
    self.backview.layer.cornerRadius = self.backview.frame.size.height / 2;
    self.backview.layer.masksToBounds = YES;
    
    if (!self.textLab) {
        self.textLab = [[UILabel alloc]init];
        self.textLab.backgroundColor = [UIColor clearColor];
        self.textLab.textColor = [UIColor whiteColor];
        self.textLab.numberOfLines = 0;
        self.textLab.textAlignment = NSTextAlignmentCenter;
        self.textLab.font = [UIFont systemFontOfSize:16];
        [self.backview addSubview:self.textLab];
        self.textLab.userInteractionEnabled = NO;
    }
    self.textLab.frame = CGRectMake(0, 0, self.backview.frame.size.width, self.backview.frame.size.height);
    
    self.layer.shadowOffset = CGSizeMake(-4, 4);
    self.layer.shadowOpacity = 1;
    self.layer.shadowRadius = 4;
    self.layer.cornerRadius = self.backview.frame.size.height / 2;
    self.layer.shadowOpacity = 0.7f;
    self.layer.shadowColor = [UIColor orangeColor].CGColor;
    self.clipsToBounds = NO;
}

- (void)setText:(NSString *)text{
    _text = text;
    self.textLab.text = text;
}

- (void)setFontNum:(CGFloat)FontNum{
    _FontNum = FontNum;
    self.textLab.font = [UIFont systemFontOfSize:FontNum];
}

- (void)down{
    self.textLab.font = [UIFont systemFontOfSize:self.FontNum - 2];
    [UIView animateWithDuration:0.2 animations:^{
        self.layer.shadowColor = [UIColor clearColor].CGColor;
        self.backview.frame = CGRectMake(6, 6, self.frame.size.width - 12, self.frame.size.height - 12);
        self.backview.layer.cornerRadius = self.backview.frame.size.height / 2;
        self.textLab.frame = CGRectMake(0, 0, self.backview.frame.size.width, self.backview.frame.size.height);
    } completion:^(BOOL finished) {
        
    }];
}

- (void)up{
    self.textLab.font = [UIFont systemFontOfSize:self.FontNum];
    [UIView animateWithDuration:0.2 animations:^{
        self.layer.shadowColor = [UIColor orangeColor].CGColor;
        self.backview.frame = CGRectMake(4, 4, self.frame.size.width - 8, self.frame.size.height - 8);
        self.backview.layer.cornerRadius = self.backview.frame.size.height / 2;
        self.textLab.frame = CGRectMake(0, 0, self.backview.frame.size.width, self.backview.frame.size.height);
    } completion:^(BOOL finished) {
        
    }];
    
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
