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

/*- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}*/

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    
    self.view.backgroundColor = color;
    //UIColor *abcColor = [UIColor colorWithRed:178/255.f green:34/255.f blue:34/255.f alpha:255/255.f];
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

@end
