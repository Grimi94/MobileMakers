//
//  ViewController.m
//  Blocks Challengue
//
//  Created by Grimi on 7/23/13.
//  Copyright (c) 2013 MobileMakers. All rights reserved.
//

#import "ViewController.h"
#import "ThresholdViewController.h"

@interface ViewController ()
{
    NSMutableArray * arrayOfNumbers;
    NSMutableArray * thresholdedArray;
    int thresholdValue;
    __weak IBOutlet UITableView *tableOfNumbers;
}
- (IBAction)filterNumbers:(id)sender;

@end

@implementation ViewController

-(id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:(NSCoder*)aDecoder];
    if (self) {
        thresholdedArray = [NSMutableArray arrayWithCapacity:30];
        arrayOfNumbers = [NSMutableArray arrayWithCapacity:50];
        for (int i = 0; i < 50; i++) {
            [arrayOfNumbers addObject:[NSString stringWithFormat:@"%i",rand()%100]];
        }
    }
    return self;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}



-(void)filterArray:(int)value
{
    for(NSString * content in arrayOfNumbers)
    {
        if([content intValue]<value)
        {
            [thresholdedArray addObject:content];
        }
    }
    NSLog(@"%i",thresholdedArray.count);
    thresholdValue = value;
    NSLog(@"Filtering Working");
    [tableOfNumbers reloadData];
}

#pragma mark TableView Code 

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"things"];
    
    if (cell == nil)
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"things"];

    if (indexPath.section == 0)
        cell.textLabel.text = (!thresholdValue)? [arrayOfNumbers objectAtIndex:indexPath.row]:[thresholdedArray objectAtIndex:indexPath.row];
    
    return cell;
}

-(int)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return (!thresholdValue)? [arrayOfNumbers count]:[thresholdedArray count];
}

-(int)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSString*) tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return @"50 Numbers";
}


#pragma Button Actions

- (IBAction)filterNumbers:(UIButton*)sender {
    switch (sender.tag) {
        case 1:
            [self performSegueWithIdentifier:@"toOdds" sender:arrayOfNumbers];
            break;
        case 2:
            [self performSegueWithIdentifier:@"toEvens" sender:arrayOfNumbers];
            break;
        case 3:
            [self performSegueWithIdentifier:@"toThreshold" sender:@"threshold"];
            break;
        case 4:
            [arrayOfNumbers removeAllObjects];
            for (int i = 0; i < 50; i++) {
                [arrayOfNumbers addObject:[NSString stringWithFormat:@"%i",rand()%100]];
            }
            [tableOfNumbers reloadData];
            break;
        default:
            NSLog(@"There is an error dude!");
            break;
    }
}

#pragma mark Prepare for Segue

-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([segue.identifier isEqual: @"toOdds"] || [segue.identifier isEqual:@"toEvens"])
    {
        NSLog(@"This goes to odds or evens");
        OEViewController * oeViewController = segue.destinationViewController;
        oeViewController.outsourceArray = arrayOfNumbers;
        oeViewController.identifierView = segue.identifier;
    }
    else if ([segue.identifier isEqual:@"toThreshold"]){
        ThresholdViewController * thresholdViewController;
        thresholdViewController = segue.destinationViewController;
        thresholdViewController.delegate= self;
    }
}
@end
