//
//  PanelView.m
//  BI-iOS-2013_03-Drawing
//
//  Created by Jakub Hladík on 07.10.13.
//  Copyright (c) 2013 FIT CTU. All rights reserved.
//

#import "PanelView.h"

@interface PanelView ()

@property (weak, nonatomic) UISlider *slider;

@end

@implementation PanelView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor redColor];
        
        UISlider *slider = [[UISlider alloc] initWithFrame:CGRectZero];
        [self addSubview:slider];
        self.slider = slider;
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.slider.frame = CGRectMake(8, 8, CGRectGetWidth(self.bounds) - 16, 44);
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
