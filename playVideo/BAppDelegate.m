//
//  BAppDelegate.m
//  playVideo
//
//  Created by YunInfo on 13-11-27.
//  Copyright (c) 2013年 YunInfo. All rights reserved.
//

#import "BAppDelegate.h"

#import "BViewController.h"
#import "PlayVideoOnlineViewController.h"

@implementation BAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    PlayVideoOnlineViewController *playVideoOnlineViewCtrl = [[PlayVideoOnlineViewController alloc]initWithNibName:@"PlayVideoOnlineViewController" bundle:nil];
    playVideoOnlineViewCtrl.videoURL=[NSURL URLWithString:@"http://121.14.129.156:80/vod/1f8d7f9dd9bc31662aa4248fe05db87c.3gp?cacheAID=3576498&apKey=mediaDepart&videoId=XNjQwMDYyMTc2&mobileNum="];
  //  [self.navigationController pushViewController:playVideoOnlineViewCtrl animated:YES];
    
  //  self.viewController = [[BViewController alloc] initWithNibName:@"BViewController" bundle:nil];
    self.window.rootViewController =playVideoOnlineViewCtrl;
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
