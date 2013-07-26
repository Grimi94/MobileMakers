//
//  EditViewController.m
//  TodoList
//
//  Created by Grimi on 7/17/13.
//  Copyright (c) 2013 MobileMakers. All rights reserved.
//

#import "EditViewController.h"

@interface EditViewController ()

- (IBAction)editLabel:(id)sender;
@end

@implementation EditViewController
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

- (IBAction)editLabel:(id)sender {
}
@end
