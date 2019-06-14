//
//  AppDelegate.m
//  WeatherForecast
//
//  Created by Fang on 2019/6/14.
//  Copyright © 2019 Fang. All rights reserved.
//

#import "AppDelegate.h"
#import <BaiduMapAPI_Base/BMKBaseComponent.h>//引入base相关所有的头文件
#import "HomeViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    HomeViewController *homeVC = [[HomeViewController alloc] init];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:homeVC];
    self.window.rootViewController = nav;
    
    [self configMap];
    
    [[UINavigationBar appearance] setTranslucent:NO];
    [self.window makeKeyWindow];
    return YES;
}

- (void)configMap {
    // 要使用百度地图，请先启动BaiduMapManager
    BMKMapManager *mapManager = [[BMKMapManager alloc] init];
    // 如果要关注网络及授权验证事件，请设定generalDelegate参数
    BOOL ret = [mapManager start:@"1HVmz6p7E0xEfG4z4PHcGhLqGOAG7Mm2"  generalDelegate:nil];
    if (!ret) {
        NSLog(@"manager start failed!");
    }
    /**
     全局设置地图SDK与开发者交互时的坐标类型。不调用此方法时，
     
     设置此坐标类型意味着2个方面的约定：
     1. 地图SDK认为开发者传入的所有坐标均为此类型；
     2. 所有地图SDK返回给开发者的坐标均为此类型；
     
     地图SDK默认使用BD09LL（BMK_COORDTYPE_BD09LL）坐标。
     如需使用GCJ02坐标，传入参数值为BMK_COORDTYPE_COMMON即可。ß
     本方法不支持传入WGS84（BMK_COORDTYPE_GPS）坐标。
     
     @param coorType 地图SDK全局使用的坐标类型
     @return 设置成功返回YES，设置失败返回False
     */
    //设置为GCJ02坐标
    [BMKMapManager setCoordinateTypeUsedInBaiduMapSDK: BMK_COORDTYPE_COMMON];
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
