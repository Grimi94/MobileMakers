//
//  ViewController.m
//  ViewFunHouse
//
//  Created by keith Alperin on 4/30/13.
//  Copyright (c) 2013 Mobile Makers. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    __weak IBOutlet UIButton *changeColor;
    __weak IBOutlet UIButton *stateButton;
    BOOL State;
    __weak IBOutlet UILabel *sliderNumber;
    __weak IBOutlet UISlider *slider;
}

- (IBAction)actionButton:(id)sender;
- (IBAction)sliderAction:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [stateButton setTitle:@"hello" forState:UIControlStateNormal];
    State = YES;
	// Do any additional setup after loading the view, typically from a nib.
}


- (IBAction)actionButton:(id)sender {
    State = !State;
    
    if(State){
        [stateButton setTitle:@"hello" forState:UIControlStateNormal];
    }
    else
        [stateButton setTitle:@"bye" forState:UIControlStateNormal];
    
}

- (IBAction)sliderAction:(id)sender {
    sliderNumber.text = [NSString stringWithFormat:@"%1.6f", slider.value];
}
@end
