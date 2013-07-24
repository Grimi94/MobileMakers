//
//  MyView.h
//  Day8(UItouching)
//
//  Created by Grimi on 7/18/13.
//  Copyright (c) 2013 MobileMakers. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MatchDelegate.h"

@interface MyView : UIImageView

@property (strong, nonatomic) id <MatchDelegate> delegate;
@property (strong, nonatomic) UIColor* hiddenColor;
@property BOOL faceUp;


@end
