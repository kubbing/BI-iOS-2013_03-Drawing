//
//  FirstViewController.m
//  BI-iOS-2013_03-Drawing
//
//  Created by Jakub Hladík on 07.10.13.
//  Copyright (c) 2013 FIT CTU. All rights reserved.
//

#import "FirstViewController.h"

#include "ChartView.h"
#include "PanelView.h"

@interface FirstViewController ()

@property (weak, nonatomic) ChartView *chartView;
@property (weak, nonatomic) PanelView *panelView;

@end

@implementation FirstViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    ChartView *chartView = [[ChartView alloc] initWithFrame:CGRectZero];
    chartView.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    
    UIPanGestureRecognizer *recognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panRecognized:)];
    [chartView addGestureRecognizer:recognizer];
    
    [self.view addSubview:chartView];
    self.chartView = chartView;
    
    PanelView *panelView = [[PanelView alloc] initWithFrame:CGRectZero];
    panelView.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    panelView.delegate = self;
    panelView.onSlide = ^(CGFloat value) {
//        NSLog(@"from block: %f", value);
    };
    [self.view addSubview:panelView];
    self.panelView = panelView;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    self.chartView.frame = CGRectMake(8, 20 + 8, CGRectGetWidth(self.view.bounds) - 16, 512);
    self.panelView.frame = CGRectMake(8, 20 + 512 + 16, CGRectGetWidth(self.view.bounds) - 16, 128);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UIGestureRecognizerDelegate

- (void)panRecognized:(UIPanGestureRecognizer *)recognizer
{
    CGPoint point = [recognizer translationInView:self.view];

    static CGPoint center;
    
    switch (recognizer.state) {
        case UIGestureRecognizerStateBegan:
        {
            NSLog(@"UIGestureRecognizerStateBegan");
            center = self.chartView.center;
        }
            break;
        case UIGestureRecognizerStateChanged:
        {
            NSLog(@"UIGestureRecognizerStateChanged");
            self.chartView.center = CGPointMake(center.x + point.x, center.y + point.y);
        }
            break;
        default:
            break;
    }
}

#pragma mark - PanelViewDelegate

- (void)panelView:(PanelView *)panelView sliderChanged:(UISlider *)slider
{
//    NSLog(@"%f", slider.value);
    
    self.chartView.amp = slider.value;
}

@end
