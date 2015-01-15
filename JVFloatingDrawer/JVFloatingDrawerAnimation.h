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

/**
 *  Implementations should animate the sideViewController into view.
 *
 *  @param sideView   The side view being presented
 *  @param centerView The center view to move out of the way
 */
- (void)presentationAnimationWithSide:(JVFloatingDrawerSide)drawerSide sideView:(UIView *)sideView
                           centerView:(UIView *)centerView completion:(void(^)(BOOL finished))completion;

/**
 *  Implementations should animate the sideViewController being dismissed.
 *
 *  @param sideView   The containing side view being dismissed
 *  @param centerView The containing center view the should be moved back into place
 */
- (void)dismissAnimationWithSide:(JVFloatingDrawerSide)drawerSide sideView:(UIView *)sideView
                      centerView:(UIView *)centerView completion:(void(^)(BOOL finished))completion;

/**
 *  Invoked before a rotation begins with the drawer open. Implementations should
 *  do whatever drawer handling is necessary to maintain the drawer's appearance.
 *
 *  @param drawerSide The open side of the drawer
 *  @param sideView   The containing side view that is open
 *  @param centerView The containing center view
 *  @param completion An optional completion block
 */
- (void)willRotateOpenDrawerWithOpenSide:(JVFloatingDrawerSide)drawerSide sideView:(UIView *)sideView
                              centerView:(UIView *)centerView completion:(void(^)(BOOL finished))completion;

/**
 *  Invoked after a rotation is finished with the drawer open. Implementations should
 *  do whatever drawer handling is necessary to maintain the drawer's appearance.
 *
 *  @param drawerSide The open side of the drawer
 *  @param sideView   The containing side view that is open
 *  @param centerView The containing center view
 *  @param completion An optional completion block
 */
- (void)didRotateOpenDrawerWithOpenSide:(JVFloatingDrawerSide)drawerSide sideView:(UIView *)sideView
                             centerView:(UIView *)centerView completion:(void(^)(BOOL finished))completion;

@end


