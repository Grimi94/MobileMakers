//
//  DefinitionViewController.m
//  WordBrowser
//
//  Created by Grimi on 7/24/13.
//  Copyright (c) 2013 MobileMakers. All rights reserved.
//

#import "DefinitionViewController.h"

@interface DefinitionViewController ()
{

    
}

@end

@implementation DefinitionViewController
@synthesize selectedWord, definitionName, definitionTableView;

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
    definitionName.text = selectedWord.name;
    
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UIStoryboard * myStoryBoard = [UIStoryboard storyboardWithName:@"MainStoryboard" bundle:nil];
    DefinitionViewController * definitionViewController = [myStoryBoard instantiateViewControllerWithIdentifier:@"MV"];
    [self.navigationController pushViewController:definitionViewController animated:YES];
    definitionViewController.definitionName.text = [selectedWord.synonyms objectAtIndex:indexPath.row];
    NSLog(@"%@",[selectedWord.synonyms objectAtIndex:indexPath.row]);
    definitionViewController.definitionTableView.hidden = YES;
    

}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    self.view = segue.destinationViewController;

}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"things"];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"things"];
    }
    
    cell.textLabel.text = [selectedWord.synonyms objectAtIndex:indexPath.row];
    NSLog(@"%i",indexPath.row);
    
    return cell;
}

-(int)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [selectedWord.synonyms count];
}

-(NSString*)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return @"Words in my Dictionary";
}

-(int)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

@end
