//
//  Thinkbox.m
//  Campus Festen
//
//  Created by Nicki Hansen on 15/01/12.
//  Copyright (c) 2012 RibEye Studios. All rights reserved.
//

#define STARTING_DICE 5
#import "Thinkbox.h"

@implementation Thinkbox
@synthesize dice, diceSource;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
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

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.diceSource = [NSArray arrayWithObjects:[UIImage imageNamed:@"1"],
                  [UIImage imageNamed:@"2"],
                  [UIImage imageNamed:@"3"],
                  [UIImage imageNamed:@"4"],
                  [UIImage imageNamed:@"5"],
                 [UIImage imageNamed:@"6"], nil];
    

    
    [self setNumberOfDice:STARTING_DICE];
                 
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

-(IBAction)rollButtonPressed:(id)sender
{
        [self animateDice];
}

-(void) setAnimatingState:(BOOL)animatingState
{
 //turn off buttons until completed   
    [rollButton setEnabled:!animatingState]; 
    [addDiceButton setEnabled:!animatingState];
    [removeDiceButton setEnabled:!animatingState];

}
-(void) animateDice
{
    for (UIImageView* die in self.dice) {
        [die startAnimating];
    }
    [NSTimer scheduledTimerWithTimeInterval:2.0 
                            target:self 
                          selector:@selector(stopAnimatingDice) 
                          userInfo:nil 
                           repeats:NO];
    [self setAnimatingState:YES];

}
-(void) stopAnimatingDice
{
    for (UIImageView* die in self.dice) {
        [die stopAnimating];
        int rollValue = arc4random() % 6;
        NSLog(@"Roll: %d", rollValue+1); // starting at 0
        die.image = [diceSource objectAtIndex:rollValue];
    }
    [self setAnimatingState:NO];    
    
}

-(void) addDiePressed:(id)sender
{
    [self setNumberOfDice: dice.count + 1];
}
-(void) removeDiePressed:(id)sender
{
    [self setNumberOfDice: dice.count - 1];
}
-(void) setNumberOfDice:(int)number
{
    if(number > 0 && number < 10)
    {
        if (self.dice.count > 0)
        {
            for (UIImageView* die in self.dice) {
                [die removeFromSuperview];
            }
        }
        
        
        self.dice = [NSMutableArray arrayWithCapacity:number];
        for (int i = 0; i < number; i++) {
            
            UIImageView * myDie = [[UIImageView alloc] initWithImage:[self.diceSource objectAtIndex:0]];
            myDie.animationImages = self.diceSource;
            myDie.animationDuration = .8;
            myDie.animationRepeatCount = 0;            
            
            myDie.frame = CGRectMake( 16 + (i % 3 * 100), 16 + (100 * floorf(i/3)), 80, 80);
            
            [self.dice addObject:myDie];
            
            
        }
        for (UIImageView* die in self.dice) {
            [self.view addSubview:die];
        }
    }
}
@end
