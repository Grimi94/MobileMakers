//
//  ViewController.m
//  Acelerometer(self)second
//
//  Created by Grimi on 7/12/13.
//  Copyright (c) 2013 MobileMakers. All rights reserved.
//

#import "ViewController.h"
 #import <CoreMotion/CoreMotion.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [self startMyMotionDetect];
}
-(void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    [self.motionManager stopAccelerometerUpdates];
}

-(void)startMyMotionDetect
{
    __block float stepMoveFactor = 15;
    [self.motionManager startAccelerometerUpdatesToQueue:[[NSOperationQueue alloc] init] withHandler:^(CMAccelerometerData *data, NSError * error)
    {
        dispatch_async(dispatch_get_main_queue(),
            ^{
            CGRect rect = self.movingView.frame;
            
            float movetoX = rect.origin.x + (data.acceleration.x *stepMoveFactor);
            float maxX = self.view.frame.size.width - rect.size.width;
            float movetoY = (rect.origin.y + rect.size.height) - (data.acceleration.y * stepMoveFactor);
            float maxY = self.view.frame.size.height;
            
            if( movetoX > 0 && movetoY < maxX ){
                rect.origin.x += (data.acceleration.x * stepMoveFactor);
            }
            if (movetoY > 0 && movetoY < maxY){
                rect.origin.y -= (data.acceleration.y * stepMoveFactor);
            }
            [UIView animateWithDuration:0
                                  delay:0
                            options:UIViewAnimationCurveEaseInOut animations:
             ^{
                self.movingView.frame = rect;
            }
                             completion:nil
             ];
        }
                       );}];
    }


-(CMMotionManager *)motionManager
{
    CMMotionManager * motionManager = nil;
    id appDelegate = [UIApplication sharedApplication].delegate;
    if ([appDelegate respondsToSelector:@selector(motionManager)]) {
        motionManager = [appDelegate motionManager];
    }
    
    return motionManager;
}

@end
