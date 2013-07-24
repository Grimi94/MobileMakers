//
//  ViewController.m
//  Day4(properties)
//
//  Created by Grimi on 7/11/13.
//  Copyright (c) 2013 MobileMakers. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"

@interface ViewController ()
{
    __weak IBOutlet UILabel *nameLabel;
    __weak IBOutlet UILabel *nameLabelRight;
    
    __weak IBOutlet UILabel *nameLabelLeft;
    __weak IBOutlet UITextField *nameTextField;
    
    Person * firstPerson;
    Person * secondPerson;
    Person * thirdPerson;
}
- (IBAction)change:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    firstPerson = [[Person alloc] init];
    firstPerson.name = @"Hola";
    nameLabel.text = firstPerson.name;
    
    secondPerson = [[Person alloc] init];
    secondPerson.name = @"Perrito";
    nameLabelRight.text = secondPerson.name;
    
    
    thirdPerson = [[Person alloc] init];
    
    [thirdPerson setName:@"Boom"];
    [nameLabelLeft setText:[thirdPerson name]];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
}

- (IBAction)change:(UIButton*)sender {
    switch (sender.tag) {
        case 1:
            nameLabelLeft.text = nameTextField.text;
            break;
        case 2:
            nameLabel.text = nameTextField.text;
            break;
        case 3:
            nameLabelRight.text = nameTextField.text;
            break;
        default:
            break;
    }
}
@end
