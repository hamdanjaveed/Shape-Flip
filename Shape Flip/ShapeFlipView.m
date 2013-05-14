//
//  ShapeFlipView.m
//  Shape Flip
//
//  Created by Hamdan Javeed on 2013-05-13.
//  Copyright (c) 2013 Glass Cube. All rights reserved.
//

#import "ShapeFlipView.h"

@implementation ShapeFlipView

#define ROUNDED_RECT_CORNER_RADIUS 20.0

- (void)drawRect:(CGRect)rect {
    // create the rounded rect and add a clip
    UIBezierPath *roundedRect = [UIBezierPath bezierPathWithRoundedRect:self.bounds cornerRadius:ROUNDED_RECT_CORNER_RADIUS];
    [roundedRect addClip];
    
    // set fill color to white and fill
    [[UIColor whiteColor] setFill];
    UIRectFill(self.bounds);
}

@end
