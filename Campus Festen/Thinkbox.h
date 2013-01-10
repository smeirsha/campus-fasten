//
//  Thinkbox.h
//  Campus Festen
//
//  Created by Nicki Hansen on 15/01/12.
//  Copyright (c) 2012 RibEye Studios. All rights reserved.
//



@interface Thinkbox : UIViewController
{
    //NSMutableArray * dice;
    IBOutlet UIButton * rollButton;
    IBOutlet UIButton * addDiceButton;
    IBOutlet UIButton * removeDiceButton;
 //   UIButton * plusButton;
 //   UIButton * minusButton;
    
}
@property (nonatomic, retain) NSArray * diceSource;
@property (nonatomic, retain) NSMutableArray * dice;
-(IBAction)rollButtonPressed:(id)sender;

-(void) setAnimatingState:(BOOL)animatingState; //turn off buttons until completed
-(void) animateDice;
-(void) stopAnimatingDice;

-(IBAction) addDiePressed:(id)sender;
-(IBAction) removeDiePressed:(id)sender;
-(void) setNumberOfDice:(int)number; 

@end
