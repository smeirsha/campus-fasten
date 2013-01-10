//
//  MapView.h
//  Campus Festen
//
//  Created by Villars Gimm on 23/11/11.
//  Copyright (c) 2011 RibEye Studios. All rights reserved.
//

#import <MapKit/MapKit.h>
#import "Annotation.h"
//#import "RXMLElement.h"

@interface MapView : UIViewController <MKMapViewDelegate> {
    
    
  //  IBOutlet UINavigationItem *backButton;
    IBOutlet MKMapView *mapView;    
}

@property (retain, nonatomic) IBOutlet MKMapView *mapView;
@property (nonatomic) CLLocationCoordinate2D coordinate;


-(void) fredagsbarClicked:(id)sender;
-(void) busClicked:(id)sender;
-(NSURL*)mapsUrl:(CLLocationCoordinate2D)endPoint startPos:(CLLocation*)userLocation;

-(void)fetchData;

@end
