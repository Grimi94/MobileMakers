//
//  ViewController.m
//  Day15(Notifications)
//
//  Created by Grimi on 7/31/13.
//  Copyright (c) 2013 MobileMakers. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    __weak IBOutlet UILabel *labelOne;
    
}

@end

@implementation ViewController

- (void)viewDidLoad
{
    labelOne.text = @"0";
    NSNotificationCenter * notificationCenter = [NSNotificationCenter defaultCenter];
    [super viewDidLoad];
    [notificationCenter addObserverForName:UIApplicationWillEnterForegroundNotification object:nil queue:[NSOperationQueue mainQueue] usingBlock:^(NSNotification *note) {
        [self incrementCount];
    }];
    
    [notificationCenter addObserver:self selector:@selector(incrementCount) name:@"TouchNotification" object:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) incrementCount
{
    NSInteger count = labelOne.text.integerValue;
    count ++;
    labelOne.text = [NSString stringWithFormat:@"%i",count];
}

@end
