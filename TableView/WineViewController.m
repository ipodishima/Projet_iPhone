//
//  WineViewController.m
//  MSToolTips
//
//  Created by Marian Paul on 02/10/12.
//  Copyright (c) 2012 Marian Paul. All rights reserved.
//

#import "WineViewController.h"
#import "WineObject.h"

@interface WineOverlayView : UIView

@end

@interface WineViewController ()
{
    WineOverlayView *_overlay;
}
@end

@implementation WineViewController

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
    self.view.backgroundColor = [UIColor scrollViewTexturedBackgroundColor];
    _activity = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    [[DownloadManager shared] loadLocalFileName:@"WineList" withDelegate:self];
    
    _carousel = [[iCarousel alloc] initWithFrame:CGRectMake(0, 300.0, CGRectGetWidth(self.view.bounds), 111.0 /*depends strongly of values in overlay*/)];
    // these values in initWithFrame should be fixed, having hardcoded values is not great!
   
    _carousel.type = iCarouselTypeRotary; // Try other values to see what happens
    _carousel.delegate = self;
    _carousel.dataSource = self;
    _carousel.clipsToBounds = NO;
    _carousel.userInteractionEnabled = YES;
    [self.view addSubview:_carousel];
    
    _overlay = [[WineOverlayView alloc] initWithFrame:self.view.bounds];
    _overlay.userInteractionEnabled = NO;
    [self.view addSubview:_overlay];
    
    UIColor *abcColor = [UIColor colorWithRed:178/255.f green:34/255.f blue:34/255.f alpha:255/255.f];
    
   /* _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(80, 20, 50, 25)];
    UIFont *font = [UIFont fontWithName:@"CzaristiteBold" size:22];
    [_titleLabel setFont:font];
    _titleLabel.text = @"Title: ";
    _titleLabel.textColor = abcColor;
    _titleLabel.textAlignment = UITextAlignmentLeft;
    [self.view addSubview:_titleLabel];

    _aocLabel = [[UILabel alloc] initWithFrame:CGRectMake(80, 70, 50, 25)];
    [_aocLabel setFont:font];
    _aocLabel.text = @"AOC: ";
    _aocLabel.textColor = abcColor;
    _aocLabel.textAlignment = UITextAlignmentLeft;
    [self.view addSubview:_aocLabel];*/
    
    _textView = [[UITextView alloc] initWithFrame:CGRectMake(100.0, 10.0, 220.0, 280.0)];
    _textView.textColor = abcColor;
    UIFont *fontText = [UIFont fontWithName:@"Czaristite" size:22];
    [_textView setFont:fontText];
    [self.view addSubview:_textView];

    _imageHolder = [[UIImageView alloc] initWithFrame:CGRectMake(-100, 0, 280, 280)];
    //_imageHolder.contentMode = UIViewContentModeRight;
    [self.view addSubview:_imageHolder];
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

#pragma mark - iCarousel methods

- (NSUInteger)numberOfItemsInCarousel:(iCarousel *)carousel
{
    return _arrayOfContacts.count;
    NSLog(@"%d", _arrayOfContacts.count);
}

- (UIView *)carousel:(iCarousel *)carousel viewForItemAtIndex:(NSUInteger)index reusingView:(UIView *)view
{
    //create new view if no view is available for recycling
    if (view == nil)
    {
        view = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bouteille15.png"]];
    }
    
    // Use for example SDWebImageView to load the image from internet in an asynchronous way
    
    return view;
}

- (CGFloat)carouselItemWidth:(iCarousel *)carousel
{
    return 90.0; /*image width*/
}

- (void)carouselCurrentItemIndexDidChange:(iCarousel *)carousel;
{
    WineObject *w = [_arrayOfContacts objectAtIndex:carousel.currentItemIndex];
    _textView.text = [NSString stringWithFormat:@"Title: %@\r\n AOC: %@\r\n Description: %@", w.name, w.aoc, w.description];
    _imageHolder.image = [UIImage imageNamed:w.image];
}


#pragma mark - DownloadDelegate protocol

- (void) downloadOperation:(DownloadOperation *)operation didFailWithError:(NSError *)error
{
    // Stop activity indicator
    [_activity stopAnimating];
    NSLog(@"%@", error);
    // Todo : handle the error
}

- (void) downloadOperation:(DownloadOperation *)operation didStartLoadingRequest:(NSMutableURLRequest *)request
{
    // Start the activity indicator
    [_activity startAnimating];
}

- (void) downloadOperation:(DownloadOperation *)operation didLoadObject:(id)object
{
    // Stop activity indicator
    [_activity stopAnimating];
    
    // Now, we need to go through all the objects loaded in the JSON, parse it, and create new Objective-C objects
    // First, remove previous objects in instance array
    [_arrayOfContacts removeAllObjects];
    
    if (!_arrayOfContacts)
        _arrayOfContacts = [NSMutableArray new];
    
    // Enumerate the json array
    for (NSDictionary *dic in object)
    {
        WineObject *c = [WineObject new];
        
        // Set properties from JSON 'object'
        c.name = [dic objectForKey:@"Name"];
        c.aoc = [dic objectForKey:@"AOC"];
        c.image = [dic objectForKey:@"Image"];
        c.description = [dic objectForKey:@"Description"];
        
        [_arrayOfContacts addObject:c];
    }
    
    // Sort the array
    //[_arrayOfContacts sortUsingDescriptors:[NSArray arrayWithObject:[[NSSortDescriptor alloc] initWithKey:@"Name" ascending:YES]]];
    
    
    // We are almost done. Please note that the parsing is made here just to avoid complexification. You should always create a model like YouTubeManager class which handles the parsing and give the data to the controller. Remember the MVC pattern
    
    // When we finished, reload the table view
    [_carousel reloadData];
}

@end


@implementation WineOverlayView

- (id) initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

- (void) drawRect:(CGRect)rect
{
    // Get the context
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    // Build the path with triangle
    CGContextMoveToPoint(context, 0.0, 0.0);
    CGContextAddLineToPoint(context, 0.0, 300.0);
    CGContextAddLineToPoint(context, 140.0, 300.0);
    CGContextAddLineToPoint(context, 160.0, 320.0);
    CGContextAddLineToPoint(context, 180.0, 300.0);
    CGContextAddLineToPoint(context, 320.0, 300.0);
    CGContextAddLineToPoint(context, 320.0, 0.0);
    
    // Close it
    CGContextClosePath(context);
    // Set fill color with white
    CGContextSetFillColorWithColor(context, [UIColor whiteColor].CGColor);
    // Add some shadows
    CGContextSetShadowWithColor(context, CGSizeMake(0.0, 2.0), 5.0, [UIColor blackColor].CGColor);
    // Fill the path
    CGContextFillPath(context);
}


@end