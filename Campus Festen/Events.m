//
//
//          http://nickithansen.dk/studies/events.xml
//
//
//  Events.m
//  Campus Festen
//
//  Created by Villars Gimm on 07/12/11.
//  Copyright (c) 2011 RibEye Studios. All rights reserved.
//

#import "Events.h"
#import "EventCell.h"
#import "Event.h" 
#import "EventsDetail.h"

@implementation Events
@synthesize eventViewController;


@synthesize events, tableView;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    NSLog(@"inits with nibname");
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];    
    NSLog(@"viewDidLoad events");
    //## Spinner setup ##
    
    spinnerView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    [spinnerView startAnimating];
    spinnerView.center = CGPointMake(self.view.frame.size.width/2, self.view.frame.size.height/2);
    
    
    
    
    //##########
    /*
    self.events = [[NSMutableArray alloc] initWithCapacity:10];
    //loader vores xml med raptureXML
    RXMLElement *rxml = [RXMLElement elementFromURL:[NSURL URLWithString:@"http://nickithansen.dk/studies/events.xml"]];
    
    //det her er en "block". Du kan se at formen er lidt anderledes.
    //du kan sådan set lave hvad som helst inde i blokken med et element e. 
    
    [rxml iterate:@"EVENT" with:^(RXMLElement *e) 
    {
        NSLog(@"Event: Title %@, Starttime: %@, Endtime: %@ Description: %@", [[e child:@"TITLE"] text], [e child:@"STARTTIME"], [e child:@"ENDTIME"], [e child:@"DESCRIPTION"]);
        //opret vores egne events her og indsæt dem i vores mutable array
        // tag informationerne ud af e og læg dem i vores egen event objekter
        Event * myEvent = [Event new];
        myEvent.title = [[e child:@"TITLE"] text];
        //make date from the string in xml
        myEvent.startTime = [[e child:@"STARTTIME"] text];
        myEvent.endTime = [[e child:@"ENDTIME"] text];
        myEvent.description = [[e child:@"DESCRIPTION"] text];
        myEvent.closing = [NSMutableString stringWithString:[[e child:@"ENDTIME"] text]];
        NSRange range = {0,8};
        [myEvent.closing deleteCharactersInRange:range];
        NSLog(@"Closing time is: %@", myEvent.closing);
        [events addObject:myEvent];
        
    }];
    
    for (Event* event in events) {
        NSLog(@"Event title: %@", event.title);
    }
    */
        
    //self.tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
    //self.tableView.autoresizingMask = UIViewAutoresizingFlexibleHeight;
  
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    [self showSpinner];
    //[self fetchData];
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

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"cellForRowAtIndexPath index:%d ", [indexPath row]);
    EventCell * cell = (EventCell*) [tableView dequeueReusableCellWithIdentifier:@"Event"];
    Event * myEvent = [events objectAtIndex:[indexPath row]];

//    UIImage* lang = [UIImage imageNamed:@"lang.png"];
//    UIImage* semi = [UIImage imageNamed:@"semi.png"];
//    UIImage* kort = [UIImage imageNamed:@"kort.png"];
    
    NSString *closing = [myEvent closing];
    NSString *lang = @"0200";
    NSString *semi = @"2200";
    NSString *kort = @"1900";
    
    if ([closing isEqualToString:lang]) {
        cell.imageView.image = [UIImage imageNamed:@"lang.png"];
    }
    if ([closing isEqualToString:semi]) {
        cell.imageView.image = [UIImage imageNamed:@"semi.png"];
    }
    if ([closing isEqualToString:kort]) {
        cell.imageView.image = [UIImage imageNamed:@"kort.png"];
    }
    cell.title.text = [myEvent title];
    cell.subtitle.text = [myEvent startTime];
    return cell;
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return events.count;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // her kan vi reelt set sætte højden individuelt pr celle.
    return 50.0f;
}
 
#pragma Custom programming

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (self.eventViewController == nil) 
    {
      // this is selected in prepareForSegue
    }
    
    Event *myEvent = [events objectAtIndex:[indexPath row]];
    
        
    //Setting the UILabels in the EventsDetail
    eventViewController.title = [myEvent title];
    eventViewController.eventTitle.text = [myEvent title];
    eventViewController.eventStartTime.text = [myEvent startTime];
    eventViewController.eventEndTime.text = [myEvent endTime];
    eventViewController.eventDescription.text  = [myEvent description];
    
}

-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSLog(@"PrepareForSeque");
    self.eventViewController = [segue destinationViewController];
}

-(void) showSpinner
{
    NSLog(@"Show spinner");
    [self.view addSubview:spinnerView];
    
    /*[UIView animateWithDuration:0.1
                     animations:^{spinnerView.alpha = 1.0;}
                     completion:^(BOOL finished){ [self fetchData]; }];
     */
    [self performSelectorInBackground:@selector(fetchData) withObject:nil];
    
}
-(void) hideSpinner
{
        NSLog(@"Hide spinner");
    [spinnerView stopAnimating];
    [spinnerView removeFromSuperview];
}

-(void)fetchData
{
    self.events = [[NSMutableArray alloc] initWithCapacity:10];
    //loader vores xml med raptureXML
    RXMLElement *rxml = [RXMLElement elementFromURL:[NSURL URLWithString:@"http://nickithansen.dk/studies/events.xml"]];
    
    //det her er en "block". Du kan se at formen er lidt anderledes.
    //du kan sådan set lave hvad som helst inde i blokken med et element e. 
    
    [rxml iterate:@"EVENT" with:^(RXMLElement *e) 
     {
         //NSLog(@"Event: Title %@, Starttime: %@, Endtime: %@ Description: %@", [[e child:@"TITLE"] text], [e child:@"STARTTIME"], [e child:@"ENDTIME"], [e child:@"DESCRIPTION"]);
         NSLog(@"Event received");
         //opret vores egne events her og indsæt dem i vores mutable array
         // tag informationerne ud af e og læg dem i vores egen event objekter
         Event * myEvent = [Event new];
         myEvent.title = [[e child:@"TITLE"] text];
         //make date from the string in xml
         myEvent.startTime = [[e child:@"STARTTIME"] text];
         myEvent.endTime = [[e child:@"ENDTIME"] text];
         myEvent.description = [[e child:@"DESCRIPTION"] text];
         myEvent.closing = [NSMutableString stringWithString:[[e child:@"ENDTIME"] text]];
         NSRange range = {0,8};
         [myEvent.closing deleteCharactersInRange:range];
      //   NSLog(@"Closing time is: %@", myEvent.closing);
         [events addObject:myEvent];
         
     }];
    
    [self hideSpinner];
    [self.tableView reloadData];
}



@end