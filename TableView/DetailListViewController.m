//
//  DetailListViewController.m
//  TableView
//
//  Created by Élèves on 21/09/12.
//  Copyright (c) 2012 EvaRousseau. All rights reserved.
//

#import "DetailListViewController.h"

@interface DetailListViewController ()

@end

@implementation DetailListViewController
@synthesize texteAAfficher = _texteAAfficher;

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
    
    UIColor *color = [UIColor colorWithRed:70/255.f green:130/255.f blue:180/255.f alpha:255/255.f];
    UIColor *abcColor = [UIColor colorWithRed:178/255.f green:34/255.f blue:34/255.f alpha:255/255.f];
    
    _textView = [[UITextView alloc] initWithFrame:CGRectMake(0, 75, self.view.bounds.size.width, 200)];
    UIFont *font = [UIFont fontWithName:@"CzaristiteBold" size:22];
    [_textView setFont:font];
    _textView.text = @"DECOUVRIR, DEGUSTER et ACHETER \r\ndu vin sur internet et par abonnement \r\n\r\n\r\n author: Eva Rousseau";
    _textView.editable = NO;
    _textView.textColor = abcColor;
    _textView.textAlignment = UITextAlignmentCenter;
    
    //_label.text = _texteAAfficher;
    [self.view addSubview:_textView];
    UIImageView *imageHolder = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"logo.png"]];
    imageHolder.frame = CGRectMake(0, 0, self.view.bounds.size.width, 70);
    imageHolder.contentMode = UIViewContentModeCenter;
    imageHolder.backgroundColor = color;

    [self.view addSubview:imageHolder];

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

@end
