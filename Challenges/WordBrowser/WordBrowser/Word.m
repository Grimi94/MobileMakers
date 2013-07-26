//
//  Word.m
//  WordBrowser
//
//  Created by Grimi on 7/24/13.
//  Copyright (c) 2013 MobileMakers. All rights reserved.
//

#import "Word.h"

@implementation Word

-(Word*)initwith:(NSString*)myName definition:(NSString*)myDefinition synonym1:(NSString*)mySynonym1 synonym2:(NSString*)mySynonym2
{
    Word * word = [[Word alloc] init];
    word.name = myName;
    word.definition = myDefinition;
    word.synonyms = [NSMutableArray arrayWithObjects:mySynonym1,mySynonym2, nil];
    
    return word;
}
@end
