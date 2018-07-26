//
//  Picker.h
//  zx_app
//
//  Created by 张加勇 on 16/6/22.
//  Copyright © 2016年 Wmd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Picker : UIView
///选择器
+ (void)creatfatherView:(UIView *)fatherView biaoTi:(NSString *)biaoTi arr:(NSArray *)arr Block:(void(^)(NSString *text , NSInteger row))block;

@end
