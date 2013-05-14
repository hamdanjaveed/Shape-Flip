//
//  ShapeFlipView.m
//  Shape Flip
//
//  Created by Hamdan Javeed on 2013-05-13.
//  Copyright (c) 2013 Glass Cube. All rights reserved.
//

#import "ShapeFlipView.h"

@interface ShapeFlipView()
@property (nonatomic) BOOL showSquare;
@end

@implementation ShapeFlipView

#define ROUNDED_RECT_CORNER_RADIUS 20.0
#define ROUNDED_RECT_LINE_WIDTH 10.0

#define SHAPE_WIDTH 100.0
#define SHAPE_HEIGHT 100.0
#define SHAPE_LINE_WIDTH 10.0
#define SHAPE_ALPHA 0.5

- (void)drawRect:(CGRect)rect {
    // create the rounded rect and add a clip
    UIBezierPath *roundedRect = [UIBezierPath bezierPathWithRoundedRect:self.bounds cornerRadius:ROUNDED_RECT_CORNER_RADIUS];
    [roundedRect addClip];
    
    // set fill color to white and fill
    [[UIColor whiteColor] setFill];
    UIRectFill(self.bounds);
    
    // draw the border to the rect
    [roundedRect setLineWidth:ROUNDED_RECT_LINE_WIDTH];
    [[UIColor orangeColor] setStroke];
    [roundedRect stroke];
    
    if ([self showSquare]) {
        [self drawRoundedSquare];
    } else {
        [self drawCircle];
    }
}

- (void)drawRoundedSquare {
    // push the current state
    [self pushState];
    
    // draw a rounded square
    // create the path
    CGRect roundedSquareRect = CGRectMake(self.bounds.size.width / 2 - SHAPE_WIDTH / 2, self.bounds.size.height / 2 - SHAPE_HEIGHT / 2, SHAPE_WIDTH, SHAPE_HEIGHT);
    UIBezierPath *roundedSquarePath = [UIBezierPath bezierPathWithRoundedRect:roundedSquareRect cornerRadius:ROUNDED_RECT_CORNER_RADIUS];
    
    // set the stroke and fill
    [[UIColor blackColor] setStroke];
    [roundedSquarePath setLineWidth:SHAPE_LINE_WIDTH];
    UIColor *fillColor = [[UIColor greenColor] colorWithAlphaComponent:SHAPE_ALPHA];
    [fillColor setFill];
    
    // draw the square
    [roundedSquarePath stroke];
    [roundedSquarePath fill];
    
    // restore the state
    [self popState];
}

- (void)drawCircle {
    // push the current state
    [self pushState];
    
    // draw a circle
    // create the path
    CGRect circleRect = CGRectMake(self.bounds.size.width / 2 - SHAPE_WIDTH / 2, self.bounds.size.height / 2 - SHAPE_HEIGHT / 2, SHAPE_WIDTH, SHAPE_HEIGHT);
    UIBezierPath *circlePath = [UIBezierPath bezierPathWithOvalInRect:circleRect];
    
    // set the stroke and fill
    [[UIColor blackColor] setStroke];
    [circlePath setLineWidth:SHAPE_LINE_WIDTH];
    UIColor *fillColor = [[UIColor cyanColor] colorWithAlphaComponent:SHAPE_ALPHA];
    [fillColor setFill];
    
    // draw the circle
    [circlePath stroke];
    [circlePath fill];
    
    // pop the current state
    [self popState];
}

- (void)pushState {
    // save graphics state
    CGContextSaveGState(UIGraphicsGetCurrentContext());
}

- (void)popState {
    // restore graphics state
    CGContextRestoreGState(UIGraphicsGetCurrentContext());
}

- (void)swipe:(UISwipeGestureRecognizer *)gesture {
    [self setShowSquare:![self showSquare]];
}

// ---------- Getters and Setters ---------- //

- (void)setShowSquare:(BOOL)showSquare {
    _showSquare = showSquare;
    [self setNeedsDisplay];
}

@end
