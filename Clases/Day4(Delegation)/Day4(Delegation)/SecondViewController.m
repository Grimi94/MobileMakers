//
//  SecondViewController.m
//  Day4(Delegation)
//
//  Created by Grimi on 7/15/13.
//  Copyright (c) 2013 MobileMakers. All rights reserved.
//

#import "SecondViewController.h"
#import "colorDelegate.h"

@interface SecondViewController ()
{
    
}

- (IBAction)makeRed:(id)sender;
- (IBAction)makeGreen:(id)sender;
- (IBAction)makeWhite:(id)sender;
- (IBAction)makeGray:(id)sender;
- (IBAction)changeText:(id)sender;


@end

@implementation SecondViewController
@synthesize delegate;

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
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)makeRed:(id)sender {
    [delegate changeColor:[UIColor redColor]];

}

- (IBAction)makeGreen:(id)sender {
    [delegate changeColor:[UIColor greenColor]];
}

- (IBAction)makeWhite:(id)sender {
    [delegate changeColor:[UIColor whiteColor]];
}

- (IBAction)makeGray:(id)sender {
    [delegate changeColor:[UIColor grayColor]];
}

- (IBAction)changeText:(UITextField *)sender {
        [delegate changeText:sender.text];
}


@end
