//
//  LessonObject.h
//  TableView
//
//  Created by Élèves on 15/01/13.
//  Copyright (c) 2013 EvaRousseau. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LessonObject : NSObject
@property (nonatomic, strong) NSString *date;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *adr;
@property (nonatomic, strong) NSString *description;
@property (nonatomic, assign) NSInteger price;
@end
