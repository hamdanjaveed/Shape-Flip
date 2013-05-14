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

#define SQUARE_WIDTH 100.0
#define SQUARE_HEIGHT 100.0
#define SQUARE_LINE_WIDTH 10.0
#define SQUARE_ALPHA 0.5

- (void)drawRect:(CGRect)rect {
    // create the rounded rect and add a clip
    UIBezierPath *roundedRect = [UIBezierPath bezierPathWithRoundedRect:self.bounds cornerRadius:ROUNDED_RECT_CORNER_RADIUS];
    [roundedRect addClip];
    
    // set fill color to white and fill
    [[UIColor whiteColor] setFill];
    UIRectFill(self.bounds);
    
    // draw a rounded square
    // create the path
    CGRect roundedSquareRect = CGRectMake(self.bounds.size.width / 2 - SQUARE_WIDTH / 2, self.bounds.size.height / 2 - SQUARE_HEIGHT / 2, SQUARE_WIDTH, SQUARE_HEIGHT);
    UIBezierPath *roundedSquarePath = [UIBezierPath bezierPathWithRoundedRect:roundedSquareRect cornerRadius:ROUNDED_RECT_CORNER_RADIUS];
    
    // set the stroke and fill
    [[UIColor blackColor] setStroke];
    [roundedSquarePath setLineWidth:SQUARE_LINE_WIDTH];
    UIColor *fillColor = [[UIColor greenColor] colorWithAlphaComponent:SQUARE_ALPHA];
    [fillColor setFill];
    
    // draw the square
    [roundedSquarePath stroke];
    [roundedSquarePath fill];
}

@end
