//
//  SecondView.h
//  touchesEnd
//
//  Created by Grimi on 7/15/13.
//  Copyright (c) 2013 MobileMakers. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "touchDelegate.h"

@interface SecondView : UIView

@property (strong,nonatomic) id <touchDelegate> delegate;

@end
