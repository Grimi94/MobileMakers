//
//  ThirdViewController.m
//  Day9(StoryBoards)
//
//  Created by Grimi on 7/22/13.
//  Copyright (c) 2013 MobileMakers. All rights reserved.
//

#import "ThirdViewController.h"

@interface ThirdViewController ()
{

    __weak IBOutlet UILabel *thirdViewLabel;
}
@end

@implementation ThirdViewController
@synthesize thirdViewString;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    thirdViewLabel.text = thirdViewString;
    
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
