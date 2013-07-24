//
//  EditViewController.m
//  Day6(Tables)
//
//  Created by Grimi on 7/17/13.
//  Copyright (c) 2013 MobileMakers. All rights reserved.
//

#import "EditViewController.h"
#import "ChangeLabel.h"

@interface EditViewController ()
{
    __weak IBOutlet UITextField *inputBox;
}

- (IBAction)changeText:(id)sender;
@end

@implementation EditViewController
@synthesize textField;
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
    inputBox.text = textField;
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)changeText:(id)sender {
    [delegate executeLabelChange:inputBox.text];
    [self.navigationController popViewControllerAnimated:YES];
}
@end
