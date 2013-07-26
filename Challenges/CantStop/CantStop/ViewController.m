//
//  ViewController.m
//  CantStop
//
//  Created by Grimi on 7/12/13.
//  Copyright (c) 2013 MobileMakers. All rights reserved.
//

#import "ViewController.h"

@interface ViewController (){
    
    __weak IBOutlet UILabel *timerLabel;
    __weak IBOutlet UIButton *modeButtonLabel;
    __weak IBOutlet UIButton *stateLabel;
    
    UIFont * timerFont;
    NSTimer * coolTimer;
    int minutes,seconds,miliseconds;
    int timeVariable;
    BOOL isStarted;
    BOOL isTimerOn;
}

- (IBAction)startThingy:(UIButton*)sender;
- (IBAction)incrementMethod:(UIButton *)sender;
- (IBAction)changeState:(UIButton*)sender;
- (IBAction)resetMethod:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *timerProperty;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    timeVariable = 0;
    isTimerOn = YES;
    isStarted = NO;
    [modeButtonLabel setTitle:@"Timer" forState:UIControlStateNormal];
    timerFont = [UIFont fontWithName:@"Atomic Clock Radio" size:70];
    [_timerProperty setFont:timerFont];
    
}

- (void)updateTiming{
    if(timeVariable == 0) {
        isStarted = !isStarted;
        [stateLabel setTitle:@"Start" forState:UIControlStateNormal];
    }
    //hours = timeVariable / 3600;
    minutes = (timeVariable % 3600) / 60;
    seconds = (timeVariable % 3600) % 60;
    timerLabel.text = [NSString stringWithFormat:@"%02d:%02d", minutes, seconds];
    
}

- (IBAction)incrementMethod:(UIButton *)sender {
    
    if (isTimerOn) {
        switch (sender.tag) {
            case 1:
                timeVariable++;
                break;
            case 2:
                timeVariable += 10;
                break;
            case 3:
                timeVariable += 60;
                break;
            case 4:
                timeVariable +=600;
                break;
            default:
                break;
        }
        [self updateTiming];
        /* minutes = (timeVariable % 3600) / 60;
         seconds = (timeVariable % 3600) % 60;
         timerLabel.text = [NSString stringWithFormat:@"%02d:%02d", minutes, seconds];*/
    }

}

- (IBAction)changeState:(UIButton*)sender {
    
    [coolTimer invalidate];
    timeVariable = 0;
    [self updateTiming];
    
    isTimerOn = !isTimerOn;
    isTimerOn? [sender setTitle:@"Timer" forState:UIControlStateNormal]:[sender setTitle:@"StopWatch" forState:UIControlStateNormal];
}

- (IBAction)resetMethod:(id)sender {
    [coolTimer invalidate];
    timeVariable = 0 ;
    [self updateTiming];
    
}

-(void)countdownTimer{

    (isTimerOn && timeVariable != 0)? timeVariable -- : timeVariable++ ;
    [self updateTiming];
    if (timeVariable == 0)
        [coolTimer invalidate];
   
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)startThingy:(UIButton*)sender {
    if (!isStarted) {
        isStarted = !isStarted;
        [sender setTitle:@"Pause" forState:UIControlStateNormal];
        coolTimer = [NSTimer scheduledTimerWithTimeInterval:1.0f target:self selector:@selector(countdownTimer) userInfo:nil repeats:YES];
    }
    else{
        [sender setTitle:@"Start" forState:UIControlStateNormal];
        [coolTimer invalidate];
        isStarted = !isStarted;
    }
    
}
@end
