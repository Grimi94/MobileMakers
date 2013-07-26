//
//  AppDelegate.h
//  Acelerometer(self)second
//
//  Created by Grimi on 7/12/13.
//  Copyright (c) 2013 MobileMakers. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreMotion/CoreMotion.h>

@class ViewController;

@interface AppDelegate : UIResponder <UIApplicationDelegate>{
    CMMotionManager * motionManager;
}

@property (readonly) CMMotionManager * motionManager;

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) ViewController *viewController;

@end
