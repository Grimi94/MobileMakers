//
//  ViewController.m
//  SimonSays
//
//  Created by Grimi on 8/1/13.
//  Copyright (c) 2013 MobileMakers. All rights reserved.
//

#import "ViewController.h"
#import "ColorPanel.h"
#import <QuartzCore/QuartzCore.h>
#import "PlayButton.h"
#import <AVFoundation/AVFoundation.h>

@interface ViewController ()
{
    int index;
    int numberOfTouches;
    BOOL simonSaid;
    BOOL firstrun;
    AVAudioPlayer * audioPlayer;
    NSString * audioPath;
    NSURL * audioURL;
    NSMutableArray * randomFlashes;
    NSMutableArray * userSelections;
    
    UIColor * glowColor;
    __weak IBOutlet UIButton *startButton;
    __weak IBOutlet UIView *retryView;
    
}

- (IBAction)generateAndFlash:(UIButton*)sender;
- (IBAction)resetGame:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad
{
    retryView.hidden = YES;
    firstrun = YES;
    simonSaid = NO;
    numberOfTouches = 0;
    userSelections = [NSMutableArray arrayWithCapacity:10];
    randomFlashes = [NSMutableArray arrayWithCapacity:10];
    audioPath = [[NSBundle mainBundle] pathForResource:@"click1" ofType:@".mp3"];
    audioURL = [NSURL fileURLWithPath:audioPath];
    audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:audioURL error:nil];
    
    [super viewDidLoad];
    
	for(UIView * existingViews in self.view.subviews)
    {
        if ([existingViews isKindOfClass:[ColorPanel class]])
        {
            ((ColorPanel*)existingViews).delegate = self;
        }
    }
}


-(void)returnTagAndSaveTouch:(int)tag
{
    if (numberOfTouches != [randomFlashes count]) {
        [userSelections addObject:[NSNumber numberWithInt:tag]];
        if ([[userSelections objectAtIndex:numberOfTouches] integerValue] != [[randomFlashes objectAtIndex:numberOfTouches] integerValue]) {
            retryView.hidden = NO;
        }
        
    }
    numberOfTouches++;
    if ((numberOfTouches-1) == ([randomFlashes count]-1)) {
            NSLog(@"Good!");
        startButton.userInteractionEnabled = YES;
        startButton.alpha = 1;
    }

    
}


-(IBAction)generateAndFlash:(UIButton*)sender
{
    [audioPlayer play];
    startButton.userInteractionEnabled = NO;
    startButton.alpha = .5;
    numberOfTouches = 0;
    [userSelections removeAllObjects];
    index = 0;
    
    [randomFlashes addObject:[NSString stringWithFormat:@"%i",(int)arc4random_uniform(6)+1]];
    
    for(NSString * tag in randomFlashes)
    {
        for(UIView * existingViews in self.view.subviews)
        {
            if ([existingViews isKindOfClass:[ColorPanel class]]) {
                if (((ColorPanel*)existingViews).tag == [tag integerValue]) {
                    [((ColorPanel*)existingViews) performSelector:@selector(highlight) withObject:nil afterDelay:(2+index)];
                    index++;
                }
            }
        }
    }
}

- (IBAction)resetGame:(id)sender {
    startButton.userInteractionEnabled = YES;
    startButton.alpha = 1;
    numberOfTouches = 0;
    index = 0;
    retryView.hidden = YES;
    simonSaid = NO;

    [randomFlashes removeAllObjects];
    [userSelections removeAllObjects];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
