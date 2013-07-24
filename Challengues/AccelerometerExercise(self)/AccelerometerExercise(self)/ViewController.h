//
//  ViewController.h
//  AccelerometerExercise(self)
//
//  Created by Grimi on 7/12/13.
//  Copyright (c) 2013 MobileMakers. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UIAccelerometerDelegate>
{
    IBOutlet UILabel *labelX;
    
    IBOutlet UILabel *labelY;

    IBOutlet UILabel *labelZ;
    
    IBOutlet UIProgressView *progressX;
    
    IBOutlet UIProgressView *progressY;
    
    IBOutlet UIProgressView *progressZ;
    UIAccelerometer* accelerometer;
}
@property (strong, nonatomic) IBOutlet UILabel *labelX;
@property (strong, nonatomic) IBOutlet UILabel *labelY;
@property (strong, nonatomic) IBOutlet UILabel *labelZ;
@property (strong, nonatomic) IBOutlet UIProgressView *progressX;
@property (strong, nonatomic) IBOutlet UIProgressView *progressY;
@property (strong, nonatomic) IBOutlet UIProgressView *progressZ;


@property (strong, nonatomic) UIAccelerometer *accelerometer;


@end
