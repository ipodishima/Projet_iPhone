//
//  WineViewController.h
//  MSToolTips
//
//  Created by Marian Paul on 02/10/12.
//  Copyright (c) 2012 Marian Paul. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "iCarousel.h"
#import "DownloadManager.h"

@interface WineViewController : UIViewController <iCarouselDataSource, iCarouselDelegate, DownloadDelegate>
{
    iCarousel *_carousel;
    UITextView *_textView;
    UILabel *_titleLabel, *_aocLabel;
    UIImageView *_imageHolder;
    UIActivityIndicatorView *_activity;
    NSMutableArray *_arrayOfContacts;
}
@end
