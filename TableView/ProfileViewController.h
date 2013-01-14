//
//  ProfileViewController.h
//  TableView
//
//  Created by Élèves on 25/10/12.
//  Copyright (c) 2012 EvaRousseau. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyProfileViewController.h"

@interface ProfileViewController : UIViewController <ModalViewControllerDelegate>
{
    UITextField *_textField, *_textField2;
    UILabel *_label;
    UILabel *_label2;
    UIButton *_button;
}
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) UIColor *color;
- (void)goToProfileView:(UIModalTransitionStyle)transitionStyle;
@end
