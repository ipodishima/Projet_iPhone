//
//  YouTubeViewController.m
//  MSToolTips
//
//  Created by Marian Paul on 12/09/12.
//  Copyright (c) 2012 Marian Paul. All rights reserved.
//

#import "YouTubeViewController.h"
#import "YouTubeVideo.h"


@interface YouTubeViewController ()

@end

@implementation YouTubeViewController
@synthesize activityIndicator = _activityIndicator;
@synthesize nameLabel = _nameLabel;
@synthesize numberOfViewsLabel = _numberOfViewsLabel;
@synthesize numberOfVideosLabel = _numberOfVideosLabel;
@synthesize ratingLabel = _ratingLabel;
@synthesize captionTextView = _captionTextView;

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
    
    NSURL *url = [NSURL URLWithString:@"http://www.youtube.com/watch?v=6SAS4HpL2eQ&feature=player_embedded"];
    _currentPlayer = [[LBYouTubePlayerViewController alloc] initWithYouTubeURL:url];
    _currentPlayer.quality = LBYouTubePlayerQualityLarge;
    _currentPlayer.view.frame = CGRectMake(60.0f, 60.0f, 200.0f, 200.0f);
    _currentPlayer.delegate = self;
    [self.view addSubview:_currentPlayer.view];

}

- (void) viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    [_currentPlayer.view.controller stop];
}

- (void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [_currentPlayer.view.controller play];
}

#pragma mark - LBYouTubePlayerViewControllerDelegate

-(void)youTubePlayerViewController:(LBYouTubePlayerViewController *)controller didSuccessfullyExtractYouTubeURL:(NSURL *)videoURL {
    NSLog(@"Did extract video source:%@", videoURL);
}

-(void)youTubePlayerViewController:(LBYouTubePlayerViewController *)controller failedExtractingYouTubeURLWithError:(NSError *)error {
    NSLog(@"Failed loading video due to error:%@", error);
}

#pragma mark - YouTubeManager delegate

- (void) youTubeManagerDidStartToLoad:(YouTubeManager *)manager
{
    [_activityIndicator startAnimating];
}

- (void) youTubeManager:(YouTubeManager *)manager didFailWithError:(NSError *)error
{
    [_activityIndicator stopAnimating];
    NSLog(@"%@", error);
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error"
                                                    message:error.localizedDescription
                                                   delegate:nil
                                          cancelButtonTitle:@"Ok"
                                          otherButtonTitles:nil];
    [alert show];
}

- (void) youTubeManager:(YouTubeManager *)manager didLoadVideos:(NSArray *)videos
{
   /* _numberOfVideosLabel.text = [NSString stringWithFormat:@"%d videos loaded", videos.count];
    NSLog(@"%d videos", videos.count);
    YouTubeVideo *firstVideo = [videos objectAtIndex:0];
    _nameLabel.text = firstVideo.title;
    _numberOfViewsLabel.text = [NSString stringWithFormat:@"%d views", firstVideo.nbViews];
    _ratingLabel.text = [NSString stringWithFormat:@"%f", firstVideo.rating];
    _captionTextView.text = firstVideo.caption;
    
    [_activityIndicator stopAnimating];
    
    _currentVideoDisplayed = firstVideo;*/
}



- (void)viewDidUnload
{
    [self setActivityIndicator:nil];
    [self setNameLabel:nil];
    [self setNumberOfViewsLabel:nil];
    [self setNumberOfVideosLabel:nil];
    [self setRatingLabel:nil];
    [self setCaptionTextView:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
