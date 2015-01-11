//
//  JVFloatingDrawerAnimator.m
//  JVFloatingDrawer
//
//  Created by Julian Villella on 2015-01-11.
//  Copyright (c) 2015 JVillella. All rights reserved.
//

#import "JVFloatingDrawerSpringAnimator.h"

@implementation JVFloatingDrawerSpringAnimator

- (NSTimeInterval)animationDurationForFloatingDrawer:(JVFloatingDrawerViewController *)drawer {
    return self.animationDuration;
}

- (void)presentationAnimationWithSide:(JVFloatingDrawerSide)drawerSide
                   sideViewController:(UIViewController *)sideViewController
                 centerViewController:(UIViewController *)centerViewController {

}

- (void)dismissAnimationWithSide:(JVFloatingDrawerSide)drawerSide
              sideViewController:(UIViewController *)sideViewController
            centerViewController:(UIViewController *)centerViewController {
    
}

@end
