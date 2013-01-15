//
//  MyProfileViewController.m
//  TableView
//
//  Created by Élèves on 14/01/13.
//  Copyright (c) 2013 EvaRousseau. All rights reserved.
//

#import "MyProfileViewController.h"
#import "ProfileViewController.h"

@interface MyProfileViewController ()

@end

@implementation MyProfileViewController
@synthesize delegate = _delegate;
@synthesize name;
@synthesize color;


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    
    self.view.backgroundColor = color;
    
    _label = [[UILabel alloc] initWithFrame:CGRectMake(10, self.view.bounds.size.height/2, self.view.bounds.size.width-30, 25)];
    UIFont *font = [UIFont fontWithName:@"CzaristiteBold" size:30];
    [_label setFont:font];
   
    NSString *entry = self.name;
    _label.text = [NSString stringWithFormat:@"Welcome %@", entry];
    _label.textColor = [UIColor whiteColor];
    _label.backgroundColor = color;
    _label.textAlignment = UITextAlignmentCenter;
    [self.view addSubview:_label];
    
    UIImageView *imageHolder = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"logo.png"]];
    imageHolder.frame = CGRectMake(0, 20, self.view.bounds.size.width, 70);
    imageHolder.contentMode = UIViewContentModeCenter;
    imageHolder.backgroundColor = color;    
    [self.view addSubview:imageHolder];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button addTarget:self action:@selector(backToMain:)
        forControlEvents:UIControlEventTouchUpInside];
    [button setFrame:CGRectMake(self.view.bounds.size.width/2-35, self.view.bounds.size.height-40, 70, 30)];
    [button setTitle:@"Retour" forState:UIControlStateNormal];
    [self.view addSubview:button];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)backToMain:(id)sender
{
    // Informe le Delegate que l’on souhaite se retirer
    [self.delegate modalViewControllerDidFinish:self];
}

@end
