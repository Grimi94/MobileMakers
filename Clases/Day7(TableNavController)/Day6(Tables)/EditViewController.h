//
//  EditViewController.h
//  Day6(Tables)
//
//  Created by Grimi on 7/17/13.
//  Copyright (c) 2013 MobileMakers. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ChangeLabel.h"

@interface EditViewController : UIViewController

@property (strong, nonatomic) NSString * textField;
@property (strong, nonatomic) id <ChangeLabel> delegate;

@end
