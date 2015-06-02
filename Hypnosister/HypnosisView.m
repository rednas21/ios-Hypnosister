//
//  HypnosisView.m
//  Hypnosister
//
//  Created by Sander Peerna on 6/2/15.
//  Copyright (c) 2015 Sander Peerna. All rights reserved.
//

#import "HypnosisView.h"

@implementation HypnosisView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    CGRect bounds = self.bounds;
    
    // Figure out the center of the bounds rectangle
    CGPoint center;
    center.x = bounds.origin.x + bounds.size.width / 2.0;
    center.y = bounds.origin.y + bounds.size.height / 2.0;
    
    NSLog(@"%f, %f", bounds.size.width, bounds.size.height);
    NSLog(@"%f, %f", center.x, center.y);
    
    // The circle will be the largest that can fit in the view
    float radius = (MIN(bounds.size.width, bounds.size.height) / 2.0);
    
    UIBezierPath *path = [[UIBezierPath alloc] init];
    
    // Add an arc to the path at center, with radius, from 0 to 2pi radians (full circle)
    [path addArcWithCenter:center
                    radius:radius
                startAngle:0
                  endAngle:M_PI * 2
                 clockwise:YES];
    
    // Draw the circle.
    path.lineWidth = 10;
    [[UIColor lightGrayColor] setStroke];
    [path stroke];
}

@end
