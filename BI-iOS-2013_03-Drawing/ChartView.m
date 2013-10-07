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
        self.backgroundColor = [UIColor yellowColor];
    }
    return self;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    [super drawRect:rect];
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetStrokeColorWithColor(context, [UIColor redColor].CGColor);
    CGContextSetLineWidth(context, 2);
    CGContextSetFillColorWithColor(context, [UIColor greenColor].CGColor);
    
    CGContextFillRect(context, CGRectMake(8, 8, 100, 100));
    
//    [[UIColor whiteColor] setFill]; // setStroke
    
    
}

@end
