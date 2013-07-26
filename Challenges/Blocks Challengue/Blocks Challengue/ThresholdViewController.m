//
//  ThresholdViewController.m
//  Blocks Challengue
//
//  Created by Grimi on 7/23/13.
//  Copyright (c) 2013 MobileMakers. All rights reserved.
//

#import "ThresholdViewController.h"

@interface ThresholdViewController ()
{
    __weak IBOutlet UITextField *thresholdField;
}
@end

@implementation ThresholdViewController
@synthesize delegate;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}


- (void)viewWillDisappear:(BOOL)animated
{
    [delegate filterArray:[thresholdField.text intValue]];              
    [super viewWillDisappear:animated];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
