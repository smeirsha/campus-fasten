//
//  Event.h
//  Campus Festen
//
//  Created by Villars Gimm on 19/12/11.
//  Copyright (c) 2011 RibEye Studios. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Event : NSObject
{
    
    NSString *title;
    NSString *description;
    NSString *endTime;
    NSString *startTime;
    NSMutableString *closing;
}

@property (retain, nonatomic) NSString *title;
@property (retain, nonatomic) NSString *description;
@property (retain, nonatomic) NSString *endTime;
@property (retain, nonatomic) NSString *startTime;
@property (retain, nonatomic) NSMutableString *closing;

@end
