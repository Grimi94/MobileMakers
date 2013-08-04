//
//  ColorPanel.m
//  SimonSays
//
//  Created by Grimi on 8/1/13.
//  Copyright (c) 2013 MobileMakers. All rights reserved.
//

#import "ColorPanel.h"

@implementation ColorPanel
{
    UIColor * color;
}
@synthesize delegate;

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
        [self.layer setCornerRadius:45];
        color = self.backgroundColor;
        self.layer.borderWidth = 10;
        self.layer.borderColor = [color CGColor];
        self.layer.shadowColor = [color CGColor];
        self.layer.shadowRadius = 0.0f;
        self.layer.shadowOpacity = 100.0f;
        self.layer.shadowOffset = CGSizeMake(0, 0);
        self.layer.masksToBounds = NO;
        self.backgroundColor = [UIColor blackColor];
    }
    return self;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
   // self.backgroundColor =  color;
        [self highlight];
    
}
-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    self.backgroundColor = [UIColor blackColor];
    [UIView animateWithDuration:2 animations:^{
        self.layer.shadowRadius = 0.0f;
    }completion:^(BOOL finished) {
        [delegate returnTag:self.tag];
    } ];
}

-(void)highlight
{
    self.backgroundColor = color;
    [UIView animateWithDuration:2 animations:^{
        
        self.layer.shadowRadius = 15.0f;
        
    } completion:^(BOOL finished) {
        //[UIView animateWithDuration:6 animations:^{
            //self.layer.shadowRadius = 1.0f;
            // self.backgroundColor = [UIColor blackColor];
        //}];
    }];
/*

    [UIView animateWithDuration:0.25 animations:^{
        self.alpha = 0.5;
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:.25 animations:^{
          self.alpha = 1;
        } completion:^(BOOL finished) {
            
        }
         ];
    }];*/
}

@end
