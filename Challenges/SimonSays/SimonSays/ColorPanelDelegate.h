//
//  ColorPanelDelegate.h
//  SimonSays
//
//  Created by Grimi on 8/3/13.
//  Copyright (c) 2013 MobileMakers. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ColorPanelDelegate <NSObject>

-(void) returnTagAndSaveTouch:(int)tag;

@end
