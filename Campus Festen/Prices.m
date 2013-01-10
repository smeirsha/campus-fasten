//
//  Prices.m
//  Campus Festen
//
//  Created by Villars Gimm on 08/01/12.
//  Copyright (c) 2012 RibEye Studios. All rights reserved.
//

#import "Prices.h"
#import "PriceCell.h"
#import "Price.h"

@implementation Prices

@synthesize prices, priceViewController;

@synthesize tableView;

- (id) initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    NSLog(@"inits with nibname");
    return self;
}

- (void)didReceiveMemoryWarning{
    [super didReceiveMemoryWarning];
    
}

-(void)viewDidLoad{
    [super viewDidLoad];
    NSLog(@"viewDidLoad prices");
        
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self showSpinner];
}

-(void)viewDidUnload{
    [super viewDidUnload];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"cellForRowAtIndexPath index:%d", [indexPath row]);
    PriceCell *cell = (PriceCell*) [tableView dequeueReusableCellWithIdentifier:@"Price"];
    Price * myPrice = [prices objectAtIndex:[indexPath row]];
    
    cell.title.text = [myPrice title];
    cell.subtitle.text = [NSString stringWithFormat:@"%@ kr. %@ %% alc",[myPrice price], [myPrice alc]];
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return prices.count;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (self.priceViewController == nil) {
        
    }
    
    Price *myPrice = [prices objectAtIndex:[indexPath row]];
    
    priceViewController.title = [myPrice title];
    priceViewController.priceTitle.text = [myPrice title];
    priceViewController.pricePrice.text = [myPrice price];
    priceViewController.priceAlc.text = [myPrice alc];
    priceViewController.priceDescription.text = [myPrice description];
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    NSLog(@"Prepare fore segue");
    self.priceViewController = [segue destinationViewController];
}


-(void) showSpinner
{
    NSLog(@"Show spinner");
    [self.view addSubview:spinnerView];
    
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
    self.prices = [[NSMutableArray alloc]initWithCapacity:10];
    RXMLElement *rxml = [RXMLElement elementFromURL:[NSURL URLWithString:@"http://nickithansen.dk/studies/prices.xml"]];
    
    [rxml iterate:@"ENHED" with:^(RXMLElement *e) {
        NSLog(@"Price: Name %@, Price: %@, Alc: %@,Description: %@", [[e child:@"NAME"] text], [e child:@"PRICE"], [e child:@"ALC"], [e child:@"DESCRIPTION"]);
        
        Price *myPrice = [Price new];
        myPrice.title = [[e child:@"NAME"] text];
        myPrice.price = [[e child:@"PRICE"] text];
        myPrice.alc = [[e child:@"ALC"] text];
        myPrice.description = [[e child:@"DESCRIPTION"] text];
        [prices addObject:myPrice];
        
    }];
    
    for (Price* price in prices) {
        NSLog(@"Item name: %@", price.title);
    }

    
    [self hideSpinner];
    [self.tableView reloadData];
}


@end
