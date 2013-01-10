//
//  EventCell.h
//  Campus Festen
//
//  Created by Nicki Hansen on 23/12/11.
//  Copyright (c) 2011 RibEye Studios. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EventCell : UITableViewCell
{

}
@property (nonatomic, retain) IBOutlet UILabel * title;
@property (nonatomic, retain) IBOutlet UILabel * subtitle;
@property (retain,nonatomic) IBOutlet UIImageView *image;


@end
