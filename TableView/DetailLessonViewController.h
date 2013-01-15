//
//  DetailLessonViewController.h
//  TableView
//
//  Created by Élèves on 15/01/13.
//  Copyright (c) 2013 EvaRousseau. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailLessonViewController : UIViewController
{
    UILabel *_label;
    UITextView *_textView;
}
@property (nonatomic, strong) NSString *texteAAfficher;
@property (nonatomic, strong) NSString *address;
@property (nonatomic, assign) NSInteger price;
@end
