//
//  EditViewController.h
//  MyFavoriteTableThings
//
//  Created by Grimi on 7/17/13.
//  Copyright (c) 2013 MobileMakers. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EditDelegate.h"

@interface EditViewController : UIViewController

@property (strong, nonatomic) NSString* inputValue;
@property (strong, nonatomic) id <EditDelegate> delegate;

@end
