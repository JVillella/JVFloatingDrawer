//
//  AppDelegate.h
//  JVFloatingDrawer
//
//  Created by Julian Villella on 2015-01-11.
//  Copyright (c) 2015 JVillella. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

+ (AppDelegate *)globalDelegate;

- (void)toggleLeftDrawer:(id)sender;
- (void)toggleRightDrawer:(id)sender;

@end

