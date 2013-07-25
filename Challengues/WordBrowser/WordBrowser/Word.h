//
//  Word.h
//  WordBrowser
//
//  Created by Grimi on 7/24/13.
//  Copyright (c) 2013 MobileMakers. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Word : NSObject
@property (strong,nonatomic) NSString * name;
@property (strong,nonatomic) NSString * definition;
@property (strong,nonatomic) NSMutableArray * synonyms;

-(Word*)initwith:(NSString*)myName definition:(NSString*)myDefinition synonym1:(NSString*)mySynonym1 synonym2:(NSString*)mySynonym2;

@end
