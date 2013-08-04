//
//  CustomAnnotation.h
//  Mapping!Mapping!
//
//  Created by Grimi on 7/30/13.
//  Copyright (c) 2013 MobileMakers. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface CustomAnnotation : NSObject <MKAnnotation>

@property (strong, nonatomic) NSString * title;
@property (strong, nonatomic) NSString * subtitle;
@property (strong, nonatomic) NSString * direction;
@property (strong, nonatomic) NSString * stopInter;
@property (assign, nonatomic) CLLocationCoordinate2D coordinate;

@end
