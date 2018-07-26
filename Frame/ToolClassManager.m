//
//  ToolClassManager.m
//  Frame
//
//  Created by kk on 17/7/4.
//  Copyright © 2017年 程国治. All rights reserved.
//

#import "ToolClassManager.h"
@implementation ToolClassManager

+ (ToolClassManager *)shareDataBase{
    static ToolClassManager *manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[self alloc]init];
    });
    return  manager;
}

//删除所有缓存的session
- (void)delectCookie{
    NSArray *cookies = [[NSHTTPCookieStorage sharedHTTPCookieStorage] cookies];
    for (NSHTTPCookie *cookie in cookies) {
        [[NSHTTPCookieStorage sharedHTTPCookieStorage] deleteCookie:cookie];
    }
}


- (void)afnPostRequest:(NSString *)myUrl bodyDic:(NSDictionary *)bodyDic Block:(void(^)(id responseObject))block failBlock:(void(^)())failBlock
{
    [BANetManager ba_request_POSTWithUrlString:myUrl isNeedCache:NO parameters:bodyDic successBlock:^(id response) {
        if (block) {
            block(response);
        }
        
    } failureBlock:^(NSError *error) {
        if (failBlock) {
            failBlock();
        }
        
    } progress:^(int64_t bytesProgress, int64_t totalBytesProgress) {
        
        
    }];
    
}

- (void)afnGetRequest:(NSString *)myUrl bodyDic:(NSDictionary *)bodyDic Block:(void(^)(id responseObject))block failBlock:(void(^)())failBlock{
    
    [BANetManager ba_request_GETWithUrlString:myUrl isNeedCache:NO parameters:bodyDic successBlock:^(id response) {
        if (block) {
            block(response);
        }
    } failureBlock:^(NSError *error) {
        if (failBlock) {
            failBlock();
        }
    } progress:^(int64_t bytesProgress, int64_t totalBytesProgress) {
        
    }];
}

- (void)afnPostArr:(NSString *)myurl arr:(NSArray *)arr Block:(void(^)(id responseObject))block failBlock:(void(^)())failBlock{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    //接收类型不一致请替换一致text/html或别的
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    //[manager.requestSerializer requestWithMethod:@"POST" URLString:myurl parameters:arr error:nil];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",
                                                         @"text/html",
                                                         @"image/jpeg",
                                                         @"image/png",
                                                         @"application/octet-stream",
                                                         @"text/json",
                                                         nil];
    [manager POST:myurl parameters:arr progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (block) {
            block(responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failBlock) {
            failBlock();
        }
    }];
}

- (void)afnUpImageRequest:(NSString *)myUrl bodyDic:(NSDictionary *)bodyDic imgae:(UIImage *)img name:(NSString *)name Block:(void(^)(id responseObject))block failBlock:(void(^)())failBlock pressblock:(void(^)(CGFloat press))pressblock{
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    //接收类型不一致请替换一致text/html或别的
    AFSecurityPolicy *securityPolicy = [[AFSecurityPolicy alloc] init];
    [securityPolicy setAllowInvalidCertificates:YES];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",
                                                         @"text/html",
                                                         @"image/jpeg",
                                                         @"image/png",
                                                         @"application/octet-stream",
                                                         @"text/json",
                                                         nil];
    NSString *url = myUrl;
    [manager POST:url parameters:bodyDic constructingBodyWithBlock:^(id<AFMultipartFormData> _Nonnull formData) {
        
        if (img) {
            //上传的参数(上传图片，以文件流的格式)
            NSData *imageData =UIImageJPEGRepresentation(img,0.8);
            NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
            formatter.dateFormat =@"yyyyMMddHHmmss";
            NSString *str = [formatter stringFromDate:[NSDate date]];
            NSString *fileName = [NSString stringWithFormat:@"%@1.jpg", str];
            [formData appendPartWithFileData:imageData
                                        name:name
                                    fileName:fileName
                                    mimeType:@"image/jpg"];
        }
        
    } progress:^(NSProgress *_Nonnull uploadProgress) {
        //打印下上传进度
        pressblock(uploadProgress.fractionCompleted);
        
    } success:^(NSURLSessionDataTask *_Nonnull task, id _Nullable responseObject) {
        //上传成功
        block(responseObject);
    } failure:^(NSURLSessionDataTask *_Nullable task, NSError * _Nonnull error) {
        
        failBlock();
        
    }];
}

- (UIImage *)ImageWithName:(NSString *)name bounds:(CGRect)bounds Font:(NSInteger)Font{
    CDFInitialsAvatar *topAvatar = [[CDFInitialsAvatar alloc] initWithRect:bounds fullName:name];
    topAvatar.backgroundColor = [UIColor lightGrayColor];
    topAvatar.initialsFont = Font(Font);
    return topAvatar.imageRepresentation;
}


- (BOOL)IsHaveActivityIndicatorView:(UIView *)fatherView{
    for (UIView *view in fatherView.subviews) {
        if ([view isKindOfClass:[UIActivityIndicatorView class]]) {
            return YES;
        }
    }
    return NO;
}

///时间戳转换成时间
- (NSString *)StamepToTimestr:(NSString *)stamp{
    
    NSString *str=stamp;//时间戳
    NSTimeInterval time=[str doubleValue];
    NSDate *detaildate=[NSDate dateWithTimeIntervalSince1970:time];
    NSLog(@"date:%@",[detaildate description]);
    //实例化一个NSDateFormatter对象
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    //设定时间格式,这里可以设置成自己需要的格式
    [dateFormatter setDateFormat:@"yyyy年MM月dd日"];
    NSString *currentDateStr = [dateFormatter stringFromDate: detaildate];
    return currentDateStr;
}

///判断网络状态
- (void)getNetWorkStatus:(void(^)(NSInteger ZT))block
{
    AFNetworkReachabilityManager *manager = [AFNetworkReachabilityManager manager];
    __weak typeof(self) weakSelf = self;
    [manager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        switch (status) {
            case AFNetworkReachabilityStatusNotReachable: {
                //                [weakSelf loadMessage:@"网络不可用"];
                block(0);
                break;
            }
                
            case AFNetworkReachabilityStatusReachableViaWiFi: {
                //                [weakSelf loadMessage:@"Wifi已开启"];
                block(2);
                break;
            }
                
            case AFNetworkReachabilityStatusReachableViaWWAN: {
                //                [weakSelf loadMessage:@"你现在使用的流量"];
                block(1);
                break;
            }
                
            case AFNetworkReachabilityStatusUnknown: {
                //                [weakSelf loadMessage:@"你现在使用的未知网络"];
                block(3);
                break;
            }
                
            default:
                break;
        }
    }];
    [manager startMonitoring];
}

- (NSString*)DataTOjsonString:(id)object
{
    NSString *jsonString = nil;
    NSError *error;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:object
                                                       options:NSJSONWritingPrettyPrinted // Pass 0 if you don't care about the readability of the generated string
                                                         error:&error];
    if (! jsonData) {
        NSLog(@"Got an error: %@", error);
    } else {
        jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    }
    return jsonString;
}



- (UIImage *)fixOrientation:(UIImage *)aImage {
    
    
    if (aImage.imageOrientation == UIImageOrientationUp)
        return aImage;
    
    CGAffineTransform transform = CGAffineTransformIdentity;
    
    switch (aImage.imageOrientation) {
        case UIImageOrientationDown:
        case UIImageOrientationDownMirrored:
            transform = CGAffineTransformTranslate(transform, aImage.size.width, aImage.size.height);
            transform = CGAffineTransformRotate(transform, M_PI);
            break;
            
        case UIImageOrientationLeft:
        case UIImageOrientationLeftMirrored:
            transform = CGAffineTransformTranslate(transform, aImage.size.width, 0);
            transform = CGAffineTransformRotate(transform, M_PI_2);
            break;
            
        case UIImageOrientationRight:
        case UIImageOrientationRightMirrored:
            transform = CGAffineTransformTranslate(transform, 0, aImage.size.height);
            transform = CGAffineTransformRotate(transform, -M_PI_2);
            break;
        default:
            break;
    }
    
    switch (aImage.imageOrientation) {
        case UIImageOrientationUpMirrored:
        case UIImageOrientationDownMirrored:
            transform = CGAffineTransformTranslate(transform, aImage.size.width, 0);
            transform = CGAffineTransformScale(transform, -1, 1);
            break;
            
        case UIImageOrientationLeftMirrored:
        case UIImageOrientationRightMirrored:
            transform = CGAffineTransformTranslate(transform, aImage.size.height, 0);
            transform = CGAffineTransformScale(transform, -1, 1);
            break;
        default:
            break;
    }
    
    CGContextRef ctx = CGBitmapContextCreate(NULL, aImage.size.width, aImage.size.height,
                                             CGImageGetBitsPerComponent(aImage.CGImage), 0,
                                             CGImageGetColorSpace(aImage.CGImage),
                                             CGImageGetBitmapInfo(aImage.CGImage));
    CGContextConcatCTM(ctx, transform);
    switch (aImage.imageOrientation) {
        case UIImageOrientationLeft:
        case UIImageOrientationLeftMirrored:
        case UIImageOrientationRight:
        case UIImageOrientationRightMirrored:
            
            CGContextDrawImage(ctx, CGRectMake(0,0,aImage.size.height,aImage.size.width), aImage.CGImage);
            break;
            
        default:
            CGContextDrawImage(ctx, CGRectMake(0,0,aImage.size.width,aImage.size.height), aImage.CGImage);
            break;
    }
    
    CGImageRef cgimg = CGBitmapContextCreateImage(ctx);
    UIImage *img = [UIImage imageWithCGImage:cgimg];
    CGContextRelease(ctx);
    CGImageRelease(cgimg);
    return img;
}


- (void)CarouselFigureWithFrame:(CGRect)frame
                         UrlArr:(NSArray *)urlArr //装有图片Url的数组;
                       titleArr:(NSArray *)titleArr //装有与图片相匹配的文字, 可不传
                    positionPic:(NSString *)positionPic //占位图
                           time:(CGFloat)time  //轮播几秒一动 默认2.0f,如果小于0.5不自动播放
                     fatherView:(UIView *)fatherView  //父视图
                    touthThePic:(void(^)(NSInteger index))touthThePic //点击了第几张图片, block回传
{
    
    if (urlArr.count == 1) {
        
        LeafletsCallbackView *view = [[LeafletsCallbackView alloc]initWithFrame:frame block:^{
            
            touthThePic(0);
        } url:[urlArr lastObject] zhanweitu:positionPic];
        
        [fatherView addSubview:view];
    }else {
        DCPicScrollView  *picView = [DCPicScrollView picScrollViewWithFrame:frame WithImageUrls:urlArr];
        if (titleArr) {
            if (titleArr.count != 0) {
                picView.titleData = titleArr;
            }
        }
        if (positionPic) {
            if (positionPic.length != 0) {
                picView.placeImage = [UIImage imageNamed:positionPic];
            }
        }
        [picView setImageViewDidTapAtIndex:^(NSInteger index) {
            printf("第%zd张图片\n",index);
            //点击了第几张图片进行回传
            touthThePic(index);
        }];
        picView.AutoScrollDelay = time;
        [fatherView addSubview:picView];
        [[DCWebImageManager shareManager] setDownloadImageRepeatCount:1];
        [[DCWebImageManager shareManager] setDownLoadImageError:^(NSError *error, NSString *url) {
            NSLog(@"%@",error);
        }];
    }
}

- (UIView *)headerView:(NSString *)str{
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 30)];
    view.backgroundColor = BACKCOLOR;
    
    UILabel *lab = [[UILabel alloc]initWithFrame:CGRectMake(16, 0, SCREEN_WIDTH - 32, 30)];
    lab.text = str;
    lab.textColor = [UIColor lightGrayColor];
    lab.font = Font(13);
    [view addSubview:lab];
    
    return view;
}

-(void)setlab:(UILabel *)label text:(NSString *)text rangeArr:(NSArray *)rangeArr fontArr:(NSArray *)fontArr colorArr:(NSArray *)colorArr
{
    NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:text];
    
    for (NSInteger i = 0; i < rangeArr.count; i ++) {
        
        UIFont *font = fontArr[i];
        UIColor *color = colorArr[i];
        NSValue *value = rangeArr[i];
        NSRange rang = [value rangeValue];
        //设置字号
        [str addAttribute:NSFontAttributeName value:font range:rang];
        //设置文字颜色
        [str addAttribute:NSForegroundColorAttributeName value:color range:rang];
    }
    
    label.attributedText = str;
}

-(NSMutableAttributedString *)text:(NSString *)text rangeArr:(NSArray *)rangeArr fontArr:(NSArray *)fontArr colorArr:(NSArray *)colorArr
{
    NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:text];
    
    for (NSInteger i = 0; i < rangeArr.count; i ++) {
        
        UIFont *font = fontArr[i];
        UIColor *color = colorArr[i];
        NSValue *value = rangeArr[i];
        NSRange rang = [value rangeValue];
        //设置字号
        [str addAttribute:NSFontAttributeName value:font range:rang];
        //设置文字颜色
        [str addAttribute:NSForegroundColorAttributeName value:color range:rang];
    }
    return str;
}





///日期选择器
- (void)TimeSelectorWithView:(UIView *)fatherView
                        name:(NSString *)name
                       class:(NSString *)classy
                 defaultTime:(NSString *)defaultTime
                endselection:(void(^)(NSString *time))block
                   failBlock:(void(^)())failBlock
{
    
    TouchView *view = [[TouchView alloc]initWithFrame:CGRectMake(0, 0, [[UIScreen mainScreen]bounds].size.width, [[UIScreen mainScreen]bounds].size.height)];
    view.backgroundColor = [UIColor colorWithRed:100.f/250.f green:100.f/250.f blue:100.f/250.f alpha:0.8];
    [fatherView addSubview:view];
    
    UIDatePicker *datePicker = [[UIDatePicker alloc] initWithFrame:CGRectMake(0.0, view.frame.size.height, view.frame.size.width, view.frame.size.height / 3)];
    datePicker.backgroundColor = [UIColor whiteColor];
    [view addSubview:datePicker];
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    
    if ([classy isEqualToString:@"data"]) {
        datePicker.datePickerMode = UIDatePickerModeDate;
        
        [dateFormatter setDateFormat:@"yyyy-MM-dd"];
        
        NSDate* minDate = [dateFormatter dateFromString:@"1900-01-01"];
        NSDate* maxDate = [dateFormatter dateFromString:@"2099-01-01"];
        
        datePicker.minimumDate = minDate;
        datePicker.maximumDate = maxDate;
        if (defaultTime.length != 0) {
            NSDate *date = [dateFormatter dateFromString:defaultTime];
            [datePicker setMaximumDate:date];
        }
        
    }else if ([classy isEqualToString:@"dataAndTime"]){
        
        datePicker.datePickerMode = UIDatePickerModeDateAndTime;
        [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm"];
        if (defaultTime.length != 0) {
            NSDate *date = [dateFormatter dateFromString:defaultTime];
            [datePicker setMaximumDate:date];
        }
        
    }else if ([classy isEqualToString:@"yearAndMonth"]){
        //        datePicker.datePickerMode = UIDatePickerModeDate;
        [dateFormatter setDateFormat:@"yyyy-MM"];
        if (defaultTime.length != 0) {
            NSDate* minDate = [dateFormatter dateFromString:defaultTime];
            datePicker.minimumDate = minDate;
        }
        NSDate *date = [NSDate date];
        NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
        NSDateComponents *comps = [[NSDateComponents alloc] init];
        NSInteger unitFlags = NSCalendarUnitYear |
        NSCalendarUnitMonth |
        NSCalendarUnitDay |
        NSCalendarUnitWeekday |
        NSCalendarUnitHour |
        NSCalendarUnitMinute |
        NSCalendarUnitSecond;
        comps = [calendar components:unitFlags fromDate:date];
        NSInteger year=[comps year];
        NSInteger month = [comps month];
        
        NSDate* qwe = [dateFormatter dateFromString:[NSString stringWithFormat:@"%zd-%zd", year, month]];
        datePicker.maximumDate = qwe;
        
    }else{
        
        datePicker.datePickerMode = UIDatePickerModeTime;
        [dateFormatter setDateFormat:@"HH:mm"];
        if (defaultTime.length != 0) {
            NSDate *date = [dateFormatter dateFromString:defaultTime];
            [datePicker setMaximumDate:date];
        }
    }
    
    [fatherView bringSubviewToFront:view];
    
    UIView *hengtiao = [[UIView alloc]initWithFrame:CGRectMake(0, [[UIScreen mainScreen]bounds].size.height, datePicker.frame.size.width, 40)];
    hengtiao.backgroundColor = [UIColor colorWithRed:240.f/250.f green:240.f/250.f blue:240.f/250.f alpha:1];
    [view addSubview:hengtiao];
    ///取消touch
    TouchView *quxiao = [[TouchView alloc]initWithFrame:CGRectMake(0, 0, 60, hengtiao.frame.size.height)];
    UILabel *quxiaoLab = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 60, hengtiao.frame.size.height)];
    quxiaoLab.text = @"取消";
    quxiaoLab.textAlignment = NSTextAlignmentCenter;
    quxiaoLab.textColor = SubTitleFontColor;
    quxiaoLab.font = Font(16);
    quxiaoLab.backgroundColor = [UIColor clearColor];
    [quxiao addSubview:quxiaoLab];
    [hengtiao addSubview:quxiao];
    ///完成touch
    TouchView *wancheng = [[TouchView alloc]initWithFrame:CGRectMake(hengtiao.frame.size.width - 60, 0, 60, hengtiao.frame.size.height)];
    UILabel *wanchengLab = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 60, hengtiao.frame.size.height)];
    wanchengLab.text = @"完成";
    wanchengLab.textAlignment = NSTextAlignmentCenter;
    wanchengLab.textColor = COLORWITHRGB(59, 130, 248, 1);
    wanchengLab.font = Font(16);
    wanchengLab.backgroundColor = [UIColor clearColor];
    [wancheng addSubview:wanchengLab];
    [hengtiao addSubview:wancheng];
    ///中间标题
    UILabel *biaoti = [[UILabel alloc]initWithFrame:CGRectMake(hengtiao.frame.size.width / 2 - 50, 0, 100, hengtiao.frame.size.height)];
    biaoti.text = name;
    biaoti.textAlignment = NSTextAlignmentCenter;
    biaoti.textColor = [UIColor blackColor];
    biaoti.font = Font(16);
    biaoti.backgroundColor = [UIColor clearColor];
    [hengtiao addSubview:biaoti];
    
    [wancheng touchAction:^{
        datePicker.frame = CGRectMake(0.0, view.frame.size.height, view.frame.size.width,view.frame.size.height / 3);
        hengtiao.frame = CGRectMake(0, view.frame.size.height, datePicker.frame.size.width, 40);
        [view removeFromSuperview];
        block([dateFormatter stringFromDate:datePicker.date]);
    }];
    
    [quxiao touchAction:^{
        datePicker.frame = CGRectMake(0.0, view.frame.size.height, view.frame.size.width,view.frame.size.height / 3);
        hengtiao.frame = CGRectMake(0, view.frame.size.height, datePicker.frame.size.width, 40);
        [view removeFromSuperview];
        failBlock();
    }];
    [view touchAction:^{
        datePicker.frame = CGRectMake(0.0, view.frame.size.height, view.frame.size.width,view.frame.size.height / 3);
        hengtiao.frame = CGRectMake(0, view.frame.size.height, datePicker.frame.size.width, 40);
        [view removeFromSuperview];
        failBlock();
    }];
    
    datePicker.frame = CGRectMake(0.0, view.frame.size.height / 3 * 2, view.frame.size.width,view.frame.size.height / 3);
    hengtiao.frame = CGRectMake(0, datePicker.frame.origin.y - 40, datePicker.frame.size.width, 40);
}


@end
