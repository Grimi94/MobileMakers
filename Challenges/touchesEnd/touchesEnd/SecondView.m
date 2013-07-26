//
//  SecondView.m
//  touchesEnd
//
//  Created by Grimi on 7/15/13.
//  Copyright (c) 2013 MobileMakers. All rights reserved.
//

#import "SecondView.h"
#import "touchDelegate.h"

@implementation SecondView
@synthesize delegate;
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
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

-(void)touchesEnded:(NSSet*)touches withEvent:(UIEvent*)event{
    [delegate changeLabel:self];
}



@end
