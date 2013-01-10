//
//  MapView.m
//  Campus Festen
//
//  Created by Villars Gimm on 23/11/11.
//  Copyright (c) 2011 RibEye Studios. All rights reserved.
//

#import "MapView.h"

#import "AnnotationData.h"

#import "RXMLElement.h"


@implementation MapView


@synthesize mapView, coordinate;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        UIButton* infoButton = [UIButton buttonWithType:UIButtonTypeInfoLight];
        [infoButton addTarget:self action:@selector(showInfoView:) forControlEvents:UIControlEventTouchUpInside];
        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:infoButton];
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView
{
}
*/


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //Coordinate for the university park: 56.167897,10.201149
    
    MKCoordinateRegion newRegion;
    newRegion.center.latitude = 56.167897;
    newRegion.center.longitude = 10.201149;
    newRegion.span.latitudeDelta = 0.03;
    newRegion.span.longitudeDelta = 0.03;
    
    [self.mapView setRegion:newRegion animated:YES];

    self.mapView.showsUserLocation = YES;
    self.mapView.mapType = MKMapTypeHybrid;
    self.mapView.scrollEnabled = YES;
    self.mapView.zoomEnabled = YES;
    
    
   //self.mapAnnotations = [[NSMutableArray alloc] initWithArray:barInfo];
    
    //Annotation *ann = [[Annotation alloc] initWithCoordinate: CLLocationCoordinate2DMake(56.172161, 10.188092)];
    //[mapView addAnnotation:ann];    
    //get data from outside source 
    //create annotationdata
    
    //temp direkte data generering i koden (skal hentes fra xml/json)
    /*
    AnnotationData * data1 = [AnnotationData new];
    data1.coordinate = CLLocationCoordinate2DMake(56.172161, 10.188092);
    data1.title = @"fredagsbar.dk";
    data1.subtitle = @"Vi har øl!";
    data1.type = fredagsbar;
    Annotation * ann = [[Annotation alloc] initWithData: data1];    
    [mapView addAnnotation:ann];
    
    
    data1 = [AnnotationData new];
    data1.coordinate = CLLocationCoordinate2DMake(56.168769, 10.189079);
    data1.title = @"Stoppested";
    data1.subtitle = @"2A, 45";
    data1.type = bus;
    data1.rejseplanId = 751464400;
    ann = [[Annotation alloc] initWithData: data1];    
    [mapView addAnnotation:ann];
    
    
    data1 = [AnnotationData new];
    data1.coordinate = CLLocationCoordinate2DMake(56.167616, 10.19057);
    data1.title = @"Stoppested";
    data1.subtitle = @"2A, 5A, 13, 45";    
    data1.type = bus;
    data1.rejseplanId = 751404400;
    ann = [[Annotation alloc] initWithData: data1];    
    [mapView addAnnotation:ann];
     */
 //   [self fetchData];
    [self performSelectorInBackground:@selector(fetchData) withObject:nil];
    
    //56.168769,10.189079 paludan müllers vej stoppested (2A, 45)
    //56.167616,10.19057 vestre ringgade /p muller (2A, 5A, 13, 45)
    
    
    //rejseplanen links:
    //http://www.rejseplanen.dk/bin/stboard.exe/mn?ml=m&input=751464400&boardType=dep&time=now&start=yes 
}


- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
#pragma mark - mapview delegate methods
-(MKAnnotationView *) mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation
{
    if ([annotation isKindOfClass:[MKUserLocation class]])
    {
        return nil; //will use default blue pin
    }
    
    NSLog(@"Getting MKAnnotationview");
    MKPinAnnotationView * annView = [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"CampusAnnotation"];

    //mapView.annotations
    Annotation * myAnn = annotation;
    
    if (annotation.title != @"Current location")
    {
        if (myAnn.annData.type == fredagsbar)
        {
            annView.pinColor = MKPinAnnotationColorRed;
            
            UIButton * sideButton = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
            
            [sideButton addTarget:self action:@selector(fredagsbarClicked:) forControlEvents:UIControlEventTouchUpInside];
            
            annView.rightCalloutAccessoryView = sideButton;
            
        }                
        else if (myAnn.annData.type == bus)
        {
            
            UIButton * sideButton = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
            
            [sideButton addTarget:self action:@selector(busClicked:) forControlEvents:UIControlEventTouchUpInside];
            sideButton.tag = myAnn.annData.rejseplanId;
            
            annView.rightCalloutAccessoryView = sideButton;
            
            annView.pinColor = MKPinAnnotationColorGreen;
        }
        
    }
    annView.canShowCallout = YES;
    return annView;
}

-(void) fredagsbarClicked:(id)sender
{
    NSLog(@"fredagsbar clicked");
    UIAlertView * alert = [[UIAlertView alloc] init];
    [alert setTitle:@"Find vej til fredagsbar.dk"];
    [alert setMessage:@"Appen vil finde vej fra hvor du er til fredagbar.dk nu."];
    [alert setDelegate:self];
    [alert addButtonWithTitle:@"Nej tak"];	
    [alert addButtonWithTitle:@"Ja tak"];

    //set current annotation?
    
    [alert show];
  //  [alert release];
    
    
}


- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
	if (buttonIndex == 1)
	{
		NSLog(@"Ja tak");
        for(Annotation * ann in mapView.annotations)
        {
            if (![ann isKindOfClass:[MKUserLocation class]])
            {
                if (ann.annData.type == fredagsbar)
                {
                    [[UIApplication sharedApplication] openURL:[self mapsUrl:ann.coordinate startPos:self.mapView.userLocation.location]];
                }
            }
        }

	}
	else if (buttonIndex == 0)
	{
		NSLog(@"Nej tak");		
		
		
	}
}
-(void) busClicked:(id)sender
{
    NSInteger myTag = [(UIButton*) sender tag];
    NSLog(@"Busclicked, id: %d", myTag);
    //http://www.rejseplanen.dk/bin/stboard.exe/mn?ml=m&input=751464400&boardType=dep&time=now&start=yes 
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://www.rejseplanen.dk/bin/stboard.exe/mn?ml=m&input=%d&boardType=dep&time=now&start=yes", myTag]]];
}

-(NSURL*)mapsUrl:(CLLocationCoordinate2D)endPoint startPos:(CLLocation*)userLocation
{
    NSString * userPosString = [NSString stringWithFormat:@"%f,%f", userLocation.coordinate.latitude,userLocation.coordinate.longitude];
    NSString * endPointPosString = [NSString stringWithFormat:@"%f,%f", endPoint.latitude,endPoint.longitude];
    NSString * tmpString = [NSString stringWithFormat:@"http://maps.google.com/maps?daddr=%@&saddr=%@", endPointPosString,userPosString];
    tmpString = [tmpString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSURL * url = [NSURL URLWithString:tmpString];
    return url;
}

-(void)fetchData
{

    
    RXMLElement *rxml = [RXMLElement elementFromURL:[NSURL URLWithString:@"http://nickithansen.dk/studies/mappoints.xml"]];
    
    [rxml iterate:@"point" with:^(RXMLElement *e)
    {
        AnnotationData * data = [AnnotationData new];
        data.coordinate = CLLocationCoordinate2DMake([[e child:@"lat"] textAsDouble],[[e child:@"long"] textAsDouble]);
        data.title = [[e child: @"title"] text];
        data.subtitle = [[e child: @"subtitle"] text];
        NSString * typeString = [[e child: @"type"]text];
        if ( [typeString isEqualToString:@"0"])
            data.type = fredagsbar;
        else if ([typeString isEqualToString:@"1"])
            data.type = bus;
        Annotation * ann = [[Annotation alloc] initWithData:data];
        [mapView addAnnotation:ann];
    } ];
    
}

@end
