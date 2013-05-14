//
//  ShapeFlipViewController.m
//  Shape Flip
//
//  Created by Hamdan Javeed on 2013-05-13.
//  Copyright (c) 2013 Glass Cube. All rights reserved.
//

#import "ShapeFlipViewController.h"
#import "ShapeFlipView.h"

@interface ShapeFlipViewController ()
@property (weak, nonatomic) IBOutlet ShapeFlipView *shapeFlipView;
@end

@implementation ShapeFlipViewController

- (void)setShapeFlipView:(ShapeFlipView *)shapeFlipView {
    _shapeFlipView = shapeFlipView;
}

@end
