//
//  ViewController.m
//  Day12(API's)
//
//  Created by Grimi on 7/25/13.
//  Copyright (c) 2013 MobileMakers. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    NSArray * superHeroArray;
    __weak IBOutlet UITableView *tableOutlet;
}

@end

@implementation ViewController

- (void)viewDidLoad
{
    NSURL * url = [NSURL URLWithString:@"http://www.mobilemakers.co/lib/superheroes.json"];
    NSURLRequest * request = [NSURLRequest requestWithURL:url];
    //NSURLResponse * response;
    //NSError * error;
    //NSData * data = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    //NSString *responseString = [[NSString alloc] initWithBytes:[data bytes] length:[data length] encoding:NSUTF8StringEncoding];
    //NSLog(@"%@",response);
    [super viewDidLoad];
    
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse * response, NSData * data, NSError * error) {
       // NSString * responseString;
       // responseString = [[NSString alloc] initWithBytes:[data bytes] length:[data length] encoding:NSUTF8StringEncoding];
        
        superHeroArray = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
        [tableOutlet reloadData];
    }];
    
    
    //textFieldOut.text = responseString;
}

-(int)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(int)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [superHeroArray count];
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"Hero"];
    NSDictionary * superHeroDictionary = (NSDictionary*) [superHeroArray objectAtIndex:indexPath.row];
    UIImage * image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:[superHeroDictionary objectForKey:@"avatar_url"]]]];
    if(cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"Hero"];
    }

    cell.textLabel.text = [superHeroDictionary objectForKey:@"name"];
    cell.detailTextLabel.text = [superHeroDictionary objectForKey:@"description"];
    cell.imageView.image = image;
    
    return cell;
    
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
