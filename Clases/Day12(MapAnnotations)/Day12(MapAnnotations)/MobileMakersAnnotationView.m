//
//  MobileMakersAnnotationView.m
//  Day12(MapAnnotations)
//
//  Created by Grimi on 7/30/13.
//  Copyright (c) 2013 MobileMakers. All rights reserved.
//

#import "MobileMakersAnnotationView.h"

@implementation MobileMakersAnnotationView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

-(id)initWithAnnotation:(id<MKAnnotation>)annotation reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithAnnotation:annotation reuseIdentifier:reuseIdentifier];
    if (self) {
       // self.image
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
