//
//  YouTubeViewController.h
//  MSToolTips
//
//  Created by Marian Paul on 12/09/12.
//  Copyright (c) 2012 Marian Paul. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YouTubeManager.h"
#import "LBYouTubePlayerViewController.h"

@class YouTubeVideo;

@interface YouTubeViewController : UIViewController <YouTubeManagerDelegate, LBYouTubePlayerControllerDelegate>
{
    YouTubeVideo *_currentVideoDisplayed;
    LBYouTubePlayerViewController *_currentPlayer;
    
}
@property (weak, nonatomic) UIActivityIndicatorView *activityIndicator;
@property (weak, nonatomic) UILabel *nameLabel;
@property (weak, nonatomic) UILabel *numberOfViewsLabel;
@property (weak, nonatomic) UILabel *numberOfVideosLabel;
@property (weak, nonatomic) UILabel *ratingLabel;
@property (weak, nonatomic) UITextView *captionTextView;

@end
