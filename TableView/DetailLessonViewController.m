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
@synthesize address, price, longitude, latitude;

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
    //_textView.text = [NSString stringWithFormat:@"Lieu: %@ \r\n\r\n%@", address, _texteAAfficher];
    _textView.text = [NSString stringWithFormat:@"Lieu: %@", address];
    _textView.backgroundColor = [UIColor scrollViewTexturedBackgroundColor];
    [self.view addSubview:_textView];
    
    //self.tabBarItem.badgeValue = @"0";
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button setFrame:CGRectMake(150, 10, 100, 30)];
    [button setTitle:@"Participer" forState:UIControlStateNormal];
    [button setTitle:@"Inscrit!" forState:UIControlStateSelected];
    [button addTarget:self action:@selector(buttonSelected:)
     forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
     MKMapView *mapView = [[MKMapView alloc] initWithFrame:CGRectMake(10.0, 200, self.view.bounds.size.width-20.0, 150)];
    [mapView setShowsUserLocation:FALSE];
    [mapView setMapType:MKMapTypeStandard];
    [self.view addSubview:mapView];
    
    CLLocationCoordinate2D coordinate;    
    coordinate.latitude = latitude;
    coordinate.longitude = longitude;
    
    MKPointAnnotation *annotationPoint = [[MKPointAnnotation alloc] init];
    annotationPoint.coordinate = coordinate;
    annotationPoint.title = @"Lieu";
    [mapView addAnnotation:annotationPoint];
    
    CLLocationDistance distance = 15000;
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance( annotationPoint.coordinate, distance, distance);
    [mapView setRegion:region animated:YES];

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

- (void) buttonSelected:(id)sender
{
    UIButton *theButton = (UIButton*)sender;
    [theButton setSelected:![theButton isSelected]];
}

@end
