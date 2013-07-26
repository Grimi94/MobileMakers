//
//  Judge.m
//  RockPaperScissors
//
//  Created by Grimi on 7/9/13.
//  Copyright (c) 2013 MobileMakers. All rights reserved.
//

#import "Judge.h"

@implementation Judge
-(BOOL) didComputerWin:(NSString *)computerPick humanString:(NSString *)humanPick{
    if ([computerPick isEqualToString:@"rock"]) {
        if ([humanPick isEqualToString:@"paper"]) {
            return NO;
        }
        if ([humanPick isEqualToString:@"scissors"]) {
            return YES;
        }
    }else if ([computerPick isEqualToString:@"paper"]) {
        if ([humanPick isEqualToString:@"rock"]) {
            return YES;
        }
        if ([humanPick isEqualToString:@"scissors"]) {
            return NO;
        }
    }
    else if([computerPick isEqualToString:@"scissors"]){
        if ([humanPick isEqualToString:@"rock"]){
                return NO;
        }
        if ([humanPick isEqualToString:@"paper"]){
                return YES;
        }
        }
    
}
@end
