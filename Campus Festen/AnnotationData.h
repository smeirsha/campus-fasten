//
//  AnnotationData.h
//  Campus Festen
//
//  Created by Nicki Hansen on 30/12/11.
//  Copyright (c) 2011 RibEye Studios. All rights reserved.
//

typedef enum {
    fredagsbar,
    bus,
} AnnotationType;

@interface AnnotationData : NSObject
{
    //holds all relevant information for an annotation
    CLLocationCoordinate2D coordinate;
    NSString * title;
    NSString * subtitle;
    
    //icon?
    //details, events etc?
    //Anything else?
    AnnotationType type;
    
    NSInteger rejseplanId;

    
}

@property (nonatomic) CLLocationCoordinate2D coordinate;
@property (nonatomic, retain) NSString * title;
@property (nonatomic, retain) NSString * subtitle;
@property (nonatomic) AnnotationType type;
@property (nonatomic) NSInteger rejseplanId;

@end
