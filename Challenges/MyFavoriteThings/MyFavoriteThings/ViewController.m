//
//  ViewController.m
//  MyFavoriteThings
//
//  Created by Grimi on 7/16/13.
//  Copyright (c) 2013 MobileMakers. All rights reserved.
//

#import "ViewController.h"

@interface ViewController (){
    
    __weak IBOutlet UITextField *textInput;
    __weak IBOutlet UITextView *textField;
    NSString * text;
    NSCharacterSet *trim;
    NSMutableArray * favoriteThings;
}
- (IBAction)executeAction:(UIButton*)sender;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    favoriteThings = [NSMutableArray arrayWithCapacity:10];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (IBAction)executeAction:(UIButton*)sender {
    switch (sender.tag) {
        case 1:
            if (textInput.text) {
                [favoriteThings addObject:[NSString stringWithFormat:@"%i.- %@",favoriteThings.count+1,textInput.text]];
                [self updateTextField];
            }
            break;
        case 2:
            [favoriteThings removeLastObject];
            [self updateTextField];
            
            break;
        case 3:
            favoriteThings = [NSArray arrayWithArray:[[favoriteThings reverseObjectEnumerator] allObjects]];
            [self updateTextField];
            break;
        default:
            break;
    }
    
}

-(void)updateTextField{
    text = [NSString stringWithFormat:@"%@",favoriteThings];
    trim = [NSCharacterSet characterSetWithCharactersInString:@"(,)\""];
    text = [[text componentsSeparatedByCharactersInSet: trim] componentsJoinedByString: @""];
    textField.text = text;
}
@end
