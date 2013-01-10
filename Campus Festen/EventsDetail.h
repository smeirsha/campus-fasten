//
//  EventsDetail.h
//  Campus Festen
//
//  Created by Villars Gimm on 02/01/12.
//  Copyright (c) 2012 RibEye Studios. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Event.h"

@interface EventsDetail : UIViewController{
    IBOutlet UILabel *eventTitle;
    IBOutlet UILabel *eventStartTime;
    IBOutlet UILabel *eventEndTime;
    IBOutlet UILabel *eventDescription;
    
    IBOutlet UINavigationBar *navi;
    
    NSString *textSelected;
}
@property (nonatomic, retain) IBOutlet UILabel *eventTitle;
@property (nonatomic, retain) IBOutlet UILabel *eventStartTime;
@property (nonatomic, retain) IBOutlet UILabel *eventEndTime;
@property (nonatomic, retain) IBOutlet UILabel *eventDescription;
@property (retain,nonatomic) IBOutlet UINavigationBar *navi;
@property (nonatomic, retain) NSString *textSelected;

-(void) setupWithEvent:(Event *) event;

@end
