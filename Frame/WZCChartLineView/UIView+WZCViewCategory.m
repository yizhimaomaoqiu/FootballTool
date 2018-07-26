//
//  UIView+WZCViewCategory.m
//  bsbdj
//
//  Created by 邬志成 on 16/6/14.
//  Copyright © 2016年 邬志成. All rights reserved.
//

#import "UIView+WZCViewCategory.h"

@implementation UIView (WZCViewCategory)

-(void)setX:(CGFloat)x{
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}

-(void)setY:(CGFloat)y{
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}

-(void)setWidth:(CGFloat)width{
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}
-(void)setHeight:(CGFloat)height{
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}

-(CGFloat)x{
    return self.frame.origin.x;
}
-(CGFloat)y{
    return self.frame.origin.y;
}

-(CGFloat)width{
    return self.frame.size.width;
}

-(CGFloat)height{
    return self.frame.size.height;
}

-(void)setSize:(CGSize)size{
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}

-(CGSize)size{
    return self.frame.size;
}

-(CGFloat)centerX{
    
    return self.center.x;

}
-(void)setCenterX:(CGFloat)centerX{
    
    CGPoint center = self.center;
    center.x = centerX;
    self.center = center;
    
}
-(CGFloat)centerY{
    return self.center.y;
}
-(void)setCenterY:(CGFloat)centerY{
    
    CGPoint center = self.center;
    center.y = centerY;
    self.center = center;
    
}

@end
