//
//  NSObject+Tool.h
//  CenterConsole
//
//  Created by admin on 17/11/27.
//  Copyright © 2017年 Abox. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CommonCrypto/CommonHMAC.h>
#import <UIKit/UIKit.h>

@interface NSObject (Tool)


/********************************image********************************/
///image长宽比例
- (CGFloat)WHProportion;

/********************************str********************************/
///MD5加密
- (NSString *)MD5String;

///json转dic
- (NSDictionary *)jsonToDic;

///是否包含汉字
- (BOOL)isContainChinese;

///转URL
- (NSURL *)strToUrl;

///16进制颜色字符串转颜色
- (UIColor *)strToColor;

//是否为null
- (NSString *)isNull;
//是否为Null类
- (BOOL)isNullClass;

- (NSString *)ifNil;

- (BOOL)isNil;

//添加中划线
- (NSMutableAttributedString *)addCenterLine;

//添加下划线
- (NSMutableAttributedString *)addDownLine;

///获取字符串高度
- (CGFloat)getStrHighWithW:(CGFloat)w font:(UIFont *)font;
///获取字符串宽度
- (CGFloat)getStrWidthfont:(UIFont *)font;

//手机号验证
- (BOOL)isPhone;
//邮箱验证
- (BOOL)isEmailAdress;

/********************************data********************************/

///data转字符串
- (NSString *)dataToStr;

/********************************dic********************************/
//字典转json
- (NSString *)dicToJson;

/********************************view********************************/
///给view及其子类添加一条线 cgpoint转nsvalue放进数组里
- (void)addLineWithPointArr:(NSArray *)pointArr
                      color:(UIColor *)color
                borderWidth:(CGFloat)borderWidth;

@end
