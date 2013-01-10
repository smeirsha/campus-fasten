//
//  Contact.h
//  Campus Festen
//
//  Created by Villars Gimm on 03/01/12.
//  Copyright (c) 2012 RibEye Studios. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <MessageUI/MFMailComposeViewController.h>

@interface Contact : UIViewController<MFMailComposeViewControllerDelegate> {
    IBOutlet UIScrollView *scrollView;
    //IBOutlet UIButton *callPhone;
    IBOutlet UIButton *sendEmail;
    NSMutableArray *recipients;
}

@property (nonatomic, retain) IBOutlet UIScrollView *scrollView;

//@property (nonatomic, retain) IBOutlet UIButton *callPhone;
//@property (nonatomic, retain) IBOutlet UIButton *sendEmail;

@property (nonatomic, retain) NSMutableArray *recipients;

//@property (nonatomic, retain) NSNumber *phoneNumber;
//@property (nonatomic, retain) NSString *email;

-(IBAction)callCEO:(id)sender;
-(IBAction)sendCEO:(id)sender;

-(IBAction)callAccountant:(id)sender;
-(IBAction)sendAccountant:(id)sender;


-(IBAction)callPR:(id)sender;
-(IBAction)sendPR:(id)sender;

- (IBAction)homepage:(id)sender;
- (IBAction)facebook:(id)sender;

//-(IBAction)sendToAll:(id)sender;

@end
