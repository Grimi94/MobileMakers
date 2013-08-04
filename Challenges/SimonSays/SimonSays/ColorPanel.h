//
//  ColorPanel.h
//  SimonSays
//
//  Created by Grimi on 8/1/13.
//  Copyright (c) 2013 MobileMakers. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "ColorPanelDelegate.h"

@interface ColorPanel : UIView 

@property (strong,nonatomic) id <ColorPanelDelegate> delegate;

-(void)highlight;

@end
