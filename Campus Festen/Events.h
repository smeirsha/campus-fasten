//
//  Events.h
//  Campus Festen
//
//  Created by Villars Gimm on 07/12/11.
//  Copyright (c) 2011 RibEye Studios. All rights reserved.
//

#import "EventsDetail.h"
#import "RXMLElement.h"
#import <UIKit/UIKit.h>

@interface Events : UITableViewController <UITableViewDelegate, UITableViewDataSource>
{
    EventsDetail *eventViewController;
    NSMutableArray *events;
    
    UIActivityIndicatorView * spinnerView;
}


@property (retain, nonatomic) NSMutableArray *events;
@property (retain, nonatomic) IBOutlet UITableView * tableView;

@property (nonatomic, retain) EventsDetail *eventViewController;

-(void) showSpinner;
-(void) hideSpinner;
-(void) fetchData;

@end