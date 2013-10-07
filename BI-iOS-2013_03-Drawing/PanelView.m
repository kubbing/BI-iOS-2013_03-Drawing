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
        self.backgroundColor = [UIColor lightGrayColor];
        
        UISlider *slider = [[UISlider alloc] initWithFrame:CGRectZero];
        [slider addTarget:self
                   action:@selector(sliderValueChanged:)
         forControlEvents:UIControlEventValueChanged];
        
        [self addSubview:slider];
        self.slider = slider;
        
        [NSTimer scheduledTimerWithTimeInterval:(1/30)
                                         target:self
                                       selector:@selector(timerFired:)
                                       userInfo:@"I am timer!"
                                        repeats:YES];
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.slider.frame = CGRectMake(8, 8, CGRectGetWidth(self.bounds) - 16, 44);
}

#pragma mark - Actions

- (void)timerFired:(NSTimer *)timer
{
    CGFloat value = self.slider.value;
    value += 0.001;
    self.slider.value = value;
    [self sliderValueChanged:self.slider];
}

- (void)sliderValueChanged:(id)object // UISlider *slider
{
//    if ([object isKindOfClass:[UISlider class]]) {
//        
//    }
    UISlider *slider = (UISlider *)object;

    if ([self.delegate respondsToSelector:@selector(panelView:sliderChanged:)]) {
        [self.delegate panelView:self
                   sliderChanged:slider];
    }
    
    if (self.onSliderChange) {
        self.onSliderChange(slider.value);
    }
}

@end
