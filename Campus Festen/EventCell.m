//
//  EventCell.m
//  Campus Festen
//
//  Created by Nicki Hansen on 23/12/11.
//  Copyright (c) 2011 RibEye Studios. All rights reserved.
//

#import "EventCell.h"

@implementation EventCell

@synthesize title = title_, subtitle= subtitle_, image = image_;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
