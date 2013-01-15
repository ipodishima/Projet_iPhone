//
//  LessonViewController.h
//  TableView
//
//  Created by Élèves on 09/10/12.
//  Copyright (c) 2012 EvaRousseau. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DownloadManager.h"

@interface LessonViewController : UITableViewController <DownloadDelegate> 
{
    UIActivityIndicatorView *_activity;
    NSMutableArray *_arrayOfContacts;
}
@end
