//
//  ViewController.m
//  Mapping!Mapping!
//
//  Created by Grimi on 7/30/13.
//  Copyright (c) 2013 MobileMakers. All rights reserved.
//

#import "ViewController.h"
#import "CustomAnnotation.h"
#import "DetailesViewController.h"

@interface ViewController ()
{
    NSMutableDictionary * routesDictionary;
    MKCoordinateRegion region;
    CLLocationCoordinate2D coordinate;
    MKCoordinateSpan span;
    __weak IBOutlet MKMapView *mapView;
    CustomAnnotation * stopAnnotation;
}

@end

@implementation ViewController

- (void)viewDidLoad
{
    
    [super viewDidLoad];
    
    routesDictionary = [NSMutableDictionary dictionaryWithCapacity:10];
    NSURL * url = [NSURL URLWithString: @"http://mobilemakers.co/lib/bus.json"];
    NSURLRequest * request = [NSURLRequest requestWithURL:url];
    
    span = MKCoordinateSpanMake(1, 1);
    coordinate = CLLocationCoordinate2DMake(41.90, -87.65);
    region = MKCoordinateRegionMake(coordinate, span);
    
    [mapView setRegion:region];
    
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse * response, NSData * data, NSError * error) {
        
        routesDictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
        
        for(NSDictionary * results in [routesDictionary objectForKey:@"row"])
        {
            stopAnnotation = [[CustomAnnotation alloc] init];
            
            coordinate = CLLocationCoordinate2DMake([[results objectForKey:@"latitude"] doubleValue], [[results objectForKey:@"longitude"]doubleValue]);
            
            stopAnnotation.title = [results objectForKey:@"cta_stop_name"];
            stopAnnotation.subtitle = [results objectForKey:@"routes"];
            stopAnnotation.direction = [results objectForKey:@"direction"];
            stopAnnotation.stopInter = [results objectForKey:@"routes"];
            stopAnnotation.coordinate = coordinate;
            
            [mapView addAnnotation:stopAnnotation];
            
        }
    }];
	// Do any additional setup after loading the view, typically from a nib.
}

-(MKAnnotationView*)mapView:(MKMapView *)_mapView viewForAnnotation:(id<MKAnnotation>)annotation
{
    MKAnnotationView* annotationView = [_mapView dequeueReusableAnnotationViewWithIdentifier:@"AnnotationIdentifier"];
    if (!annotationView) {
        annotationView = [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"AnnotationIdentifier"];
        annotationView.canShowCallout = YES;
        annotationView.rightCalloutAccessoryView = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
    }
    else
        annotationView.annotation = annotation;
    
    return annotationView;
}

-(void) mapView:(MKMapView *)_mapView annotationView:(MKAnnotationView *)view calloutAccessoryControlTapped:(UIControl *)control
{
    [self performSegueWithIdentifier:@"toDetails" sender:view];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(MKAnnotationView*)sender
{
    DetailesViewController * detailsViewController = segue.destinationViewController;
    CustomAnnotation * tempAnnotation = [[CustomAnnotation alloc] init];
    tempAnnotation = sender.annotation;
    detailsViewController.routeName = tempAnnotation.title;
    detailsViewController.routes = tempAnnotation.subtitle;
    detailsViewController.Direction = tempAnnotation.direction;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
