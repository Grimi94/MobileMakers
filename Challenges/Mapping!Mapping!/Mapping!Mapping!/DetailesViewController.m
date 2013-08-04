//
//  DetailesViewController.m
//  Mapping!Mapping!
//
//  Created by Grimi on 7/30/13.
//  Copyright (c) 2013 MobileMakers. All rights reserved.
//

#import "DetailesViewController.h"

@interface DetailesViewController ()
{
    
    __weak IBOutlet UILabel *number1;
    __weak IBOutlet UILabel *number2;
    __weak IBOutlet UILabel *number3;
    __weak IBOutlet UILabel *number4;
}
@end

@implementation DetailesViewController
@synthesize routeName,routes,Direction,transfer;

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
    number1.text= routeName;
    number2.text= routes;
    number3.text= Direction;
    number4.text= transfer;
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
