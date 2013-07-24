//
//  EditViewController.m
//  MyFavoriteTableThings
//
//  Created by Grimi on 7/17/13.
//  Copyright (c) 2013 MobileMakers. All rights reserved.
//

#import "EditViewController.h"
#import "EditDelegate.h"

@interface EditViewController ()
{
    __weak IBOutlet UITextField *editTextField;
}
- (IBAction)saveChanges:(id)sender;

@end

@implementation EditViewController
@synthesize inputValue;
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
    editTextField.text = inputValue;
    
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)saveChanges:(id)sender {
    [delegate changeCellName:editTextField.text];
    [self.navigationController popViewControllerAnimated:YES];
}
@end
