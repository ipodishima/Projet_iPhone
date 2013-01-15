//
//  DetailLessonViewController.m
//  TableView
//
//  Created by Élèves on 15/01/13.
//  Copyright (c) 2013 EvaRousseau. All rights reserved.
//

#import "DetailLessonViewController.h"

@interface DetailLessonViewController ()

@end

@implementation DetailLessonViewController
@synthesize texteAAfficher = _texteAAfficher;
@synthesize address, price;

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
    _label.text = [NSString stringWithFormat:@"Prix: %d€", price];
    _label.backgroundColor = [UIColor scrollViewTexturedBackgroundColor];
    [self.view addSubview:_label];
    
    _textView = [[UITextView alloc] initWithFrame:CGRectMake(10, 40, self.view.bounds.size.width-20, self.view.bounds.size.height)];
    [_textView setFont:font];
    _textView.textColor = [UIColor whiteColor];
    //_textView.textAlignment = UITextAlignmentCenter;
    _textView.text = [NSString stringWithFormat:@"Lieu: %@ \r\n\r\n%@", address, _texteAAfficher];
    _textView.backgroundColor = [UIColor scrollViewTexturedBackgroundColor];
    [self.view addSubview:_textView];
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
