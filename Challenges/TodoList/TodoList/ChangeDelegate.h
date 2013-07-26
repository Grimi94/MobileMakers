//
//  ChangeDelegate.h
//  TodoList
//
//  Created by Grimi on 7/17/13.
//  Copyright (c) 2013 MobileMakers. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ChangeDelegate <NSObject>

-(void) changeCellName:(NSString*)text;

@end
