//
//  Price.h
//  Campus Festen
//
//  Created by Villars Gimm on 08/01/12.
//  Copyright (c) 2012 RibEye Studios. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Price : NSObject{
    NSString *title;
    NSString *price;
    NSString *alc;
    NSString *description;
}

@property (retain,nonatomic) NSString *title;
@property (retain,nonatomic) NSString *price;
@property (retain,nonatomic) NSString *alc;
@property (retain,nonatomic) NSString *description;

@end
