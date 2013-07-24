//
//  Person.h
//  Day4(properties)
//
//  Created by Grimi on 7/11/13.
//  Copyright (c) 2013 MobileMakers. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject
//{
    // NSString * name;     -----Created within property
//}
@property (strong,nonatomic)NSString * name;
// -(void) setName:(NSString *)name;    -----Created within property
// -(NSString*)name;     -----Created within property
@end
