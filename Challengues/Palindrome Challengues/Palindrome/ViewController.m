//
//  ViewController.m
//  Palindrome
//
//  Created by Don Bora on 4/28/13.
//  Copyright (c) 2013 MobileMakers. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    __weak IBOutlet UITextField *inputTextField;
    __weak IBOutlet UILabel *resultLabel;
    
    int result;
}
- (IBAction)check:(id)sender;

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

-(void)showIsNotPalindrone
{
    resultLabel.text = @"Not a palindrone!";
}

-(void)showIsPalindrone
{
    resultLabel.text = @"IS a palindrone!";
}


-(const char*)getCharacterArray
{
    return [inputTextField.text UTF8String];
}


-(void)showResult
{
    resultLabel.text = [NSString stringWithFormat:@"%i", result];
}


-(void)checkForPalindrome
{
    
    const char* arrayOfCharacters = [self getCharacterArray];
    
    BOOL isPalindrome = YES;
    int number = 0;
    int iterator = 0;
    
    while (arrayOfCharacters[number]) {
        number++;
    }
    while (number-1 > iterator) {
        if (arrayOfCharacters[number-1] != arrayOfCharacters[iterator]){
                isPalindrome = NO;
        }
        ++iterator;
        --number;
    }

    
    if (isPalindrome) {
        [self showIsPalindrone];
    }
    else{
        [self showIsNotPalindrone];
    }    
}   


-(void)sumIntegers
{
    const char * arrayOfCharacters = [self getCharacterArray];
    int index = 0;
    result = 0;
    const char * arrayOfPositions[100]
    while (arrayOfCharacters[index]) {
        if (arrayOfCharacters[index]!= ',') {
            result = result + atoi(&arrayOfCharacters[index]);
        }
        index++;
    }
    
    NSLog(@"%i",result);
    // parse out the commas, sum up the integers and assign the answer to the variable result
    // i.e.
    // result =
    
    [self showResult];
}

- (IBAction)check:(id)sender
{
    //[self checkForPalindrome];
    
    // Uncomment the following line of code and comment out the previous line of code to run summation
    [self sumIntegers];
}
@end
