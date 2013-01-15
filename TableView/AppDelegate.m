//
//  AppDelegate.m
//  TableView
//
//  Created by Élèves on 21/09/12.
//  Copyright (c) 2012 EvaRousseau. All rights reserved.
//

#import "AppDelegate.h"
#import "YouTubeViewController.h"
#import "LocalFileViewController.h"
#import "WineViewController.h"
#import "LessonViewController.h"
#import "OrderViewController.h"
#import "SampleLoadViewController.h"
#import "DataListViewController.h"

@implementation AppDelegate
@synthesize window = _window;
@synthesize tabBarController = _tabBarController;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    
    self.tabBarController = [[UITabBarController alloc] init];
    
    DataListViewController *dataListVC = [[DataListViewController alloc] initWithStyle:UITableViewStylePlain];
    UINavigationController *navControllerdataList = [[UINavigationController alloc] initWithRootViewController:dataListVC];
    UITabBarItem *tabBarItem1 = [[UITabBarItem alloc] initWithTitle:@"Init"
                                                              image:[UIImage imageNamed:@"123-id-card.png"]
                                                                tag:0];
    navControllerdataList.tabBarItem = tabBarItem1;
    
    YouTubeViewController *youtubeVC = [[YouTubeViewController alloc] initWithNibName:@"YouTubeViewController" bundle:nil];
    UITabBarItem *tabBarItem2 = [[UITabBarItem alloc] initWithTitle:@"Vidéos"
                                                              image:[UIImage imageNamed:@"43-film-roll.png"] 
                                                                tag:1];
    youtubeVC.tabBarItem = tabBarItem2;
    
    OrderViewController *orderVC = [[OrderViewController alloc] initWithStyle:UITableViewStylePlain];
    UINavigationController *navControllerOrderList = [[UINavigationController alloc] initWithRootViewController:orderVC];
    UITabBarItem *tabBarItem3 = [[UITabBarItem alloc] initWithTitle:@"Commandes"
                                                              image:[UIImage imageNamed:@"80-shopping-cart.png"]
                                                                tag:5];
    navControllerOrderList.tabBarItem = tabBarItem3;
    
    WineViewController *wineVC = [[WineViewController alloc] init];
    UITabBarItem *tabBarItem4 = [[UITabBarItem alloc] initWithTitle:@"Vins"
                                                              image:[UIImage imageNamed:@"142-wine-bottle.png"]
                                                                tag:3];
    wineVC.tabBarItem = tabBarItem4;
    
    LessonViewController *lessonVC = [[LessonViewController alloc] initWithStyle:UITableViewStylePlain];
    UINavigationController *navControllerLessonList = [[UINavigationController alloc] initWithRootViewController:lessonVC];
    UITabBarItem *tabBarItem5 = [[UITabBarItem alloc] initWithTitle:@"Cours"
                                                              image:[UIImage imageNamed:@"137-presentation.png"]
                                                                tag:4];
    navControllerLessonList.tabBarItem = tabBarItem5;
    
    
    [self.tabBarController setViewControllers:[NSArray arrayWithObjects:navControllerdataList, youtubeVC, navControllerOrderList, wineVC, navControllerLessonList, nil]];
    [self.window setRootViewController:self.tabBarController];
    [self.tabBarController.tabBar setTintColor:[UIColor grayColor]];
    [self.tabBarController.tabBar setSelectedImageTintColor:[UIColor redColor]];
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
