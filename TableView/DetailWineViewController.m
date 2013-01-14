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
    _label = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, self.view.bounds.size.width, 31)];
    UIFont *font = [UIFont fontWithName:@"CzaristiteBold" size:22];
    [_label setFont:font];
    _label.textColor = [UIColor redColor];
    //_textView.textAlignment = UITextAlignmentCenter;
    _label.text = name;
    [self.view addSubview:_label];
    
    _textView = [[UITextView alloc] initWithFrame:CGRectMake(10, 40, self.view.bounds.size.width, self.view.bounds.size.height)];
    [_textView setFont:font];
    _textView.textColor = [UIColor redColor];
    //_textView.textAlignment = UITextAlignmentCenter;
    _textView.text = [NSString stringWithFormat:@"%@ %@", name, _texteAAfficher];
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
