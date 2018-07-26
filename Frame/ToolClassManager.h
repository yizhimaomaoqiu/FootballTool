//
//  ToolClassManager.h
//  Frame
//
//  Created by kk on 17/7/4.
//  Copyright © 2017年 程国治. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "BANetManager.h"
#import "AFNetworking.h"
#import "AFHTTPSessionManager.h"
#import "CDFInitialsAvatar.h"
#import "DCPicScrollView.h"
#import "DCWebImageManager.h"
#import "LeafletsCallbackView.h"


@interface ToolClassManager : NSObject

+ (ToolClassManager *)shareDataBase;

//删除所有缓存的session
- (void)delectCookie;

- (void)afnPostRequest:(NSString *)myUrl bodyDic:(NSDictionary *)bodyDic Block:(void(^)(id responseObject))block failBlock:(void(^)())failBlock;

- (void)afnGetRequest:(NSString *)myUrl bodyDic:(NSDictionary *)bodyDic Block:(void(^)(id responseObject))block failBlock:(void(^)())failBlock;

- (void)afnPostArr:(NSString *)myurl arr:(NSArray *)arr Block:(void(^)(id responseObject))block failBlock:(void(^)())failBlock;

- (void)afnUpImageRequest:(NSString *)myUrl bodyDic:(NSDictionary *)bodyDic imgae:(UIImage *)img name:(NSString *)name Block:(void(^)(id responseObject))block failBlock:(void(^)())failBlock pressblock:(void(^)(CGFloat press))pressblock;

- (UIImage *)ImageWithName:(NSString *)name bounds:(CGRect)bounds Font:(NSInteger)Font;
///打开一个网页
- (void)OpenUrlWithVC:(UIViewController *)vc url:(NSString *)url;

- (void)OpenHtmlStrWithVC:(UIViewController *)vc HtmlStr:(NSString *)HtmlStr;

///字典或数组转json
- (NSString*)DataTOjsonString:(id)object;

///压缩图片
- (UIImage *)fixOrientation:(UIImage *)aImage;

- (void)CarouselFigureWithFrame:(CGRect)frame  //frame
                         UrlArr:(NSArray *)urlArr //装有图片Url的数组;
                       titleArr:(NSArray *)titleArr //装有与图片相匹配的文字, 可不传
                    positionPic:(NSString *)positionPic //占位图
                           time:(CGFloat)time  //轮播几秒一动 默认2.0f,如果小于0.5不自动播放
                     fatherView:(UIView *)fatherView  //父视图
                    touthThePic:(void(^)(NSInteger index))touthThePic //点击了第几张图片, block回传
;

- (UIView *)headerView:(NSString *)str;

//rangeArr装的是NSRange转的NSValue数组
-(void)setlab:(UILabel *)label text:(NSString *)text rangeArr:(NSArray *)rangeArr fontArr:(NSArray *)fontArr colorArr:(NSArray *)colorArr;

-(NSMutableAttributedString *)text:(NSString *)text rangeArr:(NSArray *)rangeArr fontArr:(NSArray *)fontArr colorArr:(NSArray *)colorArr;

///日期选择器
- (void)TimeSelectorWithView:(UIView *)fatherView
                        name:(NSString *)name
                       class:(NSString *)classy
                 defaultTime:(NSString *)defaultTime
                endselection:(void(^)(NSString *time))block
                   failBlock:(void(^)())failBlock;

///时间戳转换成时间
- (NSString *)StamepToTimestr:(NSString *)stamp;

@end
