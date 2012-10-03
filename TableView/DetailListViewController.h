//
//  DetailListViewController.h
//  TableView
//
//  Created by Élèves on 21/09/12.
//  Copyright (c) 2012 EvaRousseau. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailListViewController : UIViewController
{
    UILabel *_label;
}
@property (nonatomic, strong) NSString *texteAAfficher;
@end
