//
//  Contact.m
//  Campus Festen
//
//
//Mikkel Krogh Sørensen
//mikkelsoerensen@gmail.com
//51243383
//
//Mikkel Hvidtfeldt
//hvidtfeldtmikkel@gmail.com
//23904023
//
//
//Tue Dommergaard
//tdommergaard@gmail.com
//526298904
//  Created by Villars Gimm on 03/01/12.
//  Copyright (c) 2012 RibEye Studios. All rights reserved.
//

#import "Contact.h"


@implementation Contact

@synthesize recipients, scrollView;

-(void)viewDidLoad{
    
   
    [super viewDidLoad];
    
    [scrollView setScrollEnabled:YES];
    [scrollView setContentSize:CGSizeMake(320, 760)];
    
    self.recipients = [[NSMutableArray alloc] initWithCapacity:1];
        
    if ([MFMailComposeViewController canSendMail])
		sendEmail.enabled = YES;
}

- (IBAction)facebook:(id)sender{
    NSString *url = @"http://m.facebook.com/fredagsbar.dk";
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:url]];
}

- (IBAction)homepage:(id)sender{
    NSString *url = @"http://fredagsbar.dk/";
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:url]];
}

- (IBAction)callCEO:(id)sender{
    NSString *phoneNumber = @"+4551243383";
    NSString *telString = [NSString stringWithFormat:@"tel:%@", phoneNumber];
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:telString]];
}

- (IBAction)callAccountant:(id)sender{
    NSString *phoneNumber = @"+4523904023";
    NSString *telString = [NSString stringWithFormat:@"tel:%@", phoneNumber];
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:telString]];
}
- (IBAction)callPR:(id)sender{
    NSString *phoneNumber = @"+45526298904";
    NSString *telString = [NSString stringWithFormat:@"tel:%@", phoneNumber];
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:telString]];
}

-(IBAction)sendCEO:(id)sender{
    
    MFMailComposeViewController* controller = [[MFMailComposeViewController alloc] init];
    controller.mailComposeDelegate = self;
    NSString *email = @"mikkelsoerensen@gmail.com";
    self.recipients = [[NSMutableArray alloc] init ];
    [recipients addObject:email];
    [controller setToRecipients:recipients];
    [controller setSubject:@"[APP]E-Mail til Formanden ang:"];
    [controller setMessageBody:@"<br><br>  <i>Sendt fra Fredagsbar.dks iPhone app</i>" isHTML:YES]; 
    if (controller) [self presentModalViewController:controller animated:YES];
}

-(IBAction)sendAccountant:(id)sender{
    MFMailComposeViewController* controller = [[MFMailComposeViewController alloc] init];
    controller.mailComposeDelegate = self;
    NSString *email = @"hvidtfeldtmikkel@gmail.com";
    self.recipients = [[NSMutableArray alloc] init ];
    [recipients addObject:email];
    [controller setToRecipients:recipients];
    [controller setSubject:@"[APP]E-Mail til Kasseren ang:"];
    [controller setMessageBody:@"<br><br>  <i>Sendt fra Fredagsbar.dks iPhone app" isHTML:YES]; 
    if (controller) [self presentModalViewController:controller animated:YES];
}

-(IBAction)sendPR:(id)sender{
    MFMailComposeViewController* controller = [[MFMailComposeViewController alloc] init];
    controller.mailComposeDelegate = self;
    NSString *email = @"tdommergaard@gmail.com";
    self.recipients = [[NSMutableArray alloc] init ];
    [recipients addObject:email];
    [controller setToRecipients:recipients];
    [controller setSubject:@"[APP]E-Mail til PR ang:"];
    [controller setMessageBody:@"<br><br>  <i>Sendt fra Fredagsbar.dks iPhone app" isHTML:YES]; 
    if (controller) [self presentModalViewController:controller animated:YES];
}

- (void)mailComposeController:(MFMailComposeViewController*)controller  
          didFinishWithResult:(MFMailComposeResult)result 
                        error:(NSError*)error;
{
    if (result == MFMailComposeResultSent) {
        NSLog(@"It's away!");
    }
    [self dismissModalViewControllerAnimated:YES];
}


@end
