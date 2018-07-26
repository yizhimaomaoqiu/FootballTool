//
//  BackBarButtonItem.m
//  zx_app
//
//  Created by 张加勇 on 2017/1/3.
//  Copyright © 2017年 Wmd. All rights reserved.
//

#import "BackBarButtonItem.h"
#import "BackButton.h"

@interface BackBarButtonItem ()

{
    id customTarget;
    BackButton *btn;
}

@end

@implementation BackBarButtonItem


- (id)initWithtarget:(id)target action:(SEL)action {
    
    UIViewController *vc = (UIViewController *)target;
    vc.navigationController.interactivePopGestureRecognizer.delegate = (id)self;
    
    btn = [BackButton buttonWithType:UIButtonTypeCustom];
    [btn setFrame:CGRectMake(0.0f, 0.0f, 80.f, 25.f)];
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    [btn addTheSubview];
    
    /* Init method inherited from UIBarButtonItem */
    self = [[BackBarButtonItem alloc] initWithCustomView:btn];
    if (self) {
        /* Assign ivars */
        self.style = UIBarButtonItemStylePlain;
        customTarget = target;
        customAction = action;
    }
    return self;
}


- (void)setImage:(UIImage *)image title:(NSString *)title{
    [btn setImage:image title:title];
}

+ (BackBarButtonItem *)target:(id)target
                       action:(SEL)action{
    return [[BackBarButtonItem alloc]initWithtarget:target action:action];
}

@end
