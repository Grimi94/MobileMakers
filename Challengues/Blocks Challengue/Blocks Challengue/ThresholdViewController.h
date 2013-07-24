//
//  ThresholdViewController.h
//  Blocks Challengue
//
//  Created by Grimi on 7/23/13.
//  Copyright (c) 2013 MobileMakers. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ThresholdDelegate.h"

@interface ThresholdViewController : UIViewController
@property (strong,nonatomic) id <ThresholdDelegate> delegate;
@end
