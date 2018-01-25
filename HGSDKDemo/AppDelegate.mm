//
//  AppDelegate.m
//  HGSDKDemo
//
//  Created by 熙文 张 on 2016/12/01.
//  Copyright © 2016年 熙文 张. All rights reserved.
//

#import "AppDelegate.h"
#import <HGSDK/HGSDK.h>

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // 设置初始化参数
    [[HGSDKParameters sharedHGSDKParameters] setGameID:@"8"];
    [[HGSDKParameters sharedHGSDKParameters] setPayKey:@"bb4a3c615e02ffe2caef444177e9b87f"];
    [[HGSDKParameters sharedHGSDKParameters] setAppKey:@""];
    [[HGSDKParameters sharedHGSDKParameters] setSubID:@"0"];
    [[HGSDKParameters sharedHGSDKParameters] setCpId:@"51"];

    [[HGSDKParameters sharedHGSDKParameters] setTdAppId:@"8B2853CEA992413AB5BFE96DEF372B16"];
    [[HGSDKParameters sharedHGSDKParameters] setWxAppId:@"wx799c5867ea4dddd3"];
    [[HGSDKParameters sharedHGSDKParameters] setTtAppId:@"10036"];
    [[HGSDKParameters sharedHGSDKParameters] setDeAppId:@"CAF2DA765A79D0A2794BD842457DB1648"];
    [[HGSDK sharedHGSDK] hgInitWithSDKParameters:[HGSDKParameters sharedHGSDKParameters]];
    return YES;
}


- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation {
    if ([sourceApplication isEqualToString:@"com.tencent.xin"]) {
        return [[HGSDK sharedHGSDK] handleOpenURL:url];
    }
    return YES;
}

- (UIInterfaceOrientationMask)application:(UIApplication *)application supportedInterfaceOrientationsForWindow:(UIWindow *)window {
    return [[HGSDK sharedHGSDK] supportedInterface];
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
