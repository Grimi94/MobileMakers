//
//  EditDelegate.h
//  MyFavoriteTableThings
//
//  Created by Grimi on 7/17/13.
//  Copyright (c) 2013 MobileMakers. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol EditDelegate <NSObject>

-(void) changeCellName:(NSString*)text;

@end
