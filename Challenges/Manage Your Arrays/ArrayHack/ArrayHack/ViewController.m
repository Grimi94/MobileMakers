//
//  ViewController.m
//  ArrayHack
//
//  Created by Don Bora on 2/3/13.
//  Copyright (c) 2013 Don Bora. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    IBOutlet UILabel *arrayLabel;
    int numberArray[10];
    int numberOfElements;
}
- (IBAction)addElement:(id)sender;
- (IBAction)removeElement:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad
{
    int i;
    [super viewDidLoad];

    for (i = 0; i <= 9; i++) {
        numberArray[i] = i + 1;
    }
    
    numberOfElements = i;
    [self displayArray];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)dealloc {
    [arrayLabel release];
    [super dealloc];
}


- (IBAction)addElement:(id)sender {
    numberOfElements++;
    // Put your code to add the element here;
    [self displayArray];
}

- (IBAction)removeElement:(id)sender {
    numberOfElements--;
    // Put your code to remove the element here;
    [self displayArray];
}


-(void)displayArray
{
    NSString* displayString = nil;
    
    for (int i = 0; i < numberOfElements; i++) {
        
        if (displayString == nil) {
            displayString = [NSString stringWithFormat:@"%i", numberArray[i]];
        }
        else{
            displayString = [NSString stringWithFormat:@"%@, %i", displayString, numberArray[i]];
        }
    }
    
    arrayLabel.text = displayString;
}
@end
