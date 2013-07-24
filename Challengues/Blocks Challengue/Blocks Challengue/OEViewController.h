//
//  OEViewController.h
//  Blocks Challengue
//
//  Created by Grimi on 7/23/13.
//  Copyright (c) 2013 MobileMakers. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OEViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>
@property (strong,nonatomic) NSMutableArray * outsourceArray;
@property (strong,nonatomic) NSString * identifierView;
@end
