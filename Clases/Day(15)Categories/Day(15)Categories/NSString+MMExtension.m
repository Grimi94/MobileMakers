//
//  NSString+MMExtension.m
//  Day(15)Categories
//
//  Created by Grimi on 7/31/13.
//  Copyright (c) 2013 MobileMakers. All rights reserved.
//

#import "NSString+MMExtension.h"

@implementation NSString (MMExtension)
-(NSString*) mmReverseString
{
    NSString * returnString = @"";
    for (int index = 0; index < self.length/2; index++) {
        returnString = [NSString stringWithFormat:@"%c%@", [self characterAtIndex:index],returnString ];
    }
    return self;
}
@end
