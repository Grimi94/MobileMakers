//
//  ViewController.m
//  Day5(webbrowser)
//
//  Created by Grimi on 7/15/13.
//  Copyright (c) 2013 MobileMakers. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    
    __weak IBOutlet UIActivityIndicatorView *activity;
    __weak IBOutlet UIWebView *webView;
    __weak IBOutlet UITextField *searchBox;
    NSMutableArray * pageVisited;
    NSURL * url;
}
- (IBAction)searchPage:(id)sender;

- (IBAction)lastPage:(id)sender;
- (IBAction)nextPage:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.google.com"]]];
}

/*-(void)saveSearchedAddress:(UIWebView *)webview{
        [pageVisited insertObject:url atIndex:indexOfArray];
    
    NSLog(@"%@",url);
}*/

-(void)webViewDidStartLoad:(UIWebView *)webView{
    url = [webView.request URL];
    searchBox.text = [url absoluteString];
    [activity startAnimating];
}

-(void)webViewDidFinishLoad:(UIWebView *)webView{
    [activity stopAnimating];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(BOOL) textFieldShouldReturn:(UITextField*)textField{
    [webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:searchBox.text]]];
    [textField resignFirstResponder];
    return YES;
}

- (IBAction)searchPage:(id)sender {
    [webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:searchBox.text]]];
    [self.view endEditing:YES];
}


- (IBAction)lastPage:(id)sender {
    if([webView canGoBack])
        [webView goBack];
       
    
}

- (IBAction)nextPage:(id)sender {
    if ([webView canGoForward]) 
        [webView goForward];
}
@end
