//
//  ChartView.m
//  BI-iOS-2013_03-Drawing
//
//  Created by Jakub Hladík on 07.10.13.
//  Copyright (c) 2013 FIT CTU. All rights reserved.
//

#import "ChartView.h"

@implementation ChartView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor greenColor];
    }
    return self;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    [super drawRect:rect];
    
    CGContextRef contextRef =  UIGraphicsGetCurrentContext();
    
    CGContextFillRect(contextRef, CGRectMake(8, 8, 100, 100));
    
    CGContextSetStrokeColorWithColor(contextRef, [UIColor blackColor].CGColor);
    CGContextSetLineWidth(contextRef, 2);
    CGContextMoveToPoint(contextRef, 0, 0);
    
    for (NSInteger i = 0; i < 512; i += 4) {
        CGContextAddLineToPoint(contextRef, i, CGRectGetHeight(self.bounds)/2.0 + 20 *sinf(i));
    }
    
    CGContextStrokePath(contextRef);
}

@end
