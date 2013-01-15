//
//  MovieViewController.m
//  TableView
//
//  Created by Élèves on 25/10/12.
//  Copyright (c) 2012 EvaRousseau. All rights reserved.
//

#import "MovieViewController.h"

@interface MovieViewController ()

@end

@implementation MovieViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
     self.title = @"Vidéos";
    // Do any additional setup after loading the view from its nib.
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button setFrame:CGRectMake(30, 30, 280, 30)];
    [button setTitle:@" Voir vidéos disponibles" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(selectYouTubeViewController:)
     forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void) selectYouTubeViewController:(id)sender {
    UITabBarController *tabController = self.tabBarController;
    // Retrouver le contrôleur de la classe FirstViewController
    // On parcourt le tableau des contrôleurs
    UIViewController *controllerToSelect = nil;
    for (UIViewController *controller in tabController.viewControllers)
        if([controller isKindOfClass:NSClassFromString(@"YouTubeViewController")])
        {
            controllerToSelect = controller;
            break; // On sort de la boucle
        }
    tabController.selectedViewController = controllerToSelect;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
