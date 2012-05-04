//
//  EnterSession.h
//  projectWing
//
//  Created by Vaishaal Shankar on 4/26/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
@class EnterSessionController;

@interface EnterSession : UIView
{ 
    @private
    IBOutlet EnterSessionController* _enterSessionController;
}
@property (retain) IBOutlet EnterSessionController* _enterSessionController;

        
@end
