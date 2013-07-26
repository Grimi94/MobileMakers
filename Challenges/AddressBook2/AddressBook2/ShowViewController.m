//
//  ShowViewController.m
//  AddressBook2
//
//  Created by Grimi on 7/22/13.
//  Copyright (c) 2013 MobileMakers. All rights reserved.
//

#import "ShowViewController.h"

@interface ShowViewController ()
{
    __weak IBOutlet UILabel *tittleView;
    __weak IBOutlet UILabel *nameView;
    __weak IBOutlet UITextField *emailField;
    __weak IBOutlet UITextField *numberField;
}
@end

@implementation ShowViewController
@synthesize recievedPerson;

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
    tittleView.text = [NSString stringWithFormat:@"%@ %@",recievedPerson.firstName, recievedPerson.lastName];
    nameView.text = [NSString stringWithFormat:@"%@ %@",recievedPerson.firstName, recievedPerson.lastName];
    emailField.text = recievedPerson.emailAddress;
    numberField.text = recievedPerson.phoneNumber;

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
