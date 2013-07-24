//
//  ViewController.m
//  Day10(BlockCalculator)
//
//  Created by Grimi on 7/23/13.
//  Copyright (c) 2013 MobileMakers. All rights reserved.
//

#import "ViewController.h"
//typedef NSInteger (^mathBlock) (NSInteger,NSInteger);
//mathBlock add = ^(NSInteger value1, NSInteger value2) { return value1+value2;};
//mathBlock multiply =  ^(NSInteger value1, NSInteger value2) { return value1*value2;};
/*NSInteger add(int value1,int value2){
    return value1+value2;
}*/

@interface ViewController ()
{
    __weak IBOutlet UITextField *textfield1;
    __weak IBOutlet UITextField *textfield2;
    __weak IBOutlet UILabel *resultLabel;
}
- (IBAction)calculate:(UIButton*)sender;
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

//-(NSInteger) calculateNumber:(NSInteger) int1 toNumber:(NSInteger) int2 usingBlock:(mathType)blockType{ return blockType(int1,int2);
-(NSInteger) calculateNumber:(NSInteger) int1 toNumber:(NSInteger) int2 usingBlock:(NSInteger (^) (NSInteger,NSInteger))blockType{
    return blockType(int1,int2);
}

- (IBAction)calculate:(UIButton*)sender {
    //mathBlock block = (sender.tag == 1)? add : multiply;
    
    //NSInteger newNumber = [self calculateNumber:textfield1.text.intValue toNumber:textfield2.text.intValue usingBlock:(sender.tag == 1)? add : multiply];
    //NSInteger newNumber = add(textfield1.text.intValue, textfield2.text.intValue);
    NSInteger newNumber;
    switch (sender.tag) {
        case 1:
            newNumber = [self calculateNumber:textfield1.text.intValue toNumber:textfield2.text.intValue usingBlock:^NSInteger (NSInteger int1,NSInteger int2){return int1+int2;}];
            break;
        case 2:
            newNumber = [self calculateNumber:textfield1.text.intValue toNumber:textfield2.text.intValue usingBlock:^NSInteger (NSInteger int1,NSInteger int2){return int1-int2;}];

            break;
        case 3:
            newNumber = [self calculateNumber:textfield1.text.intValue toNumber:textfield2.text.intValue usingBlock:^NSInteger (NSInteger int1,NSInteger int2){return (int1*int2);}];
            break;
        case 4:
            newNumber = [self calculateNumber:textfield1.text.intValue toNumber:textfield2.text.intValue usingBlock:^NSInteger (NSInteger int1,NSInteger int2){return (int1/int2);}];
            break;
    } 
    
    
    
    
    resultLabel.text = [NSString stringWithFormat:@"%i",newNumber];
}
@end
