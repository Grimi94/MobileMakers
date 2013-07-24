//
//  SecondViewController.m
//  Day9(StoryBoards)
//
//  Created by Grimi on 7/22/13.
//  Copyright (c) 2013 MobileMakers. All rights reserved.
//

#import "SecondViewController.h"
#import "ThirdViewController.h"

@interface SecondViewController ()
-(IBAction)swipeLeft:(id)sender;
@end

@implementation SecondViewController

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
    self.view.backgroundColor = [UIColor blueColor];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(IBAction)swipeLeft:(id)sender{
    [self performSegueWithIdentifier:@"toThird" sender:self];
    
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    ThirdViewController * thirdViewController = segue.destinationViewController;
    thirdViewController.thirdViewString = @"Cool String";
}

@end
