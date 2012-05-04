//
//  AppDelegate.h
//  projectWing
//
//  Created by Vaishaal Shankar on 4/25/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Controller.h" 
#import "FirstViewController.h"



@interface projectWingAppDelegate : UIResponder <UIApplicationDelegate>
{
    Controller *enterSessionController;
    FirstViewController *firstViewController;
       NSString *relinkUserId; 
    
    UIWindow *window; 
    
}
@property (strong, nonatomic) IBOutlet UIWindow *window;
@property (nonatomic,retain) IBOutlet Controller *controller; 


@end
