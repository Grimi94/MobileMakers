//
//  EditViewController.h
//  TodoList
//
//  Created by Grimi on 7/17/13.
//  Copyright (c) 2013 MobileMakers. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ChangeDelegate.h"

@interface EditViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *titleField;

@property (weak, nonatomic) IBOutlet UITextField *descriptionField;
@property (strong,nonatomic) id <ChangeDelegate> delegate;

@end
