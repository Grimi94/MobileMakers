//
//  UIColor+MColorExtended.m
//  NotificationsCategoriesColors
//
//  Created by Grimi on 7/31/13.
//  Copyright (c) 2013 MobileMakers. All rights reserved.
//

#import "UIColor+MColorExtended.h"

@implementation UIColor (MColorExtended)
+ (UIColor*)changeColor:(NSString *)colorName
{
    NSString *colorMethodName = [[colorName lowercaseString] stringByAppendingString:@"Color"];
    return  [UIColor performSelector:NSSelectorFromString(colorMethodName)];
}
@end
