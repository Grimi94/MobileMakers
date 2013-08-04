//
//  ViewController.m
//  Day12(MapAnnotations)
//
//  Created by Grimi on 7/30/13.
//  Copyright (c) 2013 MobileMakers. All rights reserved.
//

#import "ViewController.h"
#import "AcademyAnnotation.h"

@interface ViewController ()
{
    
    __weak IBOutlet MKMapView *mapView;
}
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    MKCoordinateRegion region;
    CLLocationCoordinate2D coordinate;
    MKCoordinateSpan span;
    AcademyAnnotation * academyLocation;
    academyLocation = [[AcademyAnnotation alloc] init];
    
    span = MKCoordinateSpanMake(1, 1);
    coordinate = CLLocationCoordinate2DMake(41.90, -87.65);
    region = MKCoordinateRegionMake(coordinate, span);
    
    
    [mapView setRegion:region];
    
    academyLocation.title = @"Mobile Makers";
    academyLocation.coordinate = coordinate;
    
    [mapView addAnnotation:academyLocation];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
    NSLog(@"Im Here %@",view.annotation.title);
}

@end
