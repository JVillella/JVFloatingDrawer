//
//  JVFloatingDrawerAnimator.m
//  JVFloatingDrawer
//
//  Created by Julian Villella on 2015-01-11.
//  Copyright (c) 2015 JVillella. All rights reserved.
//

#import "JVFloatingDrawerSpringAnimator.h"

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
    self.animationDuration = 0.6;
    self.initialSpringVelocity = 3.0;
    self.springDamping = 2.0;
}
    
// TODO Split transformation math into methods. This is not clean code!
- (void)presentationAnimationWithSide:(JVFloatingDrawerSide)drawerSide sideView:(UIView *)sideView
                           centerView:(UIView *)centerView completion:(void (^)(BOOL))completion {
    
    [self setAnchorPoint:CGPointMake(drawerSide == JVFloatingDrawerSideLeft ? 0.0 : 1.0, 0.5) forView:centerView];

    void (^springAnimation)() = ^{
        CGFloat direction = drawerSide == JVFloatingDrawerSideLeft ? 1.0 : -1.0;
        CGFloat centerVCHorizontalOffset = direction * sideView.frame.size.width;
        
        CGAffineTransform translateTransform = CGAffineTransformMakeTranslation(centerVCHorizontalOffset, 0.0);
        
        sideView.transform = translateTransform;
        centerView.transform = CGAffineTransformScale(centerView.transform, 0.7, 0.7);
        centerView.transform = CGAffineTransformConcat(centerView.transform, translateTransform);
    };
    
    void (^animationCompletion)(BOOL finished) = ^(BOOL finished) {
        
    };
    
    [UIView animateWithDuration:self.animationDuration delay:self.animationDelay
         usingSpringWithDamping:self.springDamping initialSpringVelocity:self.initialSpringVelocity
                        options:UIViewAnimationOptionCurveEaseOut animations:springAnimation
                     completion:animationCompletion];
}

- (void)dismissAnimationWithSide:(JVFloatingDrawerSide)drawerSide sideView:(UIView *)sideView
                      centerView:(UIView *)centerView completion:(void (^)(BOOL))completion {
    void (^springAnimation)() = ^{
        sideView.transform = CGAffineTransformIdentity;
        centerView.transform = CGAffineTransformIdentity;
    };
    
    [UIView animateWithDuration:self.animationDuration delay:self.animationDelay
         usingSpringWithDamping:self.springDamping initialSpringVelocity:self.initialSpringVelocity
                        options:UIViewAnimationOptionCurveEaseOut animations:springAnimation
                     completion:completion];
}

#pragma mark - Helpers

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

@end
