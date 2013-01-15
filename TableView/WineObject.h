//
//  WineObject.h
//  TableView
//
//  Created by Élèves on 14/01/13.
//  Copyright (c) 2013 EvaRousseau. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WineObject : NSObject
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *aoc;
@property (nonatomic, strong) NSString *image;
@property (nonatomic, strong) NSString *description;
@property (nonatomic, assign) float price;
@end
