//
//  Prices.h
//  Campus Festen
//
//  Created by Villars Gimm on 08/01/12.
//  Copyright (c) 2012 RibEye Studios. All rights reserved.
//

#import "PricesDetail.h"
#import "RXMLElement.h"
#import <UIKit/UIKit.h>

@interface Prices : UITableViewController <UITableViewDelegate, UITableViewDataSource>{
    PricesDetail *priceViewController;
    NSMutableArray *prices;
    UIActivityIndicatorView * spinnerView;
}

@property (retain,nonatomic) NSMutableArray *prices;
@property (retain,nonatomic) PricesDetail *priceViewController;

@property (retain,nonatomic) IBOutlet UITableView * tableView;

-(void) showSpinner;
-(void) hideSpinner;
-(void) fetchData;

@end
