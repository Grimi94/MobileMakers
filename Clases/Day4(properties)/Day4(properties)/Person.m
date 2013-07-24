//
//  Person.m
//  Day4(properties)
//
//  Created by Grimi on 7/11/13.
//  Copyright (c) 2013 MobileMakers. All rights reserved.
//

#import "Person.h"

@implementation Person

@synthesize name;

-(void) setName:(NSString *)_name{
    name = [NSString stringWithFormat:@"%@!!!",_name];
}
@end
