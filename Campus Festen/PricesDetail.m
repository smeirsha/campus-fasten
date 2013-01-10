//
//  PricesDetail.m
//  Campus Festen
//
//  Created by Villars Gimm on 08/01/12.
//  Copyright (c) 2012 RibEye Studios. All rights reserved.
//

#import "PricesDetail.h"

@implementation PricesDetail

@synthesize priceTitle, pricePrice, priceAlc, priceDescription;
@synthesize textSelected;

-(void) setupWithPrice:(Price *)price{
    self.textSelected = price.title;
    [priceTitle setText:[self textSelected]];
    NSLog(@"setupWithPrice runs");
}
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
    NSLog(@"viewDidLoad runs");
}


@end
