//
//  PixelView.m
//  Day16(Animations)
//
//  Created by Grimi on 8/1/13.
//  Copyright (c) 2013 MobileMakers. All rights reserved.
//

#import "PixelView.h"

@implementation PixelView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch * touch = [touches anyObject];
    CGPoint point = [touch locationInView:self.superview];
    CGSize viewController =  self.superview.frame.size;
    int x = (rand() % (int)(self.superview.frame.size.width-self.frame.size.width)) + self.frame.size.width/2;
    int y = (rand() % (int)(self.superview.frame.size.height-self.frame.size.height)) + self.frame.size.height/2;
    
    self.center = CGPointMake(x, y);
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
