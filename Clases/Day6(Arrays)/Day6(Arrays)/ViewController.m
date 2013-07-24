//
//  ViewController.m
//  Day6(Arrays)
//
//  Created by Grimi on 7/16/13.
//  Copyright (c) 2013 MobileMakers. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    
    __weak IBOutlet UILabel *mylabel;
    __weak IBOutlet UITextField *myTextField;
    NSMutableArray * array;
}

- (IBAction)changeLabel:(id)sender;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    array = [NSMutableArray arrayWithCapacity:10];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)changeLabel:(id)sender {
    mylabel.text = myTextField.text;
    [array addObject:myTextField.text];
    NSLog(@"%@", array);
    
    for (NSString * value in array) {
        NSLog(@" value = %@",value);
    }
    
}
@end
