//
//  AppDelegate.h
//  TableView
//
//  Created by Élèves on 21/09/12.
//  Copyright (c) 2012 EvaRousseau. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DataListViewController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>
/*{
    DataListViewController *_dataListViewController;
    UINavigationController *_navController;
}*/

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) UITabBarController *tabBarController;

@end
