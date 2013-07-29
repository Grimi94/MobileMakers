//
//  UserViewController.m
//  App.net
//
//  Created by Grimi on 7/27/13.
//  Copyright (c) 2013 MobileMakers. All rights reserved.
//

#import "UserViewController.h"

@interface UserViewController ()
{
    NSMutableArray * tableArray;
}

@end

@implementation UserViewController

@synthesize selectedUser,imageURL,userTableView,numericalID;

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
    NSURL * url = [NSURL URLWithString: [NSString stringWithFormat:@"https://alpha-api.app.net/stream/0/users/%@/posts",numericalID]];
    NSURLRequest * request = [NSURLRequest requestWithURL:url];
    
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse * response, NSData * data, NSError * error) {
        NSMutableDictionary * incommingDictionary;
        incommingDictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
        tableArray  = [NSMutableArray arrayWithArray:[incommingDictionary objectForKey:@"data"]];
        
        //NSLog(@"Dictionary %@",searchDictionary);
        [userTableView reloadData];
    }];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

-(int)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [tableArray count];
}

-(int)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"Hero"];
    
    NSLog(@"%@",tableArray);
    if(cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"Hero"];
    }
    
    cell.textLabel.text = [[tableArray objectAtIndex:indexPath.row] objectForKey:@"text"];
    
    return cell;
    
}


@end
