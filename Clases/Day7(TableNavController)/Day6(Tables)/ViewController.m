//
//  ViewController.m
//  Day6(Tables)
//
//  Created by Grimi on 7/16/13.
//  Copyright (c) 2013 MobileMakers. All rights reserved.
//

#import "ViewController.h"
#import "EditViewController.h"


@interface ViewController (){
    NSMutableArray * array;
    __weak IBOutlet UITextField *textField;
    __weak IBOutlet UITableView *myTableView;
    int index;
}
- (IBAction)addElement:(id)sender;

@end

@implementation ViewController
- (void)viewDidLoad
{
    [super viewDidLoad];
    array = [NSMutableArray arrayWithCapacity:10];
    
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)addElement:(id)sender {
    [array addObject:textField.text];
    [myTableView reloadData];
    [textField resignFirstResponder];
}

#pragma mark UITableViewDataSource

-(int) numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"my identifier"];
    if(cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"my identifier"];
    }
    cell.textLabel.text = [array objectAtIndex:indexPath.row];
    return cell;
}

-(int) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [array count];
}

-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    EditViewController * editViewController = [[EditViewController alloc] initWithNibName:nil bundle:nil];
    editViewController.textField = [array objectAtIndex:indexPath.row];
    
    [self.navigationController pushViewController:editViewController animated:YES];
    
    editViewController.delegate = self;
    
    index = indexPath.row;
    
}

-(void)executeLabelChange:(NSString*)text{
    [array replaceObjectAtIndex:index withObject:text];
    [myTableView reloadData];
}

@end
