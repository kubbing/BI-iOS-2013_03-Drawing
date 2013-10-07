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
    [self.view addSubview:chartView];
    self.chartView = chartView;
    
    PanelView *panelView = [[PanelView alloc] initWithFrame:CGRectZero];
    panelView.autoresizingMask = UIViewAutoresizingFlexibleWidth;
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

@end
