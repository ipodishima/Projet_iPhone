//
//  CustomCell.m
//  TableView
//
//  Created by Élèves on 21/09/12.
//  Copyright (c) 2012 EvaRousseau. All rights reserved.
//

#import "CustomCell.h"

@implementation CustomCell
@synthesize myLabel = _myLabel;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        _myLabel = [[UILabel alloc] initWithFrame:self.frame];
        _myLabel.font = [UIFont fontWithName:@"Calibri" size:12.0];
        _myLabel.textAlignment = UITextAlignmentCenter;
        [self.contentView addSubview:_myLabel];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
