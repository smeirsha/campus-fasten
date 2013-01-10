//
//  EventsDetail.m
//  Campus Festen
//
//  Created by Villars Gimm on 02/01/12.
//  Copyright (c) 2012 RibEye Studios. All rights reserved.
//

#import "EventsDetail.h"

@implementation EventsDetail

@synthesize eventTitle, eventStartTime, eventEndTime, eventDescription, textSelected, navi;

-(void) setupWithEvent:(Event *) event
{
    self.textSelected = event.title;
    [eventTitle setText:[self textSelected]];
    NSLog(@"setupWithEvent runs");
}

-(void)viewDidLoad{
    
    [super viewDidLoad];
    //   [eventTitle setText:[self textSelected]];
    //self.title = @"Bar Info";
    //self.eventTitle.text = @"test";
    
    
    NSLog(@"ViewDidLoad runs");    
    
}

@end
