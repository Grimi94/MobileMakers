//
//  CustomCell.h
//  App.net
//
//  Created by Grimi on 7/28/13.
//  Copyright (c) 2013 MobileMakers. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *cellImage;
@property (weak, nonatomic) IBOutlet UILabel *cellUserName;
@property (weak, nonatomic) IBOutlet UITextView *cellText;



@end
