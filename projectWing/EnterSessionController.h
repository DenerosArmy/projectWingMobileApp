//
//  EnterSessionController.h
//  projectWing
//
//  Created by Vaishaal Shankar on 4/26/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EnterSessionModel.h"
#import "EnterSession.h"



@interface EnterSessionController : UIViewController
{
@private
    IBOutlet EnterSession* _enterSessionView;
    EnterSessionModel* _enterModel;
    
    
}
@end
