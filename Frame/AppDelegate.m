//
//  AppDelegate.m
//  Frame
//
//  Created by kk on 17/10/18.
//  Copyright © 2017年 程国治. All rights reserved.
//

#import "AppDelegate.h"
#import "Three_VC.h"
#import "Two_VC.h"
#import "Four_VC.h"
#import "One_VC.h"

@interface AppDelegate ()
@property (nonatomic, strong)UITabBarController *tabBarC;
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    //网络框架初始化及设定条件
    [BANetManager initialize];
    [BANetManager sharedBANetManager].requestSerializer = BAHttpRequestSerializerHTTP;
    ///缓存sesson
    [BANetManager sharedBANetManager].isCookie = YES;
    
    One_VC *homepage = [[One_VC  alloc]init];
    Three_VC *two = [[Three_VC alloc]init];
    Two_VC *one = [[Two_VC  alloc]init];
    Four_VC *three = [[Four_VC  alloc]init];
    
    UINavigationController *homepageNc = [[UINavigationController alloc]initWithRootViewController:homepage];
    UINavigationController *pageTwoNC = [[UINavigationController alloc]initWithRootViewController:one];
    
    [self setupOneChildViewController:homepageNc
                                image:[[UIImage imageNamed:@"pageone_ns"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]
                        selectedImage:[[UIImage imageNamed:@"pageone_s"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]
                                title:nil];
    [self setupOneChildViewController:pageTwoNC
                                image:[[UIImage imageNamed:@"pagetwo_ns"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]
                        selectedImage:[[UIImage imageNamed:@"pagetwo_s"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]
                                title:nil];
//    [self setupOneChildViewController:pageTwoNC
//                                image:[[UIImage imageNamed:@"pagethree_ns"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]
//                        selectedImage:[[UIImage imageNamed:@"pagethree_s"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]
//                                title:nil];
//    [self setupOneChildViewController:three
//                                image:[[UIImage imageNamed:@"pagefour_ns"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]
//                        selectedImage:[[UIImage imageNamed:@"pagefour_s"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]
//                                title:nil];
    
    self.tabBarC = [UITabBarController new];
    self.tabBarC.viewControllers = [NSArray arrayWithObjects:homepageNc, pageTwoNC, nil];
    self.tabBarC.tabBar.barTintColor = [UIColor whiteColor];
    
    [self.window setRootViewController:self.tabBarC];
    
    return YES;
}



- (void)setupOneChildViewController:(UIViewController *)vc image:(UIImage *)image selectedImage:(UIImage *)selectedImage title:(NSString *)title {
    vc.tabBarItem.image = image;
    vc.tabBarItem.selectedImage = selectedImage;
}



- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
