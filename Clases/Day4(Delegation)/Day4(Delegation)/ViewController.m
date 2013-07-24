//
//  ViewController.m
//  Day4(Delegation)
//
//  Created by Grimi on 7/15/13.
//  Copyright (c) 2013 MobileMakers. All rights reserved.
//

#import "ViewController.h"
#import "SecondViewController.h"
#import "ThirdViewController.h"

@interface ViewController ()
{
    SecondViewController * anotherView;
    __weak IBOutlet UILabel *colorLabel;
}

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    anotherView = [[SecondViewController alloc] initWithNibName:nil bundle:nil];
    [self.view addSubview:anotherView.view];
    anotherView.view.center = self.view.center;
	// Do any additional setup after loading the view, typically from a nib.
    //thirdView.delegate = self;
    anotherView.delegate = self;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark ColorDelegate

-(void)changeColor:(UIColor*)color{
    self.view.backgroundColor = color;
    
}

-(void)changeText:(NSString *)text{
    colorLabel.text = text;
}


@end
