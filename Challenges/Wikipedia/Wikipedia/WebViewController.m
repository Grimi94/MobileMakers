//
//  WebViewController.m
//  Wikipedia
//
//  Created by Grimi on 7/25/13.
//  Copyright (c) 2013 MobileMakers. All rights reserved.
//

#import "WebViewController.h"

@interface WebViewController ()
{
    
    __weak IBOutlet UIWebView *webView;
}
@end

@implementation WebViewController
@synthesize snippetString;

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
    [webView loadHTMLString:snippetString baseURL:nil];
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




@end
