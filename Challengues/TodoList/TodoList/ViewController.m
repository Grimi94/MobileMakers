//
//  ViewController.m
//  TodoList
//
//  Created by Grimi on 7/17/13.
//  Copyright (c) 2013 MobileMakers. All rights reserved.
//

#import "ViewController.h"
#import "EditViewController.h"

@interface ViewController ()
{
    
    __weak IBOutlet UISegmentedControl *selectSection;
    __weak IBOutlet UITableView *myTableView;
    __weak IBOutlet UITextField *inputTextField;
    NSMutableArray * toDoArray;
    NSMutableArray * doneArray;
    int index;
    int sectionSelected;

}
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    toDoArray = [NSMutableArray arrayWithCapacity:10];
    doneArray = [NSMutableArray arrayWithCapacity:10];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    if (selectSection.selectedSegmentIndex==0) {
        [toDoArray addObject:inputTextField.text];
        NSLog(@"%@",inputTextField.text);
        NSLog(@"%@",toDoArray);
        [myTableView reloadData];
    }
    else{
        [doneArray addObject:inputTextField.text];
        [myTableView reloadData];
    }
    [inputTextField resignFirstResponder];
    return YES;
}

-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"things"];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"things"];
    }
    
    if (indexPath.section == 0) {
        cell.textLabel.text = [toDoArray objectAtIndex:indexPath.row];
        NSLog(@"%i",indexPath.row);
    }
    else{
        cell.textLabel.text = [doneArray objectAtIndex:indexPath.row];
        NSLog(@"%i",indexPath.row);
    }
    
    return cell;
}

-(int)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return [toDoArray count];
    }
    else{
        return [doneArray count];
    }
    
}


-(int)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}

-(NSString*) tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return @"To Do";
    }
    else{
        return @"Done";
    }
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    EditViewController * editController = [[EditViewController alloc] initWithNibName:nil bundle:nil];
    editController.titleField.text = (indexPath.section == 0)? [toDoArray objectAtIndex:indexPath.row]: [doneArray objectAtIndex:indexPath.row];
    [self.navigationController pushViewController:editController animated:YES];
    editController.delegate = self;
    index = indexPath.row;
    sectionSelected = indexPath.section;
    
}

-(void)changeCellName:(NSString*)text{
    if (sectionSelected == 0)
        [toDoArray  replaceObjectAtIndex:index withObject:text];
    else
        [doneArray replaceObjectAtIndex:index withObject:text];
    [myTableView reloadData];
}


@end
