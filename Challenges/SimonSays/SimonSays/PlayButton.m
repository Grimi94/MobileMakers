//
//  PlayButton.m
//  SimonSays
//
//  Created by Grimi on 8/4/13.
//  Copyright (c) 2013 MobileMakers. All rights reserved.
//

#import "PlayButton.h"
#import <QuartzCore/QuartzCore.h>


@interface PlayButton ()
-(void)animateMyButton;
@end

@implementation PlayButton

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {

    }
    return self;
}

- (id)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        self.layer.backgroundColor = [[UIColor colorWithRed:52 green:212 blue:255 alpha:1] CGColor];
        self.layer.cornerRadius = 40;
        self.layer.shadowRadius = 15.0f;
        self.layer.shadowOpacity = 100.0f;
        self.layer.shadowOffset = CGSizeZero;
        self.layer.masksToBounds = NO;
        self.layer.shadowColor =  [self.backgroundColor CGColor];
        
        [self animateMyButton];
        CABasicAnimation * animation = [CABasicAnimation animationWithKeyPath:@"shadowRadius"];
        animation.fromValue = [NSNumber numberWithInt:15];
        animation.toValue = [NSNumber numberWithInt:0];
        animation.speed = .2;
        animation.autoreverses = YES;
        animation.repeatCount = 10;
        [self.layer addAnimation:animation forKey:@"shadowRadius"];
    }
    return self;
}



-(void)animateMyButton
{

    [UIView animateWithDuration:0.7f delay:0 options:UIViewAnimationOptionAutoreverse | UIViewAnimationCurveEaseInOut | UIViewAnimationOptionRepeat | UIViewAnimationOptionAllowUserInteraction  animations:^{
        
        [UIView setAnimationRepeatCount:15];
        //self.layer.shadowOpacity = 5.0f;
        
        //self.transform = CGAffineTransformMakeScale(1.1f, 1.1f);
        
    } completion:^(BOOL finished) {
        //self.layer.shadowRadius = 0.0f;
        
        //self.transform = CGAffineTransformMakeScale(1.0f, 1.0f);
    }];

}

@end


