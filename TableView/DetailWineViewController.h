//
//  DetailWineViewController.h
//  TableView
//
//  Created by Élèves on 14/01/13.
//  Copyright (c) 2013 EvaRousseau. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailWineViewController : UIViewController
{
    UILabel *_label;
    UITextView *_textView;
}

@property (nonatomic, strong) NSString *texteAAfficher;
@property (nonatomic, strong) NSString *name;
@end
