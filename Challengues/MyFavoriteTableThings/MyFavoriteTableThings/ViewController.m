//
//  ViewController.m
//  MyFavoriteTableThings
//
//  Created by Grimi on 7/16/13.
//  Copyright (c) 2013 MobileMakers. All rights reserved.
//

#import "ViewController.h"
#import "EditViewController.h"


@interface ViewController ()
{
    __weak IBOutlet UITextField *textField;
    __weak IBOutlet UITableView *myTableView;
    NSMutableArray * favoriteThings;
    NSMutableArray * failThings;
    int index;
    int sectionSelected;
}
- (IBAction)addToTable:(UIButton*)sender;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    favoriteThings = [NSMutableArray arrayWithCapacity:10];
    failThings = [NSMutableArray arrayWithCapacity:10];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
    
    // Dispose of any resources that can be recreated.
}

- (IBAction)addToTable:(UIButton*)sender {
    //NSLog(@"%i",sender.tag);
    switch (sender.tag) {
        case 1:
            [favoriteThings addObject:textField.text];
            [myTableView reloadData];
            [textField resignFirstResponder];
            break;
        case 2:
            [failThings addObject:textField.text];
            [myTableView reloadData];
            [textField resignFirstResponder];
            break;
        case 3:
            NSLog(@"Perrito Feliz");
            
            break;
        default:
            break;
    }
    NSLog(@"%@",favoriteThings);
    
}

-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"things"];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"things"];
    }
    
    if (indexPath.section == 0) {
        cell.textLabel.text = [favoriteThings objectAtIndex:indexPath.row];
        NSLog(@"%i",indexPath.row);
    }
    else{
        cell.textLabel.text = [failThings objectAtIndex:indexPath.row];
        NSLog(@"%i",indexPath.row);
    }
    
    return cell;
}

-(int)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return [favoriteThings count];
    }
    else{
        return [failThings count];
    }

}


-(int)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}

-(NSString*) tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return @"Favorites";
    }
    else{
        return @"Fails";
    }
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    EditViewController * editController = [[EditViewController alloc] initWithNibName:nil bundle:nil];
    editController.inputValue = (indexPath.section == 0)? [favoriteThings objectAtIndex:indexPath.row]: [failThings objectAtIndex:indexPath.row];
    [self.navigationController pushViewController:editController animated:YES];
    editController.delegate = self;
    index = indexPath.row;
    sectionSelected = indexPath.section;
    
}

-(void)changeCellName:(NSString*)text{
    if (sectionSelected == 0)
        [favoriteThings  replaceObjectAtIndex:index withObject:text];
    else
        [failThings replaceObjectAtIndex:index withObject:text];
    [myTableView reloadData];
}

/*-(NSString*) tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section{
    if (section == 0) {
        return @"Favorites Footer";
    }
    else{
        return @"Fails Footer";
    }
}*/
@end
