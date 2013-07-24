//
//  ViewController.m
//  Day(8)NoArcMemoryTest
//
//  Created by Grimi on 7/18/13.
//  Copyright (c) 2013 MobileMakers. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    NSMutableArray * myArray;
    NSObject * myObject;
}

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    myObject = [[NSObject init] alloc];
    myArray = [NSMutableArray arrayWithCapacity:5];
    NSLog(@"ReferenceCounting = %i",[myObject retainCount]);
    [myObject retain];
    NSLog(@"ReferenceCounting = %i",[myObject retainCount]);
    [myArray addObject:myObject];
    
    NSLog(@"ReferenceCounting = %i",[myObject retainCount]);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
