//
//  Annotation.m
//  Campus Festen
//
//  Created by Villars Gimm on 24/11/11.
//  Copyright (c) 2011 RibEye Studios. All rights reserved.
//

#import "Annotation.h"

@implementation Annotation

@synthesize coordinate, title, subtitle, annData;

-(id) initWithData:(AnnotationData*) data
{
    annData = data;
    coordinate = annData.coordinate;
    return self;
}

-(id) initWithCoordinate:(CLLocationCoordinate2D) c 
{
    coordinate = c;
    return self;
}

-(NSString*) title
{
    return annData.title;
}
-(NSString*) subtitle
{
    return annData.subtitle;
}

//56.168769,10.189079 paludan müllers vej stoppested (2A, 45)
//56.167616,10.19057 vestre ringgade /p muller (2A, 5A, 13, 45)

@end
