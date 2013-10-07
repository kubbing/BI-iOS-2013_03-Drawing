//
//  PanelView.h
//  BI-iOS-2013_03-Drawing
//
//  Created by Jakub Hladík on 07.10.13.
//  Copyright (c) 2013 FIT CTU. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol PanelViewDelegate;

@interface PanelView : UIView

@property (weak, nonatomic) id<PanelViewDelegate> delegate;

@end

@protocol PanelViewDelegate <NSObject>

- (void)panelView:(PanelView *)panelView
    sliderChanged:(UISlider *)slider;

@end
