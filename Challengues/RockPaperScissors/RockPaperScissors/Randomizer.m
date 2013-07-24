//
//  Randomizer.m
//  RockPaperScissors
//
//  Created by Grimi on 7/9/13.
//  Copyright (c) 2013 MobileMakers. All rights reserved.
//

#import "Randomizer.h"

@implementation Randomizer
-(NSString*)random{
    int number = rand() % 3;
    switch (number) {
        case 0:
            return @"rock";
            break;
        case 1:
            return @"paper";
            break;
        case 2:
           return @"scissors";
            break;
            
        default:
            break;
    }
}
@end
