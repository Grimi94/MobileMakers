//
//  colorDelegate.h
//  Day4(Delegation)
//
//  Created by Grimi on 7/15/13.
//  Copyright (c) 2013 MobileMakers. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol colorDelegate <NSObject>

-(void) changeColor:(UIColor*) color;
-(void) changeText:(NSString*) text;

@end
