//
//  ViewController.m
//  Day11(DictionaryFun)
//
//  Created by Grimi on 7/24/13.
//  Copyright (c) 2013 MobileMakers. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"

@interface ViewController ()
{
    NSMutableDictionary * coolDictionary;
    NSMutableArray * people;
    Person * personOne;
    Person * personTwo;
    Person * personThree;
}

@end

@implementation ViewController

- (void)viewDidLoad
{
    coolDictionary = [NSMutableDictionary dictionaryWithCapacity:10];
    people = [NSMutableArray arrayWithCapacity:2];
    personOne = [[Person alloc] init];
    personTwo = [[Person alloc] init];
    personThree = [[Person alloc] init];
    
    personOne.firstName = @"Don";
    personOne.lastName = @"Popo";
    personTwo.lastName = @"Andres";
    personTwo.lastName = @"Benger";
    personThree.lastName = @"Eddie";
    personThree.lastName = @"Benger";
    
    [people addObject:personTwo];
    [people addObject:personThree];
    
    [coolDictionary setObject:personOne forKey:@"B"];
    [coolDictionary setObject:people forKey:@"A"];
    
    [super viewDidLoad];
    
    [self describeDictionary:coolDictionary];

}

-(void)describeDictionary:(NSMutableDictionary*)dictionary
{
    NSLog(@"Keys: %@",[dictionary allKeys]);
    NSLog(@"Values:%@",[dictionary allValues]);
    
    [coolDictionary enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        if ([obj isKindOfClass:[Person class]]) {
            NSLog(@"NAme: %@ %@",((Person*)obj).firstName,((Person*)obj).firstName);
        }
    }];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
