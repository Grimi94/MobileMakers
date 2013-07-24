//
//  OEViewController.m
//  Blocks Challengue
//
//  Created by Grimi on 7/23/13.
//  Copyright (c) 2013 MobileMakers. All rights reserved.
//

#import "OEViewController.h"

@interface OEViewController ()
{
    NSMutableArray * filteredArray;
}
@end

@implementation OEViewController
@synthesize outsourceArray;
@synthesize identifierView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    filteredArray = [NSMutableArray arrayWithCapacity:30];
    [filteredArray removeAllObjects];
    [outsourceArray enumerateObjectsUsingBlock:^(NSString* obj, NSUInteger idx, BOOL *stop) {
        
    }];
    [outsourceArray enumerateObjectsUsingBlock:^(NSString *obj, NSUInteger index, BOOL *stop){
        if([identifierView isEqualToString:@"toOdds"])
        {
            if ([obj intValue]%2 != 0)
                [filteredArray addObject:obj];
        }
        else if([identifierView isEqualToString:@"toEvens"])
        {
            if ([obj intValue]%2 == 0)
                [filteredArray addObject:obj];
        }
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"things"];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"things"];
    }
    
    if (indexPath.section == 0) 
        cell.textLabel.text = [filteredArray objectAtIndex:indexPath.row];
    
    return cell;

}

-(NSString*)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if([identifierView isEqualToString:@"toOdds"])
        return @"Odd Numbers";
    else 
        return @"Even Numbers";
}

-(int)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [filteredArray count];
}

-(int)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

@end
