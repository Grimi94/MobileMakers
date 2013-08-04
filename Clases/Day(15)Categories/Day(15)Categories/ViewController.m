//
//  ViewController.m
//  Day(15)Categories
//
//  Created by Grimi on 7/31/13.
//  Copyright (c) 2013 MobileMakers. All rights reserved.
//

#import "ViewController.h"
#import "NSString+MMExtension.h"

@interface ViewController ()
{
    __weak IBOutlet UILabel *myLabel;
    
    __weak IBOutlet UITextField *textField;
}
- (IBAction)changeLabel:(id)sender;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)changeLabel:(id)sender {
    myLabel.text = [textField.text mmReverseString];
    
  
}
@end
