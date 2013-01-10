//
//  Annotation.h
//  Campus Festen
//
//  Created by Villars Gimm on 24/11/11.
//  Copyright (c) 2011 RibEye Studios. All rights reserved.
//

#import <MapKit/MapKit.h>
#import "AnnotationData.h"

@interface Annotation : NSObject <MKAnnotation>
{
    AnnotationData * annData;    
}


@property (nonatomic, readonly) CLLocationCoordinate2D coordinate;
@property (nonatomic, readonly, copy) NSString * title;
@property (nonatomic, readonly, copy) NSString * subtitle;
@property (nonatomic, readonly) AnnotationData * annData;

-(id)initWithCoordinate:(CLLocationCoordinate2D) c ;
-(id) initWithData:(AnnotationData*) annData;

@end
