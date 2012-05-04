//
//  CameraViewController.m
//  projectWing
//
//  Created by Vaishaal Shankar on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//


#import "CameraViewController.h"
#import "UIIMage-Extensions.h" 

@implementation CameraViewController
@synthesize imagePickerController;
- (void)viewDidLoad{ 
    self.imagePickerController =[[[UIImagePickerController alloc] init] autorelease] ;
    self.imagePickerController.sourceType = UIImagePickerControllerSourceTypeCamera;
    self.imagePickerController.delegate = self; 
    [self presentModalViewController:self.imagePickerController animated:YES];
    DBRestClient *restClient;
    
}   
- (DBRestClient *)restClient {
    if (!restClient) {
        restClient =
        [[DBRestClient alloc] initWithSession:[DBSession sharedSession]];
        restClient.delegate = self;
    }
    return restClient;
}

- (void)restClient:(DBRestClient*)client uploadedFile:(NSString*)destPath
              from:(NSString*)srcPath metadata:(DBMetadata*)metadata {
    
    NSLog(@"File uploaded successfully to path: %@", metadata.path);
}

- (void)restClient:(DBRestClient*)client uploadFileFailedWithError:(NSError*)error {
    NSLog(@"File upload failed with error - %@", error);
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *pathToDocuments=[paths objectAtIndex:0];
    NSString *localPath = pathToDocuments; 
    NSUserDefaults *defaults = [[NSUserDefaults alloc] init];
    UIImage *image = [info objectForKey:UIImagePickerControllerOriginalImage];
    image = [image imageRotatedByDegrees:90.0];
    image = [image imageByScalingToSize:CGSizeMake(480, 640)];

    NSData *imageData = UIImageJPEGRepresentation(image, 0.5);
    NSString *imagePath = [pathToDocuments stringByAppendingPathComponent:@"testFile.jpg"]; 
    [imageData writeToFile:imagePath atomically:YES];
    NSLog(@"startingPath");
    NSString *destDir = [@"/" stringByAppendingPathComponent:[defaults stringForKey:@"name"]];
    [[self restClient] uploadFile:@"testFile.jpg" toPath:destDir
                    withParentRev:nil fromPath:imagePath];
    [imagePickerController dismissModalViewControllerAnimated:NO]; 
    
    
  
    
  
    
    
}
@end
