//
//  ViewController.m
//  Day8(UItouching)
//
//  Created by Grimi on 7/18/13.
//  Copyright (c) 2013 MobileMakers. All rights reserved.
//

#import "ViewController.h"
#import "MyView.h"

@interface ViewController ()
{
    NSMutableArray * numbersForViews;
    NSMutableArray * views;
    MyView * viewOne;
    MyView * secondView;
    BOOL firstEntry;
    BOOL allowedToChoose;
    int index;
    int firstEntryTag;
    int numberOfMatches;
    int numberOfFails;

    
}
- (IBAction)resetGame:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    [self createAndShuffle];


}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

-(void) didChooseView:(MyView *)myView{
    if(!myView.faceUp){
        if(allowedToChoose){
            myView.backgroundColor = myView.hiddenColor;
            if(firstEntry){
                viewOne = myView;
                myView.faceUp = YES;
                firstEntryTag = myView.tag;
                firstEntry = NO;
            }
            else
            {
                secondView = myView;
                if(firstEntryTag == myView.tag)
                {
                    viewOne.hidden = YES;
                    secondView.hidden = YES;
                    numberOfMatches++;
                    if (numberOfMatches == 16)
                        [self createAndShuffle];
                }
                else
                {
                    allowedToChoose = NO;
                    [self performSelector:@selector(normalState) withObject:nil afterDelay:1];
                    
                    numberOfFails++;
                }
                firstEntry = YES;
            }
        }
    }
    NSLog(@"%i",myView.tag);
}


-(void) normalState{
    viewOne.faceUp = NO;
    viewOne.backgroundColor = [UIColor whiteColor];
    secondView.backgroundColor = [UIColor whiteColor];
    allowedToChoose = YES;
}


- (void)createAndShuffle
{
    allowedToChoose = YES;
    firstEntry = YES;
    numberOfMatches = 0;
    numberOfFails = 0;
    index = 0;
    numbersForViews = [[NSMutableArray alloc] initWithCapacity:16];
    
    for(int i=1;i<17;i++)
    {
        [numbersForViews addObject:[NSString stringWithFormat:@"%i",(int)((.25)*((2*i)-pow(-1,i)+1))]];
    }
    
    int count = [numbersForViews count];
    
    for (int i = 0; i < count; ++i)
    {
        int nElements = count - i;
        int n = arc4random_uniform(nElements) + i;
        [numbersForViews exchangeObjectAtIndex:i withObjectAtIndex:n];
    }
    
    for (UIView* subview in self.view.subviews)
    {
        if([subview isKindOfClass:[MyView class]])
        {
            ((MyView*)subview).delegate = self;
            ((MyView*)subview).tag = [[numbersForViews objectAtIndex:index] intValue];
            
            switch (((MyView*)subview).tag) {
                case 1:
                    ((MyView*)subview).faceUp = NO;
                    ((MyView*)subview).hidden = NO;
                    ((MyView*)subview).backgroundColor = [UIColor whiteColor];
                    ((MyView*)subview).hiddenColor = [UIColor redColor];
                    break;
                case 2:
                    ((MyView*)subview).faceUp = NO;
                    ((MyView*)subview).hidden = NO;
                    ((MyView*)subview).backgroundColor = [UIColor whiteColor];
                    ((MyView*)subview).hiddenColor = [UIColor blueColor];
                    break;
                case 3:
                    ((MyView*)subview).faceUp = NO;
                    ((MyView*)subview).hidden = NO;
                    ((MyView*)subview).backgroundColor = [UIColor whiteColor];
                    ((MyView*)subview).hiddenColor = [UIColor yellowColor];
                    break;
                case 4:
                    ((MyView*)subview).faceUp = NO;
                    ((MyView*)subview).hidden = NO;
                    ((MyView*)subview).backgroundColor = [UIColor whiteColor];
                    ((MyView*)subview).hiddenColor = [UIColor purpleColor];
                    break;
                case 5:
                    ((MyView*)subview).faceUp = NO;
                    ((MyView*)subview).hidden = NO;
                    ((MyView*)subview).backgroundColor = [UIColor whiteColor];
                    ((MyView*)subview).hiddenColor = [UIColor blackColor];
                    break;
                case 6:
                    ((MyView*)subview).faceUp = NO;
                    ((MyView*)subview).hidden = NO;
                    ((MyView*)subview).backgroundColor = [UIColor whiteColor];
                    ((MyView*)subview).hiddenColor = [UIColor greenColor];
                    break;
                case 7:
                    ((MyView*)subview).faceUp = NO;
                    ((MyView*)subview).hidden = NO;
                    ((MyView*)subview).backgroundColor = [UIColor whiteColor];
                    ((MyView*)subview).hiddenColor = [UIColor orangeColor];
                    break;
                case 8:
                    ((MyView*)subview).faceUp = NO;
                    ((MyView*)subview).hidden = NO;
                    ((MyView*)subview).backgroundColor = [UIColor whiteColor];
                    ((MyView*)subview).hiddenColor = [UIColor magentaColor];
                    break;
                default:
                    break;
            }
            index++;
        }
    }
}



- (IBAction)resetGame:(id)sender {
    [self createAndShuffle];
}
@end
