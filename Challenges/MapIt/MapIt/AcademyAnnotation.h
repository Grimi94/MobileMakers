//
//  AcademyAnnotation.h
//  MapIt
//
//  Created by Grimi on 7/30/13.
//  Copyright (c) 2013 MobileMakers. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface AcademyAnnotation : NSObject <MKAnnotation>

@property (strong, nonatomic) NSString * title;
@property CLLocationCoordinate2D coordinate;

@end
