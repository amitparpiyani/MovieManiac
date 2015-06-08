//
//  RatingLabel.m
//  RottenTomatos
//
//  Created by Amit Parpiyani on 02/06/15.
//  Copyright (c) 2015 DevPods. All rights reserved.
//

#import "RatingLabel.h"
#define FONT_SIZE 24.0f
#define APP_FONT_NAME @"moviemaniac"
#define FULL_STAR_CHAR @"c"
#define HALF_STAR_CHAR @"b"
#define EMPTY_STAR_CHAR @"a"

@implementation RatingLabel

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
-(void)setLblTextFromRating:(float)rating
{
    [self setFont:[UIFont fontWithName:@"moviemaniac" size:16.0f]];
    if (self.tag <= rating/2)
    {
        self.text = FULL_STAR_CHAR;
        
    }
    else if (self.tag <=(rating/2)+0.5)
    {
        self.text = HALF_STAR_CHAR;
    }
    else
    {
        self.text = EMPTY_STAR_CHAR;
    }
}

@end
