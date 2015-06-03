//
//  HypnosisView.m
//  Hypnosister
//
//  Created by Sander Peerna on 6/2/15.
//  Copyright (c) 2015 Sander Peerna. All rights reserved.
//

#import "HypnosisView.h"

@interface HypnosisView()

@property (nonatomic, strong) UIColor *circleColor;

@end

@implementation HypnosisView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        self.circleColor = [UIColor lightGrayColor];
    }
    return self;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"%@ was touched", self);
    
    float red = (arc4random() % 100) / 100.0;
    float green = (arc4random() % 100) / 100.0;
    float blue = (arc4random() % 100) / 100.0;
    
    UIColor *randomColor = [UIColor colorWithRed:red
                                           green:green
                                            blue:blue
                                           alpha:1.0];
    
    self.circleColor = randomColor;
    [self setNeedsDisplay];
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
    
    // The largest circle will circumscribe the view
    float maxRadius = hypot(bounds.size.width, bounds.size.height) / 2.0;
    
    UIBezierPath *path = [[UIBezierPath alloc] init];
    
    for (float currentRadius = maxRadius; currentRadius > 0; currentRadius -= 20)
    {
        [path moveToPoint:CGPointMake(center.x + currentRadius, center.y)];
        [path addArcWithCenter:center
                        radius:currentRadius
                    startAngle:0
                      endAngle:M_PI * 2
                     clockwise:YES];
    }
    
    // Draw the circle.
    path.lineWidth = 10;
    [self.circleColor setStroke];
    [path stroke];
    
    // Gradient
    UIBezierPath *trianglePath = [[UIBezierPath alloc] init];
    [trianglePath moveToPoint:CGPointMake(center.x, center.y-100.f)];
    [trianglePath addLineToPoint:CGPointMake(center.x-100.f, center.y+100.f)];
    [trianglePath addLineToPoint:CGPointMake(center.x+100.f, center.y+100.f)];
    [trianglePath addLineToPoint:CGPointMake(center.x, center.y-100.f)];
    [trianglePath stroke];
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSaveGState(context);
    [trianglePath addClip];

    CGFloat locations[2] = { 0.0, 1.0 };
    CGFloat components[8] = { 1.0, 0.0, 0.0, 1.0,   // Start color is red
                              1.0, 1.0, 0.0, 1.0 }; // End color is yellow
    
    CGColorSpaceRef colorspace = CGColorSpaceCreateDeviceRGB();
    CGGradientRef gradient = CGGradientCreateWithColorComponents(colorspace, components,
                                                                 locations, 2);
    CGPoint startPoint = CGPointMake(center.x, center.y-100.f);
    CGPoint endPoint = CGPointMake(center.x+100.f, center.y+100.f);
    CGContextDrawLinearGradient(context, gradient, startPoint, endPoint, 0);
    CGGradientRelease(gradient);
    CGColorSpaceRelease(colorspace);
    CGContextRestoreGState(context);
    
    // Shadow
    CGContextSaveGState(context);
    CGContextSetShadow(context, CGSizeMake(4, 7), 3);
    
    // Image
    UIImage *logo = [UIImage imageNamed:@"epocLogo.png"];
    [logo drawInRect:CGRectMake(center.x - center.x / 2.0, center.y, center.x, 40)];
}

@end
