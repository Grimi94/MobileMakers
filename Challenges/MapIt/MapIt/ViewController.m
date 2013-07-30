//
//  ViewController.m
//  MapIt
//
//  Created by Grimi on 7/29/13.
//  Copyright (c) 2013 MobileMakers. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    
    __weak IBOutlet UIView *uiView;
    __weak IBOutlet UISearchBar *mapSearchField;
    __weak IBOutlet MKMapView *mapView;
    CLLocationManager * locationManager;
    NSMutableDictionary * searchDictionary;
    BOOL searchBarHidden;
}

@end

@implementation ViewController

- (void)viewDidLoad
{
    locationManager.delegate = self;
    searchDictionary = [NSMutableDictionary dictionaryWithCapacity:10];
    
    CLLocationCoordinate2D coord = {.latitude =  41.894056, .longitude =  -87.635419};
    MKCoordinateSpan span = {.latitudeDelta =  .005, .longitudeDelta =  .005};
    MKCoordinateRegion region = {coord, span};
    [mapView setRegion:region];
    
    MKPointAnnotation *annotationPoint = [[MKPointAnnotation alloc] init];
    annotationPoint.coordinate = coord;
    annotationPoint.title = @"Mobile Makers";
    annotationPoint.subtitle = @"Secret Wharehouse";
    [mapView addAnnotation:annotationPoint];
    
    searchBarHidden = NO;

    [super viewDidLoad];

}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)viewTapped:(UIGestureRecognizer*)sender
{
        [self.view endEditing:YES];
    if (!searchBarHidden) {
        [UIView animateWithDuration:0.4
                         animations:^{
                             mapSearchField.center = CGPointMake(160,-22);
                             mapView.frame = CGRectMake(0,0, 320, 557);
                             searchBarHidden = YES;
                         } completion:^(BOOL finished) {
                             
                         }];
    }
    else
    {
        [UIView animateWithDuration:0.4
                         animations:^{
                             mapSearchField.center = CGPointMake(160,22);
                             mapView.frame = CGRectMake(0,0, 320, 557);
                         } completion:^(BOOL finished) {
                             searchBarHidden = NO;
                         }];
    }

}

-(void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    [searchBar resignFirstResponder];

    NSURL * url = [NSURL URLWithString: [[NSString stringWithFormat:@"http://maps.googleapis.com/maps/api/geocode/json?address=%@&sensor=false",searchBar.text]stringByReplacingOccurrencesOfString:@" " withString:@"+"]];
  //  NSLog(@"%@",url);
    NSURLRequest * request = [NSURLRequest requestWithURL:url];
    
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse * response, NSData * data, NSError * error) {
        
        searchDictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
        
        for(NSDictionary * results in [searchDictionary objectForKey:@"results"])
        {
                double latitude = [[[[results objectForKey:@"geometry"] objectForKey:@"location"] objectForKey:@"lat"] doubleValue];
                double longitude = [[[[results objectForKey:@"geometry"] objectForKey:@"location"] objectForKey:@"lng"] doubleValue];
                NSLog(@"%f",[[[[results objectForKey:@"geometry"] objectForKey:@"location"] objectForKey:@"lng"] doubleValue]);
                 CLLocationCoordinate2D coord = {.latitude = latitude, .longitude = longitude};
                MKPointAnnotation *annotationPoint = [[MKPointAnnotation alloc] init];
                annotationPoint.coordinate = coord;
                annotationPoint.title = @"Mobile Makers";
                annotationPoint.subtitle = [results objectForKey:@"formatted_address"];
                [mapView addAnnotation:annotationPoint];
        
        }
        
    }];
    
}


@end
