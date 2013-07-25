//
//  ViewController.m
//  Wikipedia
//
//  Created by Grimi on 7/25/13.
//  Copyright (c) 2013 MobileMakers. All rights reserved.
//

#import "ViewController.h"
#import "WebViewController.h"

@interface ViewController ()
{

    __weak IBOutlet UISearchBar *searchBox;
    __weak IBOutlet UITableView *tableOutlet;
    NSDictionary * searchDictionary;
    NSDictionary * queryDictionary;
    NSArray * searchArray;
    int index;
    
}

@end

@implementation ViewController

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

-(int)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    queryDictionary= [searchDictionary objectForKey:@"query"];
    searchArray = [queryDictionary objectForKey:@"search"];
    return [searchArray count];
}

-(int)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"Hero"];
    
    NSLog(@"%@",queryDictionary);
    if(cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"Hero"];
    }
    
    cell.textLabel.text = [((NSDictionary*)[searchArray objectAtIndex:indexPath.row]) objectForKey:@"title"];
    
    return cell;

}

-(void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    [searchBox resignFirstResponder];
    NSURL * url = [NSURL URLWithString: [[NSString stringWithFormat:@"https://en.wikipedia.org/w/api.php? action=query&list=search&srsearch=%@&srprop=snippet&format=json",searchBox.text]stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    NSURLRequest * request = [NSURLRequest requestWithURL:url];
    
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse * response, NSData * data, NSError * error) {
        
        searchDictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
        //NSLog(@"Dictionary %@",searchDictionary);
        [tableOutlet reloadData];
    }];
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    index = indexPath.row;
    [self performSegueWithIdentifier:@"toWeb" sender:self];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    WebViewController * webViewController = segue.destinationViewController;
    NSLog(@"%@",[((NSDictionary*)[searchArray objectAtIndex:index]) objectForKey:@"snippet"]);
    webViewController.snippetString = [((NSDictionary*)[searchArray objectAtIndex:index]) objectForKey:@"snippet"];
}

@end
