//
//  FirstViewController.h
//  projectWing
//
//  Created by Vaishaal Shankar on 4/25/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Opentok/Opentok.h>


@interface FirstViewController : UIViewController <OTSessionDelegate, OTSubscriberDelegate, OTPublisherDelegate>
- (void)doConnect;
- (void)doPublish;
- (void)showAlert:(NSString*)string;

-(IBAction)connect:(id)sender;
@end
