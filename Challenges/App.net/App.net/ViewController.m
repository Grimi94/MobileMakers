//
//  ViewController.m
//  App.net
//
//  Created by Grimi on 7/27/13.
//  Copyright (c) 2013 MobileMakers. All rights reserved.
//

#import "ViewController.h"
#import "UserViewController.h"
#import "CustomCell.h"
#import "AsyncImageDownloader.h"

#define FONT_SIZE 13.0f
#define CELL_CONTENT_WIDTH 265.0f
#define CELL_CONTENT_MARGIN 20.0f

@interface ViewController ()
{
    __weak IBOutlet UITableView *appNetTableView;
    NSMutableArray * tableArray;
    NSMutableArray * URLs;
    BOOL firstRun;
    int index;
    NSMutableArray * imagesDownloaded;
}

@end

@implementation ViewController

- (void)viewDidLoad
{
    firstRun = YES;
    imagesDownloaded = [[NSMutableArray alloc] initWithCapacity:10];
    [super viewDidLoad];
    NSURL * url = [NSURL URLWithString: @"https://alpha-api.app.net/stream/0/posts/stream/global"];
    NSURLRequest * request = [NSURLRequest requestWithURL:url];
    
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse * response, NSData * data, NSError * error) {
        NSMutableDictionary * incommingDictionary;
        incommingDictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
        tableArray  = [NSMutableArray arrayWithArray:[incommingDictionary objectForKey:@"data"]];
        for (NSDictionary* dictionary in tableArray) {
            //NSURL * urlimage = [NSURL URLWithString:[[[dictionary objectForKey:@"user"] objectForKey:@"avatar_image"] objectForKey:@"url"]];
           // NSURLRequest * requestimage = [NSURLRequest requestWithURL:urlimage];
            
            UIImageView *myImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 50, 50)];
            
            [[[AsyncImageDownloader alloc] initWithMediaURL:[[[dictionary objectForKey:@"user"] objectForKey:@"avatar_image"] objectForKey:@"url"] successBlock:^(UIImage *image)  {
                [myImageView setImage:image];
                [imagesDownloaded addObject:myImageView];
            } failBlock:^(NSError *error) {
                NSLog(@"Failed to download image due to %@!", error);
            }] startDownload];
        }
        //NSLog(@"Dictionary %@",searchDictionary);
        [appNetTableView reloadData];
    }];
    
   

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
    CustomCell * cell = [tableView dequeueReusableCellWithIdentifier:@"Hero"];
    
   // NSLog(@"%@",tableArray);
    if(cell == nil)
    {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"CustomCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
    
    cell.cellUserName.text = [[[tableArray objectAtIndex:indexPath.row] objectForKey:@"user"] objectForKey:@"username"];
    cell.cellText.text = [[tableArray objectAtIndex:indexPath.row] objectForKey:@"text"];
    NSString * urlString = [[[[tableArray objectAtIndex:indexPath.row] objectForKey:@"user"] objectForKey:@"avatar_image"] objectForKey:@"url"];
   // NSLog(@"%@",urlString);
   // cell.cellImage = [imagesDownloaded objectAtIndex:1];
    
    return cell;

}

-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    index = indexPath.row;
    [self performSegueWithIdentifier:@"toUserPosts" sender:self];
}

-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    UserViewController * userViewController = segue.destinationViewController;
    userViewController.selectedUser = [[[tableArray objectAtIndex:index] objectForKey:@"user"] objectForKey:@"username"];
    userViewController.numericalID = [[[tableArray objectAtIndex:index] objectForKey:@"user"] objectForKey:@"id"];

}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *textOfCell = [[tableArray objectAtIndex:indexPath.row] objectForKey:@"text"];
    
    CGSize constraint = CGSizeMake(CELL_CONTENT_WIDTH , 500.0f);
    
    CGSize size = [textOfCell sizeWithFont:[UIFont systemFontOfSize:FONT_SIZE] constrainedToSize:constraint lineBreakMode:NSLineBreakByWordWrapping];
    
    CGFloat height = MAX(size.height, 40.0f);
    NSLog(@"Holaaaaa");
    return height + (CELL_CONTENT_MARGIN *2);
}

@end
