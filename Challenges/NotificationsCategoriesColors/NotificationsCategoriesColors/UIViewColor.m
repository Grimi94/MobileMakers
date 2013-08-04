//
//  UIViewColor.m
//  NotificationsCategoriesColors
//
//  Created by Grimi on 7/31/13.
//  Copyright (c) 2013 MobileMakers. All rights reserved.
//

#import "UIViewColor.h"
#import "UIColor+MColorExtended.h"

@implementation UIViewColor

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

-(id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        NSNotificationCenter * notificationCenter = [NSNotificationCenter defaultCenter];
        [notificationCenter addObserver:self selector:@selector(newColor:) name:@"TouchNotification" object:nil];
    }
return self;
}

-(void)newColor:(NSNotification*)sender
{
    self.backgroundColor = [UIColor changeColor:[sender.userInfo objectForKey:@"color"]];
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
