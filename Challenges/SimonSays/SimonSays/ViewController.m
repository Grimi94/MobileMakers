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

@interface ViewController ()
{
    NSMutableArray * randomFlashes;
    //NSMutableArray * randomtest;
    int startGame;
    int index;
    UIColor * glowColor;
    __weak IBOutlet UIButton *startButton;
    
}
-(IBAction)generateAndFlash:(id)sender;
@end

@implementation ViewController

- (void)viewDidLoad
{
    /*randomtest = [NSMutableArray arrayWithCapacity:10];
    for (int i = 0; i<30; i++) {
        [randomtest addObject:[NSString stringWithFormat:@"%i",(int)random()%7+1]];
    }*/
    
    startGame = 0;
    randomFlashes = [NSMutableArray arrayWithCapacity:10];
    startButton.layer.cornerRadius = 40;
    glowColor = startButton.backgroundColor;
    //startButton.layer.shadowColor = [glowColor CGColor];
    startButton.layer.shadowRadius = 15.0f;
    //startButton.layer.masksToBounds = NO;
    //startButton.backgroundColor = [UIColor colorWithRed: 0.0f green:0.0f blue:255.0f alpha:1];
    //startButton.opaque = NO;
    
    [super viewDidLoad];
    
	for(UIView * existingViews in self.view.subviews)
    {
        if ([existingViews isKindOfClass:[ColorPanel class]]) {
            ((ColorPanel*)existingViews).delegate = self;
        }
    }
}

-(void)returnTag:(int)tag
{
    
}

-(IBAction)generateAndFlash:(id)sender
{
    startGame ++;
    index = 0;
    [randomFlashes addObject:[NSString stringWithFormat:@"%i",(int)arc4random_uniform(6)+1]];
    for(NSString * tag in randomFlashes)
    {
        for(UIView * existingViews in self.view.subviews)
        {
            if ([existingViews isKindOfClass:[ColorPanel class]]) {
                if (((ColorPanel*)existingViews).tag == [tag integerValue]) {
                    [((ColorPanel*)existingViews) performSelector:@selector(highlight) withObject:nil afterDelay:(1+index)];
                    index++;
                }
            }
        }

    }
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
