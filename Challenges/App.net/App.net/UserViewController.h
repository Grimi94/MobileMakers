//
//  UserViewController.h
//  App.net
//
//  Created by Grimi on 7/27/13.
//  Copyright (c) 2013 MobileMakers. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UserViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) NSString * selectedUser;
@property (strong, nonatomic) NSString * imageURL;
@property (strong, nonatomic) NSMutableDictionary * userStats;
@property id numericalID;
@property (weak, nonatomic) IBOutlet UITableView *userTableView;

@end
