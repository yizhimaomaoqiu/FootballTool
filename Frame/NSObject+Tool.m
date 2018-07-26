//
//  NSObject+Tool.m
//  CenterConsole
//
//  Created by admin on 17/11/27.
//  Copyright © 2017年 Abox. All rights reserved.
//

#import "NSObject+Tool.h"
@implementation NSObject (Tool)

- (CGFloat)WHProportion{
    if ([self isKindOfClass:[UIImage class]]) {
        UIImage *image = (UIImage *)self;
        return image.size.width / image.size.height;
    }else{
        return 0;
    }
}

- (NSString *)MD5String {
    if ([self isKindOfClass:[NSString class]]) {
        NSString *str = (NSString *)self;
        const char *cStr = [str UTF8String];
        unsigned char result[16];
        CC_MD5(cStr, (CC_LONG)strlen(cStr), result);
        return [[NSString stringWithFormat:@"%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X",result[0], result[1], result[2], result[3], result[4], result[5], result[6], result[7],result[8], result[9], result[10], result[11],result[12], result[13], result[14], result[15]] lowercaseString];
    }else{
        return nil;
    }
}

- (NSDictionary *)jsonToDic
{
    if ([self isKindOfClass:[NSString class]]) {
        NSString *str = (NSString *)self;
        if (str == nil) {
            return nil;
        }
        NSData *jsonData = [str dataUsingEncoding:NSUTF8StringEncoding];
        NSError *err;
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData
                                                            options:NSJSONReadingMutableContainers
                                                              error:&err];
        if(err)
        {
            NSLog(@"json解析失败：%@",err);
            return nil;
        }
        return dic;
    }else{
        return nil;
    }
}

- (BOOL)isContainChinese{
    if ([self isKindOfClass:[NSString class]]) {
        NSString *str = (NSString *)self;
        BOOL flag=NO;
        for(int i=0; i< [str length];i++){
            int a = [str characterAtIndex:i];
            if(a>0x4e00&&a<0x9fff){
                flag=YES;
                break;
            }
        }
        return flag;
    }else{
        return NO;
    }
}

- (NSString *)dataToStr{
    if ([self isKindOfClass:[NSData class]]) {
        NSData *data = (NSData *)self;
        return [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    }else{
        return nil;
    }
}

- (NSURL *)strToUrl{
    if ([self isKindOfClass:[NSString class]]) {
        NSString *str = (NSString *)self;
        return [NSURL URLWithString:str];
    }else{
        return nil;
    }
}

- (UIColor *)strToColor{
    if ([self isKindOfClass:[NSString class]]) {
        NSString *str = (NSString *)self;
        NSString *cString = [[str stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
        // String should be 6 or 8 characters
        if ([cString length] < 6) return [UIColor blackColor];
        // strip 0X if it appears
        if ([cString hasPrefix:@"0X"]) cString = [cString substringFromIndex:2];
        if ([cString hasPrefix:@"#"]) cString = [cString substringFromIndex:1];
        if ([cString length] != 6) return [UIColor blackColor];
        // Separate into r, g, b substrings
        NSRange range;
        range.location = 0;
        range.length = 2;
        NSString *rString = [cString substringWithRange:range];
        
        range.location = 2;
        NSString *gString = [cString substringWithRange:range];
        
        range.location = 4;
        NSString *bString = [cString substringWithRange:range];
        
        // Scan values
        unsigned int r, g, b;
        
        [[NSScanner scannerWithString:rString] scanHexInt:&r];
        [[NSScanner scannerWithString:gString] scanHexInt:&g];
        [[NSScanner scannerWithString:bString] scanHexInt:&b];
        
        return [UIColor colorWithRed:((float) r / 255.0f)
                               green:((float) g / 255.0f)
                                blue:((float) b / 255.0f)
                               alpha:1.0f];
    }else{
        return nil;
    }
}


- (NSString *)isNull{
    if ([self isKindOfClass:[NSNull class]]) {
        return @"";
    }else{
        if ([self isKindOfClass:[NSString class]]) {
            return (NSString *)self;
        }else{
            ///既不是NULL 也不是str
            return nil;
        }
    }
}

- (NSString *)ifNil{
    if (self == nil) {
        return @"";
    }else{
        return (NSString *)self;
    }
}

- (BOOL)isNil{
    if (self == nil) {
        return YES;
    }else{
        return NO;
    }
}

- (BOOL)isNullClass{
    if ([self isKindOfClass:[NSNull class]]) {
        return YES;
    }else{
        return NO;
    }
}

- (NSString *)dicToJson
{
    if ([self isKindOfClass:[NSDictionary class]]) {
        NSError *error;
        NSDictionary *dict = (NSDictionary *)self;
        NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dict options:NSJSONWritingPrettyPrinted error:&error];
        NSString *jsonString;
        if (!jsonData) {
            NSLog(@"%@",error);
        }else{
            jsonString = [[NSString alloc]initWithData:jsonData encoding:NSUTF8StringEncoding];
        }
        NSMutableString *mutStr = [NSMutableString stringWithString:jsonString];
        NSRange range = {0,jsonString.length};
        //去掉字符串中的空格
        [mutStr replaceOccurrencesOfString:@" " withString:@"" options:NSLiteralSearch range:range];
        NSRange range2 = {0,mutStr.length};
        //去掉字符串中的换行符
        [mutStr replaceOccurrencesOfString:@"\n" withString:@"" options:NSLiteralSearch range:range2];
        return mutStr;
    }else{
        return nil;
    }
}

- (NSMutableAttributedString *)addCenterLine{
    if ([self isKindOfClass:[NSString class]]) {
        NSDictionary *attribtDic = @{NSStrikethroughStyleAttributeName: [NSNumber numberWithInteger:NSUnderlineStyleSingle]};
        NSMutableAttributedString *attributeStr = [[NSMutableAttributedString alloc]initWithString:(NSString *)self attributes:attribtDic];
        return attributeStr;
    }else{
        return nil;
    }
}
- (NSMutableAttributedString *)addDownLine{
    if ([self isKindOfClass:[NSString class]]) {
        NSDictionary *attribtDic = @{NSUnderlineStyleAttributeName: [NSNumber numberWithInteger:NSUnderlineStyleSingle]};
        NSMutableAttributedString *attributeStr = [[NSMutableAttributedString alloc]initWithString:(NSString *)self attributes:attribtDic];
        return attributeStr;
    }else{
        return nil;
    }
}

- (CGFloat)getStrHighWithW:(CGFloat)w font:(UIFont *)font{
    if ([self isKindOfClass:[NSString class]]) {
        NSString *str = (NSString *)self;
        CGRect rect = [str boundingRectWithSize:CGSizeMake(w, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : font} context:nil];
        return rect.size.height;
    }else{
        return 0.0;
    }
}

- (CGFloat)getStrWidthfont:(UIFont *)font{
    if ([self isKindOfClass:[NSString class]]) {
        NSString *str = (NSString *)self;
        NSDictionary *attribute = @{NSFontAttributeName:font};
        CGRect rect = [str boundingRectWithSize:CGSizeMake(MAXFLOAT, MAXFLOAT) options: NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesFontLeading attributes:attribute context:nil];
        return rect.size.width;
    }else{
        return 0.0;
    }
}


- (BOOL)isPhone{
    if ([self isKindOfClass:[NSString class]]) {
        NSString *str = (NSString *)self;
        NSString *phoneRegex1=@"1[34578]([0-9]){9}";
        NSPredicate *phoneTest1 = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",phoneRegex1];
        return  [phoneTest1 evaluateWithObject:str];
    }else{
        return NO;
    }
}

- (BOOL)isEmailAdress{
    if ([self isKindOfClass:[NSString class]]) {
        NSString *str = (NSString *)self;
        NSString *emailCheck = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
        NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES%@",emailCheck];
        return [emailTest evaluateWithObject:str];
    }else{
        return NO;
    }
}

///给view及其子类添加一条线
- (void)addLineWithPointArr:(NSArray *)pointArr
                      color:(UIColor *)color
                borderWidth:(CGFloat)borderWidth
{
    if ([self isKindOfClass:[UIView class]] || [[self class] isSubclassOfClass:[UIView class]]) {
        UIView *view = (UIView *)self;
        /// 线的路径
        UIBezierPath * bezierPath = [UIBezierPath bezierPath];
        NSMutableArray *arr = [NSMutableArray arrayWithArray:pointArr];
        NSValue *value = arr.firstObject;
        [bezierPath moveToPoint:[value CGPointValue]];
        [arr removeObjectAtIndex:0];
        if (arr.count > 0) {
            for (NSValue *value in arr) {
                [bezierPath addLineToPoint:[value CGPointValue]];
            }
        }
        CAShapeLayer * shapeLayer = [CAShapeLayer layer];
        shapeLayer.strokeColor = color.CGColor;
        shapeLayer.fillColor = [UIColor clearColor].CGColor;
        /// 添加路径
        shapeLayer.path = bezierPath.CGPath;
        /// 线宽度
        shapeLayer.lineWidth = borderWidth;
        [view.layer addSublayer:shapeLayer];
    }
}




@end
