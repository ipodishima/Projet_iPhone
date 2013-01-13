//
//  ProfileViewController.m
//  TableView
//
//  Created by Élèves on 25/10/12.
//  Copyright (c) 2012 EvaRousseau. All rights reserved.
//

#import "ProfileViewController.h"

@interface ProfileViewController ()

@end

@implementation ProfileViewController
@synthesize name;
@synthesize color = _color;


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
     self.title = @"Mon Profil";
    
    _color = [UIColor colorWithRed:70/255.f green:130/255.f blue:180/255.f alpha:255/255.f];
    
    _textField = [[UITextField alloc] initWithFrame:CGRectMake(10, 30, self.view.bounds.size.width-30, 25)];
    [_textField setPlaceholder:@"Username"];
    [_textField setTextColor:_color];
    [_textField setTextAlignment:UITextAlignmentLeft];
    _textField.borderStyle = UITextBorderStyleRoundedRect;
    [_textField resignFirstResponder];
    [self.view addSubview:_textField];
    
    _textField2 = [[UITextField alloc] initWithFrame:CGRectMake(10, 90, self.view.bounds.size.width-20, 31)];
    [_textField2 setPlaceholder:@"Password"];
    [_textField2 setTextColor:_color];
    [_textField2 setTextAlignment:UITextAlignmentLeft];
    _textField2.borderStyle = UITextBorderStyleRoundedRect;
    [self.view addSubview:_textField2];
    
    _label = [[UILabel alloc] initWithFrame:CGRectMake(10, 5, self.view.bounds.size.width-20, 20)];
    _label.text = @"Enter your Username :";
    _label.textColor = _color;
    _label.textAlignment = UITextAlignmentLeft;
    [self.view addSubview:_label];
    
    _label2 = [[UILabel alloc] initWithFrame:CGRectMake(10, 65, self.view.bounds.size.width-20, 20)];
    _label2.text = @"Enter your Password :";
    _label2.textColor = _color;
    _label2.textAlignment = UITextAlignmentLeft;
    [self.view addSubview:_label2];
    
    _button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [_button setFrame:CGRectMake(10, 130, 100, 30)];
    [_button setTitle:@"Connexion" forState:UIControlStateNormal];
    [_button addTarget:self action:@selector(connectionView:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_button];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void) connectionView:(id)sender
{

    [_textField removeFromSuperview];
    [_textField2 removeFromSuperview];
    [_label removeFromSuperview];
    [_label2 removeFromSuperview];
    [_button removeFromSuperview];
    
    self.view.backgroundColor = _color;
    UIColor *abcColor = [UIColor colorWithRed:178/255.f green:34/255.f blue:34/255.f alpha:255/255.f];
    _label = [[UILabel alloc] initWithFrame:CGRectMake(10, self.view.bounds.size.height/2, self.view.bounds.size.width-30, 25)];
    UIFont *font = [UIFont fontWithName:@"CzaristiteBold" size:22];
    [_label setFont:font];
    self.name = _textField.text;
    NSString *entry = name;
    _label.text = [NSString stringWithFormat:@"Welcome %@", entry];
    _label.textColor = abcColor;
    _label.backgroundColor = _color;
    _label.textAlignment = UITextAlignmentCenter;
    [self.view addSubview:_label];
    
    UIImageView *imageHolder = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"logo.png"]];
    imageHolder.frame = CGRectMake(0, 20, self.view.bounds.size.width, 70);
    imageHolder.contentMode = UIViewContentModeCenter;
    imageHolder.backgroundColor = _color;
    
    [self.view addSubview:imageHolder];
    
}

-(void) touchesBegan :(NSSet *) touches withEvent:(UIEvent *)event

{
    
    [_textField resignFirstResponder];
    
    [_textField2 resignFirstResponder];
    
    [super touchesBegan:touches withEvent:event ];
    
}


@end
