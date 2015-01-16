//
//  JVFloatingDrawerView.h
//  JVFloatingDrawer
//
//  Created by Julian Villella on 2015-01-11.
//  Copyright (c) 2015 JVillella. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JVFloatingDrawerViewController.h"

@interface JVFloatingDrawerView : UIView

@property (nonatomic, strong) UIView *leftViewContainer;
@property (nonatomic, strong) UIView *rightViewContainer;
@property (nonatomic, strong) UIView *centerViewContainer;

@property (nonatomic, strong) UIImageView *backgroundImageView;

@property (nonatomic, assign) CGFloat leftViewContainerWidth;
@property (nonatomic, assign) CGFloat rightViewContainerWidth;

- (UIView *)viewContainerForDrawerSide:(JVFloatingDrawerSide)drawerSide;

- (void)willOpenFloatingDrawerViewController:(JVFloatingDrawerViewController *)viewController;
- (void)willCloseFloatingDrawerViewController:(JVFloatingDrawerViewController *)viewController;

@end
