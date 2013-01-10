//
//  PricesDetail.h
//  Campus Festen
//
//  Created by Villars Gimm on 08/01/12.
//  Copyright (c) 2012 RibEye Studios. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Price.h"

@interface PricesDetail : UIViewController{
    IBOutlet UILabel *priceTitle;
    IBOutlet UILabel *pricePrice;
    IBOutlet UILabel *priceAlc;
    IBOutlet UILabel *priceDescription;
    NSString *textSelected;
}

@property (retain,nonatomic) IBOutlet UILabel *priceTitle;
@property (retain,nonatomic) IBOutlet UILabel *pricePrice;
@property (retain,nonatomic) IBOutlet UILabel *priceAlc;
@property (retain,nonatomic) IBOutlet UILabel *priceDescription;

@property (retain,nonatomic) NSString *textSelected;

-(void) setupWithPrice:(Price *) price;

@end
