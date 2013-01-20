//
//  DetailLessonViewController.h
//  TableView
//
//  Created by Élèves on 15/01/13.
//  Copyright (c) 2013 EvaRousseau. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>

@class LessonObject;

@interface DetailLessonViewController : UIViewController
{
    UILabel *_label;
    UITextView *_textView;
}
@property (nonatomic, strong) LessonObject *lesson;
@end
