//
//  ViewController.m
//  AccelerometerReader
//
//  Created by Grimi on 7/12/13.
//  Copyright (c) 2013 MobileMakers. All rights reserved.
//

#import "ViewController.h"
#import "CoreMotion/CoreMotion.h"

@interface ViewController (){
    float actualAcceleration;
    float actualvelocity;
    float relativeDisplacement;
    float distance;
    float velocity;
    NSTimer *timeTranscurred;
    __weak IBOutlet UILabel *distanceLabel;
    

}
- (IBAction)startLectures:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    currentMaxAccelX = 0;
    currentMaxAccelY = 0;
    currentMaxAccelZ = 0;

    self.motionManager = [[CMMotionManager alloc] init];
    self.motionManager.accelerometerUpdateInterval = .2;
    //timeTranscurred = [NSTimer timerWithTimeInterval:<#(NSTimeInterval)#> invocation:<#(NSInvocation *)#> repeats:<#(BOOL)#>]
    
    
    
    /*[self.motionManager startAccelerometerUpdatesToQueue:[NSOperationQueue currentQueue] withHandler:^(CMAccelerometerData  *accelerometerData, NSError *error) {
                [self outputAccelertionData:accelerometerData.acceleration];
                if(error){
                    NSLog(@"%@", error);
                        }
                }
     ];*/
    
    
	// Do any additional setup after loading the view, typically from a nib.
}

-(void)outputAccelertionData:(CMAcceleration)acceleration
{
    
    velocity = acceleration.x;
    
    self.accX.text = [NSString stringWithFormat:@" %.4fg",10*acceleration.x];
    
    if(fabs(acceleration.x) > fabs(currentMaxAccelX))
        currentMaxAccelX = acceleration.x;
    
    self.accY.text = [NSString stringWithFormat:@" %.4fg",10*acceleration.y];
    
    if(fabs(acceleration.y) > fabs(currentMaxAccelY))
        currentMaxAccelY = acceleration.y;
    
    self.accZ.text = [NSString stringWithFormat:@" %.4fg",10*acceleration.z];
    
    if(fabs(acceleration.z) > fabs(currentMaxAccelZ))
        currentMaxAccelZ = acceleration.z;
    
    self.maxAccX.text = [NSString stringWithFormat:@" %.4f",10*currentMaxAccelX];
    self.maxAccY.text = [NSString stringWithFormat:@" %.4f",10*currentMaxAccelY];
    self.maxAccZ.text = [NSString stringWithFormat:@" %.4f",10*currentMaxAccelZ];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (IBAction)resetMaxValues:(id)sender {
    currentMaxAccelX = 0;
    currentMaxAccelY = 0;
    currentMaxAccelZ = 0;
    
}
- (void)viewDidUnload {
    distanceLabel = nil;
    [super viewDidUnload];
}
- (IBAction)startLectures:(id)sender {

    [self.motionManager startAccelerometerUpdatesToQueue:[NSOperationQueue currentQueue] withHandler:^(CMAccelerometerData  *accelerometerData, NSError *error) {
        [self outputAccelertionData:accelerometerData.acceleration];
        if(error){
            NSLog(@"%@", error);
        }
    }
     ];


}
@end
