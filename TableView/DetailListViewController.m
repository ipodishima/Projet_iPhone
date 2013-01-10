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
    
    
    _textView = [[UITextView alloc] initWithFrame:CGRectMake(0, 75, self.view.bounds.size.width, 200)];
    _textView.font = [UIFont fontWithName:@"Zapfino" size:12.0];
    _textView.text = @"DECOUVRIR, DEGUSTER et ACHETER \r\ndu vin sur internet et par abonnement";
    _textView.textColor = [UIColor purpleColor];
    _textView.textAlignment = UITextAlignmentCenter;
    
    [self.view addSubview:_textView];
    //_label.text = _texteAAfficher;
    
    UIImageView *imageHolder = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 145, 65)];
    UIImage *image = [UIImage imageNamed:@"logo.png"];
    imageHolder.image = image;
    // optional:
    // [imageHolder sizeToFit];
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
