//
//  NewUIView.m
//  Day15(Notifications)
//
//  Created by Grimi on 7/31/13.
//  Copyright (c) 2013 MobileMakers. All rights reserved.
//

#import "NewUIView.h"

@implementation NewUIView

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

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSNotificationCenter* notificationCenter = [NSNotificationCenter defaultCenter];
    NSLog(@"%@",notificationCenter);
    
    [notificationCenter postNotificationName:@"TouchNotification" object:nil];
}

@end
