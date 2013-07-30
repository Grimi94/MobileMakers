//
//  ViewController.m
//  Day12(MapAnnotations)
//
//  Created by Grimi on 7/30/13.
//  Copyright (c) 2013 MobileMakers. All rights reserved.
//

#import "ViewController.h"

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
    
    span = MKCoordinateSpanMake(1, 1);
    coordinate = CLLocationCoordinate2DMake(41.90, -87.65);
    region = MKCoordinateRegionMake(coordinate, span);
    
    [mapView setRegion:region];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
