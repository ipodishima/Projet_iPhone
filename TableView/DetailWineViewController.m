//
//  DetailWineViewController.m
//  TableView
//
//  Created by Élèves on 14/01/13.
//  Copyright (c) 2013 EvaRousseau. All rights reserved.
//

#import "DetailWineViewController.h"

@interface DetailWineViewController ()

@end

@implementation DetailWineViewController
@synthesize texteAAfficher = _texteAAfficher;
@synthesize name;
@synthesize price;

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
	// Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor scrollViewTexturedBackgroundColor];
    
    _label = [[UILabel alloc] initWithFrame:CGRectMake(20, 10, self.view.bounds.size.width, 31)];
    UIFont *font = [UIFont fontWithName:@"CzaristiteBold" size:22];
    [_label setFont:font];
    _label.textColor = [UIColor whiteColor];
    //_textView.textAlignment = UITextAlignmentCenter;
    _label.text = [NSString stringWithFormat:@"Prix: %0.2f", price];
    _label.backgroundColor = [UIColor scrollViewTexturedBackgroundColor];
    [self.view addSubview:_label];
    
    _textView = [[UITextView alloc] initWithFrame:CGRectMake(10, 40, self.view.bounds.size.width, self.view.bounds.size.height)];
    [_textView setFont:font];
    _textView.textColor = [UIColor whiteColor];
    //_textView.textAlignment = UITextAlignmentCenter;
    _textView.text = [NSString stringWithFormat:@"%@ \r\n%@", name, _texteAAfficher];
    _textView.backgroundColor = [UIColor scrollViewTexturedBackgroundColor];
    [self.view addSubview:_textView];
    
    self.tabBarItem.badgeValue = @"0";
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button setFrame:CGRectMake(100, 280, 100, 30)];
    [button setTitle:@"Commander" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(addBadgeValue:)
     forControlEvents:UIControlEventTouchUpInside];
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

- (void) addBadgeValue:(id)sender
{
    // On récupère la valeur du badge
    UIViewController *item = [self.tabBarController selectedViewController];
    NSInteger theInteger = [item.tabBarItem.badgeValue integerValue];
    // On incrémente la valeur
    theInteger++;
    // On affiche cette nouvelle valeur
    item.tabBarItem.badgeValue = [NSString stringWithFormat:@"%d", theInteger];
}

@end
