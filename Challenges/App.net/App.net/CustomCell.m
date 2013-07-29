//
//  CustomCell.m
//  App.net
//
//  Created by Grimi on 7/28/13.
//  Copyright (c) 2013 MobileMakers. All rights reserved.
//

#import "CustomCell.h"

@implementation CustomCell
@synthesize cellImage,cellText,cellUserName;


- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
