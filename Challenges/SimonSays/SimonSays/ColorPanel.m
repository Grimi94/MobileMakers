//
//  ColorPanel.m
//  SimonSays
//
//  Created by Grimi on 8/1/13.
//  Copyright (c) 2013 MobileMakers. All rights reserved.
//

#import "ColorPanel.h"
#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@implementation ColorPanel
{
    UIColor * color;
    AVAudioPlayer * audioPlayer;
    NSString * audioPath;
    NSURL * audioURL;
    NSArray * arrayOfFiles;
    
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
        arrayOfFiles = @[@"FirstSound",@"SecondSound",@"ThirdSound",@"FourthSound",@"FifthSound",@"SixthSound"];
        
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
    [self highlight];
    
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    self.backgroundColor = [UIColor blackColor];
    [UIView animateWithDuration:2 animations:^{
        self.layer.shadowRadius = 0.0f;
    }completion:^(BOOL finished) {
        [delegate returnTagAndSaveTouch:self.tag];
    } ];
}

-(void)playSound
{
    audioPath = [[NSBundle mainBundle] pathForResource:[arrayOfFiles objectAtIndex:self.tag-1] ofType:@".m4a"];
    audioURL = [NSURL fileURLWithPath:audioPath];
    audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:audioURL error:nil];
    
    [audioPlayer play];
}



-(void)highlight
{
    [self playSound];
    
    self.backgroundColor = color;
    
    [UIView animateWithDuration:1.5 animations:^{
        self.layer.shadowRadius = 15.0f;
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:.5 animations:^{
            self.layer.shadowRadius = 0.0f;
            self.backgroundColor = [UIColor blackColor];
        }];
    }];
}

@end
