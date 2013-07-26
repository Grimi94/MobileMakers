//
//  Person.h
//  AddressBook
//
//  Created by Grimi on 7/22/13.
//  Copyright (c) 2013 MobileMakers. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject
@property (strong, nonatomic) NSString * firstName;
@property (strong, nonatomic) NSString * lastName;
@property (strong, nonatomic) NSString * emailAddress;
@property (strong, nonatomic) NSString * phoneNumber;
@end
