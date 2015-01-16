//
//  JVFloatingDrawerAnimation.h
//  JVFloatingDrawer
//
//  Created by Julian Villella on 2015-01-11.
//  Copyright (c) 2015 JVillella. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JVFloatingDrawerViewController.h"

@protocol JVFloatingDrawerAnimation <NSObject>

/**
 *  Implementations should present the side view.
 *
 *  @param drawerSide The side of the drawer to be presented
 *  @param sideView   The view of the side of the drawer to be presented
 *  @param centerView The center view
 *  @param animated   An animated flag indicating if the caller wants this presentation to be animated
 *  @param completion A completion block to be called when the presentation is finished
 */
- (void)presentationWithSide:(JVFloatingDrawerSide)drawerSide sideView:(UIView *)sideView
                  centerView:(UIView *)centerView animated:(BOOL)animated completion:(void(^)(BOOL finished))completion;


/**
 *  Implementations should dismiss the open side view.
 *
 *  @param drawerSide The side of the drawer to be dismissed
 *  @param sideView   The view of the side of the drawer to be dismissed
 *  @param centerView The center view
 *  @param animated   An animated flag indicating if the caller wants this dismissal to be animated
 *  @param completion A completion block to be called when the presentation is finished
 */
- (void)dismissWithSide:(JVFloatingDrawerSide)drawerSide sideView:(UIView *)sideView
             centerView:(UIView *)centerView animated:(BOOL)animated completion:(void(^)(BOOL finished))completion;

@optional
/**
 *  Invoked before a rotation begins with the drawer open. Implementations should
 *  do whatever drawer handling is necessary to maintain the drawer's appearance.
 *
 *  @param drawerSide The open side of the drawer
 *  @param sideView   The containing side view that is open
 *  @param centerView The containing center view
 */
- (void)willRotateOpenDrawerWithOpenSide:(JVFloatingDrawerSide)drawerSide sideView:(UIView *)sideView centerView:(UIView *)centerView;

/**
 *  Invoked after a rotation is finished with the drawer open. Implementations should
 *  do whatever drawer handling is necessary to maintain the drawer's appearance.
 *
 *  @param drawerSide The open side of the drawer
 *  @param sideView   The containing side view that is open
 *  @param centerView The containing center view
 */
- (void)didRotateOpenDrawerWithOpenSide:(JVFloatingDrawerSide)drawerSide sideView:(UIView *)sideView centerView:(UIView *)centerView;

@end


