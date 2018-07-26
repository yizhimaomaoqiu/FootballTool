//
//  BackBarButtonItem.h
//  zx_app
//
//  Created by 张加勇 on 2017/1/3.
//  Copyright © 2017年 Wmd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BackBarButtonItem : UIBarButtonItem

{
    SEL customAction;
}

+ (BackBarButtonItem *)target:(id)target
                       action:(SEL)action;

- (void)setImage:(UIImage *)image title:(NSString *)title;

@end
