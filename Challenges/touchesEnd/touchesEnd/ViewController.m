//
//  ViewController.m
//  touchesEnd
//
//  Created by Grimi on 7/15/13.
//  Copyright (c) 2013 MobileMakers. All rights reserved.
//

#import "ViewController.h"
#import "SecondView.h"

@interface ViewController ()
{
    SecondView * topView;
    SecondView * bottomView;
    __weak IBOutlet UILabel *viewTag;
}
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    topView = [[SecondView alloc] initWithFrame:CGRectMake(20, 20, 50, 50)];
    bottomView = [[SecondView alloc] initWithFrame:CGRectMake(20, 100, 50, 50)];
    topView.backgroundColor = [UIColor blueColor];
    bottomView.backgroundColor = [UIColor greenColor];
    [self.view addSubview:topView];
    [self.view addSubview:bottomView];
    topView.tag = 1;
    bottomView.tag = 2;
    topView.delegate = self;
    bottomView.delegate = self;
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)changeLabel:(UIView*)view{
    viewTag.text = [NSString stringWithFormat:@"%i",view.tag];
}

@end
