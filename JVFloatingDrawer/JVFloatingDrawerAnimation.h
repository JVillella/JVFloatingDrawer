//
//  JVFloatingDrawerAnimation.h
//  JVFloatingDrawer
//
//  Created by Julian Villella on 2015-01-11.
//  Copyright (c) 2015 JVillella. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JVFloatingDrawerViewController.h"

@class UIViewController;

@protocol JVFloatingDrawerAnimation <NSObject>

- (NSTimeInterval)animationDurationForFloatingDrawer:(JVFloatingDrawerViewController *)drawer;

/**
 *  Implementations should animate the sideViewController into view.
 *
 *  @param sideViewController   The view controller being presented
 *  @param centerViewController The view controller to move out of the way.
 */
- (void)presentationAnimationWithSide:(JVFloatingDrawerSide)drawerSide
                   sideViewController:(UIViewController *)sideViewController
                 centerViewController:(UIViewController *)centerViewController;

/**
 *  Implementations should animate the sideViewController being dismissed.
 *
 *  @param sideViewController   The view controller being dismissed
 *  @param centerViewController The view controller the should be moved back into place
 */
- (void)dismissAnimationWithSide:(JVFloatingDrawerSide)drawerSide
              sideViewController:(UIViewController *)sideViewController
            centerViewController:(UIViewController *)centerViewController;

@end


