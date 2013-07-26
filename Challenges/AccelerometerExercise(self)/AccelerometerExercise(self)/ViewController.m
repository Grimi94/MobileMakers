//
//  ViewController.m
//  AccelerometerExercise(self)
//
//  Created by Grimi on 7/12/13.
//  Copyright (c) 2013 MobileMakers. All rights reserved.
//

#import "ViewController.h"


@implementation ViewController

@synthesize labelX;
@synthesize labelY;
@synthesize labelZ;

@synthesize progressX;
@synthesize progressY;
@synthesize progressZ;

@synthesize accelerometer;


- (void)viewDidLoad
{
    [super viewDidLoad];
	
    accelerometer = [UIAccelerometer sharedAccelerometer];
    accelerometer.delegate = self;
    self.accelerometer.updateInterval = .1;

}

- (void)accelerometer:(UIAccelerometer *)accelerometer didAccelerate:(UIAcceleration *)acceleration {
    labelX.text = [NSString stringWithFormat:@"%@%f", @"X: ", acceleration.x];
    labelY.text = [NSString stringWithFormat:@"%@%f", @"Y: ", acceleration.y];
    labelZ.text = [NSString stringWithFormat:@"%@%f", @"Z: ", acceleration.z];
    
    self.progressX.progress = ABS(acceleration.x);
    self.progressY.progress = ABS(acceleration.y);
    self.progressZ.progress = ABS(acceleration.z);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
