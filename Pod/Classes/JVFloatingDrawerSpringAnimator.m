//
//  JVFloatingDrawerAnimator.m
//  JVFloatingDrawer
//
//  Created by Julian Villella on 2015-01-11.
//  Copyright (c) 2015 JVillella. All rights reserved.
//

#import "JVFloatingDrawerSpringAnimator.h"

static const CGFloat kJVCenterViewDestinationScale = 0.7;

@implementation JVFloatingDrawerSpringAnimator

#pragma mark - Initialization

- (instancetype)init {
    self = [super init];
    if(self) {
        [self setup];
    }
    return self;
}

- (void)setup {
    // Defaults
    self.animationDelay = 0.0;
    self.animationDuration = 0.7;
    self.initialSpringVelocity = 9.0;
    self.springDamping = 0.8;
}

#pragma mark - Animator Implementations

#pragma mark Presentation/Dismissal
    
- (void)presentationWithSide:(JVFloatingDrawerSide)drawerSide sideView:(UIView *)sideView centerView:(UIView *)centerView animated:(BOOL)animated completion:(void (^)(BOOL))completion {
    void (^springAnimation)() = ^{
        [self applyTransformsWithSide:drawerSide sideView:sideView centerView:centerView];
    };
    
    if (animated) {
        [UIView animateWithDuration:self.animationDuration
                              delay:self.animationDelay
             usingSpringWithDamping:self.springDamping
              initialSpringVelocity:self.initialSpringVelocity
                            options:UIViewAnimationOptionCurveLinear
                         animations:springAnimation
                         completion:nil];
    } else {
        springAnimation(); // Call spring animation block without animating
    }
}

- (void)dismissWithSide:(JVFloatingDrawerSide)drawerSide sideView:(UIView *)sideView centerView:(UIView *)centerView animated:(BOOL)animated completion:(void (^)(BOOL))completion {
    void (^springAnimation)() = ^{
        [self removeTransformsWithSide:drawerSide sideView:sideView centerView:centerView];
    };
    
    if (animated) {
        [UIView animateWithDuration:self.animationDuration
                              delay:self.animationDelay
             usingSpringWithDamping:self.springDamping
              initialSpringVelocity:self.initialSpringVelocity
                            options:UIViewAnimationOptionCurveLinear
                         animations:springAnimation completion:completion];
    } else {
        springAnimation(); // Call spring animation block without animating
    }
}

#pragma mark Orientation

- (void)willRotateOpenDrawerWithOpenSide:(JVFloatingDrawerSide)drawerSide sideView:(UIView *)sideView centerView:(UIView *)centerView {}

- (void)didRotateOpenDrawerWithOpenSide:(JVFloatingDrawerSide)drawerSide sideView:(UIView *)sideView centerView:(UIView *)centerView {
    void (^springAnimation)() = ^{
        [self applyTransformsWithSide:drawerSide sideView:sideView centerView:centerView];
    };
    
    [UIView animateWithDuration:self.animationDuration
                          delay:self.animationDelay
         usingSpringWithDamping:self.springDamping
          initialSpringVelocity:self.initialSpringVelocity
                        options:UIViewAnimationOptionCurveLinear
                     animations:springAnimation
                     completion:nil];
}

#pragma mark - Helpers

/**
 *  Move a view layer's anchor point and adjust the position so as to not move the layer. Be careful
 *  in using this. It has some side effects with orientation changes that need to be handled.
 *
 *  @param anchorPoint The anchor point being moved
 *  @param view        The view of who's anchor point is being moved
 */
- (void)setAnchorPoint:(CGPoint)anchorPoint forView:(UIView *)view {
    CGPoint newPoint = CGPointMake(view.bounds.size.width  * anchorPoint.x,
                                   view.bounds.size.height * anchorPoint.y);
    
    CGPoint oldPoint = CGPointMake(view.bounds.size.width  * view.layer.anchorPoint.x,
                                   view.bounds.size.height * view.layer.anchorPoint.y);
    
    newPoint = CGPointApplyAffineTransform(newPoint, view.transform);
    oldPoint = CGPointApplyAffineTransform(oldPoint, view.transform);
    
    CGPoint position = view.layer.position;
    
    position.x -= oldPoint.x;
    position.x += newPoint.x;
    
    position.y -= oldPoint.y;
    position.y += newPoint.y;
    
    view.layer.position = position;
    view.layer.anchorPoint = anchorPoint;
}

#pragma mark Transforms

- (void)applyTransformsWithSide:(JVFloatingDrawerSide)drawerSide sideView:(UIView *)sideView centerView:(UIView *)centerView {
    CGFloat direction = drawerSide == JVFloatingDrawerSideLeft ? 1.0 : -1.0;
    CGFloat sideWidth = sideView.bounds.size.width;
    CGFloat centerWidth = centerView.bounds.size.width;
    CGFloat centerViewHorizontalOffset = direction * sideWidth;
    CGFloat scaledCenterViewHorizontalOffset = direction * (sideWidth - (centerWidth - kJVCenterViewDestinationScale * centerWidth) / 2.0);
    
    CGAffineTransform sideTranslate = CGAffineTransformMakeTranslation(centerViewHorizontalOffset, 0.0);
    sideView.transform = sideTranslate;
    
    
    CGAffineTransform centerTranslate = CGAffineTransformMakeTranslation(scaledCenterViewHorizontalOffset, 0.0);
    CGAffineTransform centerScale = CGAffineTransformMakeScale(kJVCenterViewDestinationScale, kJVCenterViewDestinationScale);
    centerView.transform = CGAffineTransformConcat(centerScale, centerTranslate);
}

- (void)removeTransformsWithSide:(JVFloatingDrawerSide)drawerSide sideView:(UIView *)sideView centerView:(UIView *)centerView {
    sideView.transform = CGAffineTransformIdentity;
    centerView.transform = CGAffineTransformIdentity;
}

@end
