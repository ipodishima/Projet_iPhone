//
//  MyProfileViewController.h
//  TableView
//
//  Created by Élèves on 14/01/13.
//  Copyright (c) 2013 EvaRousseau. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ModalViewControllerDelegate;
@interface MyProfileViewController : UIViewController
{
    UILabel *_label;
}
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) UIColor *color;
@property (nonatomic, assign) id <ModalViewControllerDelegate> delegate;
@end

@protocol ModalViewControllerDelegate <NSObject>
- (void) modalViewControllerDidFinish:(MyProfileViewController*)viewController;
@end