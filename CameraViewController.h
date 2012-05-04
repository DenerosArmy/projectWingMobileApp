//
//  CameraViewController.h
//  projectWing
//
//  Created by Vaishaal Shankar on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <DropboxSDK/DropboxSDK.h>
@protocol CameraViewControllerDelegate;
@interface CameraViewController: UIViewController<DBRestClientDelegate, UINavigationControllerDelegate,UIImagePickerControllerDelegate> 
{     
    id <CameraViewControllerDelegate> delegate;
    UIImagePickerController *imagePickerController;
    DBRestClient *restClient;
}
@property (nonatomic) UIImagePickerController *imagePickerController;


@end
