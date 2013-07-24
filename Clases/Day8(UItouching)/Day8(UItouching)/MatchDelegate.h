//
//  MatchDelegate.h
//  Day8(UItouching)
//
//  Created by Grimi on 7/18/13.
//  Copyright (c) 2013 MobileMakers. All rights reserved.
//

#import <Foundation/Foundation.h>

@class MyView;
@protocol MatchDelegate <NSObject>

-(void) didChooseView:(MyView*)myView;

@end
