//
//  ViewController.h
//  TodoList
//
//  Created by Grimi on 7/17/13.
//  Copyright (c) 2013 MobileMakers. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ChangeDelegate.h"

@interface ViewController : UIViewController <UITableViewDataSource, UITableViewDelegate, ChangeDelegate,UITextFieldDelegate>

@end
