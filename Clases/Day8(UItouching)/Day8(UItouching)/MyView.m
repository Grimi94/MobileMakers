//
//  MyView.m
//  Day8(UItouching)
//
//  Created by Grimi on 7/18/13.
//  Copyright (c) 2013 MobileMakers. All rights reserved.
//

#import "MyView.h"
#import "MatchDelegate.h"

@implementation MyView
@synthesize delegate;
@synthesize hiddenColor;
@synthesize faceUp;


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
    }
    return self;
}

- (id) initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if (self) {
        faceUp = NO;
        [self setBackgroundColor:[UIColor whiteColor]];
    }
    return self;
}

-(void) touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    [delegate didChooseView:self];
    
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
/*- (void)drawRect:(CGRect)rect
{
    NSLog(@"Holaa");
    [self setBackgroundColor:[UIColor greenColor]];

    [super drawRect:rect];
}*/


@end
