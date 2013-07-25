//
//  ViewController.m
//  WordBrowser
//
//  Created by Grimi on 7/24/13.
//  Copyright (c) 2013 MobileMakers. All rights reserved.
//

#import "ViewController.h"
#import "Word.h"
#import "DefinitionViewController.h"

@interface ViewController ()
{
    NSMutableDictionary * dictionaryOfWords;
    int selectedIndex ;
}
@end

@implementation ViewController

-(id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:(NSCoder *)aDecoder];
    if(self)
    {
        dictionaryOfWords = [NSMutableDictionary dictionaryWithCapacity:20];
        for (int i=0; i<21; i++) {
            Word * word = [[Word alloc] initwith:[NSString stringWithFormat:@"word%i",i] definition:[NSString stringWithFormat:@"Definition of word%i",i] synonym1:[NSString stringWithFormat:@"Synonym1 of Word%i",i] synonym2:[NSString stringWithFormat:@"Synonim2 of Word%i",i]];
            
            [dictionaryOfWords setObject:word forKey:word.name];
        }
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark UITableView
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    selectedIndex = indexPath.row;
    [self performSegueWithIdentifier:@"toDefinition" sender:self];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSArray * tempArray = [NSArray arrayWithArray:[dictionaryOfWords allKeys]];
    DefinitionViewController * definitionViewController = segue.destinationViewController;
    definitionViewController.selectedWord = [dictionaryOfWords objectForKey:[tempArray objectAtIndex:selectedIndex]];
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"things"];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"things"];
    }
    NSArray * tempArray = [NSArray arrayWithArray:[dictionaryOfWords allKeys]];
    
        cell.textLabel.text = ((Word*)[dictionaryOfWords objectForKey:[tempArray objectAtIndex:indexPath.row]]).name;
        NSLog(@"%i",indexPath.row);
    
    return cell;
}

-(int)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [dictionaryOfWords count];
}

-(int)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
@end
