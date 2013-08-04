//
//  ViewController.m
//  NotificationsCategoriesColors
//
//  Created by Grimi on 7/31/13.
//  Copyright (c) 2013 MobileMakers. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    __weak IBOutlet UITextField *textField;
}

- (IBAction)go:(id)sender;

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

- (IBAction)go:(id)sender {
    NSNotificationCenter * notificationCenter = [NSNotificationCenter defaultCenter];
    [notificationCenter postNotificationName:@"TouchNotification" object:nil userInfo:[NSDictionary dictionaryWithObject:textField.text forKey:@"color"]];
    [self.view endEditing:YES];
    //[notificationCenter postNotificationName:@"TouchNotification" object:textField.text];
}
@end
