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
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (void) modalViewControllerDidFinish:(MyProfileViewController *)viewController
{
    [self dismissModalViewControllerAnimated:YES];
}

- (void) connectionView:(id)sender
{

    /*[_textField removeFromSuperview];
    [_textField2 removeFromSuperview];
    [_label removeFromSuperview];
    [_label2 removeFromSuperview];
    [_button removeFromSuperview];*/
     self.name = _textField.text;
    [self goToProfileView:UIModalTransitionStyleFlipHorizontal];

    
}

-(void) touchesBegan :(NSSet *) touches withEvent:(UIEvent *)event

{
    
    [_textField resignFirstResponder];
    
    [_textField2 resignFirstResponder];
    
    [super touchesBegan:touches withEvent:event ];
    
}
- (void)goToProfileView:(UIModalTransitionStyle)transitionStyle
{
    // Allocation d’une instance de SecondViewController
    MyProfileViewController *controller = [[MyProfileViewController alloc] init];
    
    controller.name = name;
    controller.color = _color;
    // self est le Delegate
    controller.delegate = self;
    // On choisit l’animation selon le paramètre
    controller.modalTransitionStyle = transitionStyle;
    // On affiche le contrôleur
    [self presentViewController:controller animated:YES completion:NULL];
}


@end
