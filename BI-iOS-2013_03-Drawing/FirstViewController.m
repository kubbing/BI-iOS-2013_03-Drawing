//
//  FirstViewController.m
//  BI-iOS-2013_03-Drawing
//
//  Created by Jakub Hladík on 07.10.13.
//  Copyright (c) 2013 FIT CTU. All rights reserved.
//

#import "FirstViewController.h"

#import "ChartView.h"
#import "PanelView.h"

@interface FirstViewController ()

@property (strong, nonatomic) ChartView *chartView;
@property (strong, nonatomic) PanelView *panelView;

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
    
    PanelView *panelview = [[PanelView alloc] initWithFrame:CGRectZero];
    panelview.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    panelview.delegate = self;
    [self.view addSubview:panelview];
    self.panelView = panelview;
    
//    __weak typeof(self) blockSelf = self;
    panelview.onSliderChange = ^(CGFloat value) {
//        NSLog(@"block: %f", value);
//        blockSelf.chartView.amp = value;
    };
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    self.chartView.frame = CGRectMake(8, 20 + 8, CGRectGetWidth(self.view.bounds) - 16, 512);
    
    self.panelView.frame = CGRectMake(8, 20 + 16 + 512, CGRectGetWidth(self.view.bounds) - 16, 128);
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
    NSLog(@"(%f, %f)", point.x, point.y);
    
    static CGPoint center;
    
    switch (recognizer.state) {
        case UIGestureRecognizerStateBegan:
        {
            center = self.chartView.center;
        }
            break;
        case UIGestureRecognizerStateChanged:
        {
            self.chartView.center = CGPointMake(center.x + point.x, center.y + point.y);
        }
            break;
        case UIGestureRecognizerStateEnded:
        {
            
        }
            break;
            
        default:
            break;
    }
}

#pragma mark - PanelViewDelegate

- (void)panelView:(PanelView *)panelView sliderChanged:(UISlider *)slider
{
//    NSLog(@"delegate: %f", slider.value);
    
    self.chartView.amp = slider.value;
}

@end
