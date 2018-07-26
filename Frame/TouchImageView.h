//
//  TouchImageView.h
//  zx_app
//
//  Created by 程国治 on 16/5/29.
//  Copyright © 2016年 Wmd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TouchImageView : UIView
///初始化
- (instancetype)initWithFrame:(CGRect)frame;

///点击回调
- (void)touchAction:(void(^)())block;

///加载图片
- (void)ImageWithUrl:(NSString *)url placeholder:(NSString *)placeholder;
- (void)imageWIthimage:(UIImage *)image;

@property (nonatomic, strong)UIImageView *imageV;
@end
