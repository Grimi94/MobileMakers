//
//  SecondViewController.h
//  Day4(Delegation)
//
//  Created by Grimi on 7/15/13.
//  Copyright (c) 2013 MobileMakers. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "colorDelegate.h"

@interface SecondViewController : UIViewController

@property (strong, nonatomic) id <colorDelegate> delegate;

@end
