//
//  JVFloatingDrawerView.m
//  JVFloatingDrawer
//
//  Created by Julian Villella on 2015-01-11.
//  Copyright (c) 2015 JVillella. All rights reserved.
//

#import "JVFloatingDrawerView.h"

static const CGFloat kJVDefaultViewContainerWidth = 80.0;

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
//    [self setupLeftViewContainer];
//    [self setupRightViewContainer];
//    [self setupCenterViewContainer];
}

- (void)setupBackgroundImageView {
    _backgroundImageView = [[UIImageView alloc] init];
    [self.backgroundImageView setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self addSubview:self.backgroundImageView];
    
    NSArray *constraints = @[
        [NSLayoutConstraint constraintWithItem:self.backgroundImageView attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual
                                        toItem:self attribute:NSLayoutAttributeLeading multiplier:1.0 constant:0.0],
        
        [NSLayoutConstraint constraintWithItem:self.backgroundImageView attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual
                                        toItem:self attribute:NSLayoutAttributeTrailing multiplier:1.0 constant:0.0],
        
        [NSLayoutConstraint constraintWithItem:self.backgroundImageView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual
                                        toItem:self attribute:NSLayoutAttributeTop multiplier:1.0 constant:0.0],
        
        [NSLayoutConstraint constraintWithItem:self.backgroundImageView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual
                                        toItem:self attribute:NSLayoutAttributeBottom multiplier:1.0 constant:0.0],
    ];
    
    [self addConstraints:constraints];
}

- (void)setupLeftViewContainer {
    _leftViewContainer = [[UIView alloc] init];
    [self.leftViewContainer setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self addSubview:self.leftViewContainer];
    
    NSLayoutConstraint *heightConstraint = [NSLayoutConstraint constraintWithItem:self.leftViewContainer attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual
                                                                           toItem:self.centerViewContainer attribute:NSLayoutAttributeHeight multiplier:1.0 constant:0.0];
    
    NSLayoutConstraint *widthConstraint = [NSLayoutConstraint constraintWithItem:self.leftViewContainer attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual
                                                                          toItem:self.centerViewContainer attribute:NSLayoutAttributeWidth multiplier:1.0 constant:0.0];
    
    NSLayoutConstraint *trailingConstraint = [NSLayoutConstraint constraintWithItem:self.leftViewContainer attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual
                                                                             toItem:self.centerViewContainer attribute:NSLayoutAttributeLeading multiplier:1.0 constant:0.0];
    
    [self addConstraint:heightConstraint];
    [self addConstraint:widthConstraint];
    [self addConstraint:trailingConstraint];
    
    self.leftViewContainerWidthConstraint = widthConstraint;
    self.leftViewContainerRevealWidth  = kJVDefaultViewContainerWidth;
}

- (void)setupRightViewContainer {
    _rightViewContainer = [[UIView alloc] init];
    [self.rightViewContainer setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self addSubview:self.rightViewContainer];
    
    NSLayoutConstraint *heightConstraint = [NSLayoutConstraint constraintWithItem:self.rightViewContainer attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual
                                                                           toItem:self.centerViewContainer attribute:NSLayoutAttributeHeight multiplier:1.0 constant:0.0];
    
    NSLayoutConstraint *widthConstraint = [NSLayoutConstraint constraintWithItem:self.rightViewContainer attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual
                                                                          toItem:self.centerViewContainer attribute:NSLayoutAttributeWidth multiplier:1.0 constant:0.0];
    
    NSLayoutConstraint *leadingConstraint = [NSLayoutConstraint constraintWithItem:self.rightViewContainer attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual
                                                                            toItem:self.centerViewContainer attribute:NSLayoutAttributeTrailing multiplier:1.0 constant:0.0];
    
    [self addConstraint:heightConstraint];
    [self addConstraint:widthConstraint];
    [self addConstraint:leadingConstraint];
    
    self.rightViewContainerWidthConstraint = widthConstraint;
    self.rightViewContainerRevealWidth = kJVDefaultViewContainerWidth;
}

- (void)setupCenterViewContainer {
    _centerViewContainer = [[UIView alloc] init];
    [self.centerViewContainer setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self addSubview:self.centerViewContainer];
    
    NSArray *constraints = @[
        [NSLayoutConstraint constraintWithItem:self.centerViewContainer attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual
                                        toItem:self attribute:NSLayoutAttributeLeading multiplier:1.0 constant:0.0],
                             
        [NSLayoutConstraint constraintWithItem:self.centerViewContainer attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual
                                        toItem:self attribute:NSLayoutAttributeTrailing multiplier:1.0 constant:0.0],
                             
        [NSLayoutConstraint constraintWithItem:self.centerViewContainer attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual
                                        toItem:self attribute:NSLayoutAttributeTop multiplier:1.0 constant:0.0],
                             
        [NSLayoutConstraint constraintWithItem:self.centerViewContainer attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual
                                        toItem:self attribute:NSLayoutAttributeBottom multiplier:1.0 constant:0.0],
    ];
    
    [self addConstraints:constraints];
}

#pragma mark - Reveal Widths

- (void)setLeftViewContainerRevealWidth:(CGFloat)leftViewContainerRevealWidth {
    self.leftViewContainerWidthConstraint.constant = leftViewContainerRevealWidth;
}

- (void)setRightViewContainerRevealWidth:(CGFloat)rightViewContainerRevealWidth {
    self.rightViewContainerWidthConstraint.constant = rightViewContainerRevealWidth;
}

- (CGFloat)leftViewContainerRevealWidth {
    return self.leftViewContainerWidthConstraint.constant;
}

- (CGFloat)rightViewContainerRevealWidth {
    return self.rightViewContainerWidthConstraint.constant;
}

#pragma mark - Layout

//+ (BOOL)requiresConstraintBasedLayout {
//    return YES;
//}
//
//- (void)layoutSubviews {
//    [super layoutSubviews];
//}

@end
