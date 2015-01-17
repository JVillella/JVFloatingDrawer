//
//  JVFloatingDrawerView.m
//  JVFloatingDrawer
//
//  Created by Julian Villella on 2015-01-11.
//  Copyright (c) 2015 JVillella. All rights reserved.
//

#import "JVFloatingDrawerView.h"

static const CGFloat kJVCenterViewContainerCornerRadius = 5.0;
static const CGFloat kJVDefaultViewContainerWidth = 280.0;

@interface JVFloatingDrawerView ()

@property (nonatomic, strong) NSLayoutConstraint *leftViewContainerWidthConstraint;
@property (nonatomic, strong) NSLayoutConstraint *rightViewContainerWidthConstraint;

@end

@implementation JVFloatingDrawerView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if(self) {
        [self setup];
    }
    return self;
}

#pragma mark - View Setup

- (void)setup {
    [self setupBackgroundImageView];
    [self setupCenterViewContainer];
    [self setupLeftViewContainer];
    [self setupRightViewContainer];
    
    [self bringSubviewToFront:self.centerViewContainer];
}

- (void)setupBackgroundImageView {
    _backgroundImageView = [[UIImageView alloc] init];
    
    self.backgroundImageView.contentMode = UIViewContentModeScaleAspectFill;
    [self.backgroundImageView setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self addSubview:self.backgroundImageView];
    
    NSArray *constraints = @[
        [NSLayoutConstraint constraintWithItem:self.backgroundImageView attribute:NSLayoutAttributeLeading  relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeLeading multiplier:1.0 constant:0.0],
        [NSLayoutConstraint constraintWithItem:self.backgroundImageView attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTrailing multiplier:1.0 constant:0.0],
        [NSLayoutConstraint constraintWithItem:self.backgroundImageView attribute:NSLayoutAttributeTop      relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTop multiplier:1.0 constant:0.0],
        [NSLayoutConstraint constraintWithItem:self.backgroundImageView attribute:NSLayoutAttributeBottom   relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeBottom multiplier:1.0 constant:0.0],
    ];
    
    [self addConstraints:constraints];
}

- (void)setupLeftViewContainer {
    _leftViewContainer = [[UIView alloc] init];
    
    [self.leftViewContainer setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self addSubview:self.leftViewContainer];
    
    NSLayoutConstraint *widthConstraint = [NSLayoutConstraint constraintWithItem:self.leftViewContainer attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual
                                                                          toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:kJVDefaultViewContainerWidth];
    NSArray *constraints = @[
        [NSLayoutConstraint constraintWithItem:self.leftViewContainer attribute:NSLayoutAttributeHeight   relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeHeight multiplier:1.0 constant:0.0],
        [NSLayoutConstraint constraintWithItem:self.leftViewContainer attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeLeading multiplier:1.0 constant:0.0],
        [NSLayoutConstraint constraintWithItem:self.leftViewContainer attribute:NSLayoutAttributeTop      relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTop multiplier:1.0 constant:0.0],
        widthConstraint
    ];
    
    [self addConstraints:constraints];
    
    self.leftViewContainerWidthConstraint = widthConstraint;
}

- (void)setupRightViewContainer {
    _rightViewContainer = [[UIView alloc] init];
    
    [self.rightViewContainer setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self addSubview:self.rightViewContainer];
    
    NSLayoutConstraint *widthConstraint = [NSLayoutConstraint constraintWithItem:self.rightViewContainer attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual
                                                                          toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:kJVDefaultViewContainerWidth];
    NSArray *constraints = @[
        [NSLayoutConstraint constraintWithItem:self.rightViewContainer attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual  toItem:self attribute:NSLayoutAttributeHeight multiplier:1.0 constant:0.0],
        [NSLayoutConstraint constraintWithItem:self.rightViewContainer attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTrailing multiplier:1.0 constant:0.0],
        [NSLayoutConstraint constraintWithItem:self.rightViewContainer attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual     toItem:self attribute:NSLayoutAttributeTop multiplier:1.0 constant:0.0],
        widthConstraint
    ];
    
    [self addConstraints:constraints];
    
    self.rightViewContainerWidthConstraint = widthConstraint;
}

- (void)setupCenterViewContainer {
    _centerViewContainer = [[UIView alloc] init];
    
    [self.centerViewContainer setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self addSubview:self.centerViewContainer];

    NSArray *constraints = @[
        [NSLayoutConstraint constraintWithItem:self.centerViewContainer attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeLeading multiplier:1.0 constant:0.0],
        [NSLayoutConstraint constraintWithItem:self.centerViewContainer attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTrailing multiplier:1.0 constant:0.0],
        [NSLayoutConstraint constraintWithItem:self.centerViewContainer attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTop multiplier:1.0 constant:0.0],
        [NSLayoutConstraint constraintWithItem:self.centerViewContainer attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeBottom multiplier:1.0 constant:0.0],
    ];
    
    [self addConstraints:constraints];
}

#pragma mark - Reveal Widths

- (void)setLeftViewContainerWidth:(CGFloat)leftViewContainerWidth {
    self.leftViewContainerWidthConstraint.constant = leftViewContainerWidth;
}

- (void)setRightViewContainerWidth:(CGFloat)rightViewContainerWidth {
    self.rightViewContainerWidthConstraint.constant = rightViewContainerWidth;
}

- (CGFloat)leftViewContainerWidth {
    return self.leftViewContainerWidthConstraint.constant;
}

- (CGFloat)rightViewContainerWidth {
    return self.rightViewContainerWidthConstraint.constant;
}

#pragma mark - Helpers

- (UIView *)viewContainerForDrawerSide:(JVFloatingDrawerSide)drawerSide {
    UIView *viewContainer = nil;
    switch (drawerSide) {
        case JVFloatingDrawerSideLeft: viewContainer = self.leftViewContainer; break;
        case JVFloatingDrawerSideRight: viewContainer = self.rightViewContainer; break;
        case JVFloatingDrawerSideNone: viewContainer = nil; break;
    }
    return viewContainer;
}

#pragma mark - Open/Close Events

- (void)willOpenFloatingDrawerViewController:(JVFloatingDrawerViewController *)viewController {
    [self applyBorderRadiusToCenterViewController];
    [self applyShadowToCenterViewContainer];
}

- (void)willCloseFloatingDrawerViewController:(JVFloatingDrawerViewController *)viewController {
    [self removeBorderRadiusFromCenterViewController];
    [self removeShadowFromCenterViewContainer];
}

#pragma mark - View Related

// Notice, border is applied to centerViewController.view whereas shadow is applied to
// drawerView.centerViewContainer. This is because cornerRadius requires masksToBounds = YES
// but for shadows to render outside the view, masksToBounds must be NO. So we apply them on
// different views.
- (void)applyBorderRadiusToCenterViewController {
    // FIXME: Safe? Maybe move this into a property
    UIView *containerCenterView = [self.centerViewContainer.subviews firstObject];
    
    CALayer *centerLayer = containerCenterView.layer;
    centerLayer.borderColor = [UIColor colorWithWhite:1.0 alpha:0.15].CGColor;
    centerLayer.borderWidth = 1.0;
    centerLayer.cornerRadius = kJVCenterViewContainerCornerRadius;
    centerLayer.masksToBounds = YES;
}

- (void)removeBorderRadiusFromCenterViewController {
    // FIXME: Safe? Maybe move this into a property
    UIView *containerCenterView = [self.centerViewContainer.subviews firstObject];
    
    CALayer *centerLayer = containerCenterView.layer;
    centerLayer.borderColor = [UIColor clearColor].CGColor;
    centerLayer.borderWidth = 0.0;
    centerLayer.cornerRadius = 0.0;
    centerLayer.masksToBounds = NO;
}

- (void)applyShadowToCenterViewContainer {
    CALayer *layer = self.centerViewContainer.layer;
    layer.shadowRadius  = 20.0;
    layer.shadowColor   = [UIColor blackColor].CGColor;
    layer.shadowOpacity = 0.4;
    layer.shadowOffset  = CGSizeMake(0.0, 0.0);
    layer.masksToBounds = NO;
    
    [self updateShadowPath];
}

- (void)removeShadowFromCenterViewContainer {
    CALayer *layer = self.centerViewContainer.layer;
    layer.shadowRadius  = 0.0;
    layer.shadowOpacity = 0.0;
}

- (void)updateShadowPath {
    CALayer *layer = self.centerViewContainer.layer;
    
    CGFloat increase = layer.shadowRadius;
    CGRect centerViewContainerRect = self.centerViewContainer.bounds;
    centerViewContainerRect.origin.x -= increase;
    centerViewContainerRect.origin.y -= increase;
    centerViewContainerRect.size.width  += 2.0 * increase;
    centerViewContainerRect.size.height += 2.0 * increase;
    
    layer.shadowPath = [[UIBezierPath bezierPathWithRoundedRect:centerViewContainerRect cornerRadius:kJVCenterViewContainerCornerRadius] CGPath];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    [self updateShadowPath];
}

@end
