//
//  AppDelegate.m
//  projectWing
//
//  Created by Vaishaal Shankar on 4/25/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "projectWingAppDelegate.h"
#import <DropboxSDK/DropboxSDK.h>

@implementation projectWingAppDelegate

@synthesize window = _window;
@synthesize controller; 




- (void)dealloc
{
    [firstViewController release];

    [enterSessionController release]; 
    [_window release];
    [super dealloc];
    
}
- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url {
    if ([[DBSession sharedSession] handleOpenURL:url]) {
        if ([[DBSession sharedSession] isLinked]) {
            NSLog(@"App linked successfully!");
            // At this point you can start making API calls
        }
        return YES;
    }
    // Add whatever other url handling code your app requires here
    return NO;
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {   
   
    [window makeKeyAndVisible];
    NSLog(@"BOO00000");
   
    [[NSUserDefaults standardUserDefaults] setPersistentDomain:[NSDictionary dictionary] forName:[[NSBundle mainBundle] bundleIdentifier]];   
    DBSession* dbSession = [[[DBSession alloc]
      initWithAppKey:@"byu6l50n4v1681s"
      appSecret:@"5heemzp3wv9rsoi"
      root:kDBRootAppFolder] // either kDBRootAppFolder or kDBRootDropbox
     autorelease];
    [DBSession setSharedSession:dbSession];
    NSLog([dbSession description]);
  
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     
     */
    [[NSNotificationCenter defaultCenter] postNotificationName: @"didEnterBackground" 
                                                        object: nil 
                                                      userInfo: nil];
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{

    /*
     
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
     */
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    /*
     Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
     */
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    NSString *appDomain = [[NSBundle mainBundle] bundleIdentifier];
    [[NSUserDefaults standardUserDefaults] removePersistentDomainForName:appDomain];
    /*
     Called when the application is about to terminate.
     Save data if appropriate.
     See also applicationDidEnterBackground:.
     */
}

@end
