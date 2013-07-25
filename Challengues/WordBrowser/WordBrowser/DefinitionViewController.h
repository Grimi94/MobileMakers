//
//  DefinitionViewController.h
//  WordBrowser
//
//  Created by Grimi on 7/24/13.
//  Copyright (c) 2013 MobileMakers. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Word.h"

@interface DefinitionViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) Word * selectedWord;
@property (weak, nonatomic) IBOutlet UILabel *definitionName;
@property (weak, nonatomic) IBOutlet UITableView *definitionTableView;


@end
