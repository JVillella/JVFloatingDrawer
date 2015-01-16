//
//  AppDelegate.m
//  JVFloatingDrawer
//
//  Created by Julian Villella on 2015-01-11.
//  Copyright (c) 2015 JVillella. All rights reserved.
//

#import "AppDelegate.h"
#import "JVFloatingDrawerViewController.h"
#import "JVFloatingDrawerSpringAnimator.h"

static NSString * const kJVDrawersStoryboardName = @"Drawers";

static NSString * const kJVLeftDrawerStoryboardID = @"JVLeftDrawerViewControllerStoryboardID";
static NSString * const kJVRightDrawerStoryboardID = @"JVRightDrawerViewControllerStoryboardID";

static NSString * const kJVGitHubProjectPageViewControllerStoryboardID = @"JVGitHubProjectPageViewControllerStoryboardID";
static NSString * const kJVDrawerSettingsViewControllerStoryboardID = @"JVDrawerSettingsViewControllerStoryboardID";

@interface AppDelegate ()

@property (nonatomic, strong, readonly) UIStoryboard *drawersStoryboard;

@end

@implementation AppDelegate

@synthesize drawersStoryboard = _drawersStoryboard;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.rootViewController = self.drawerViewController;
    [self configureDrawerViewController];
    
    [self.window makeKeyAndVisible];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {}

- (void)applicationDidEnterBackground:(UIApplication *)application {}

- (void)applicationWillEnterForeground:(UIApplication *)application {}

- (void)applicationDidBecomeActive:(UIApplication *)application {}

- (void)applicationWillTerminate:(UIApplication *)application {}

#pragma mark - Drawer View Controllers

- (JVFloatingDrawerViewController *)drawerViewController {
    if (!_drawerViewController) {
        _drawerViewController = [[JVFloatingDrawerViewController alloc] init];
    }
    
    return _drawerViewController;
}

#pragma mark Sides

- (UITableViewController *)leftDrawerViewController {
    if (!_leftDrawerViewController) {
        _leftDrawerViewController = [self.drawersStoryboard instantiateViewControllerWithIdentifier:kJVLeftDrawerStoryboardID];
    }
    
    return _leftDrawerViewController;
}

- (UITableViewController *)rightDrawerViewController {
    if (!_rightDrawerViewController) {
        _rightDrawerViewController = [self.drawersStoryboard instantiateViewControllerWithIdentifier:kJVRightDrawerStoryboardID];
    }
    
    return _rightDrawerViewController;
}

#pragma mark Center

- (UIViewController *)githubViewController {
    if (!_githubViewController) {
        _githubViewController = [self.drawersStoryboard instantiateViewControllerWithIdentifier:kJVGitHubProjectPageViewControllerStoryboardID];
    }
    
    return _githubViewController;
}

- (UIViewController *)drawerSettingsViewController {
    if (!_drawerSettingsViewController) {
        _drawerSettingsViewController = [self.drawersStoryboard instantiateViewControllerWithIdentifier:kJVDrawerSettingsViewControllerStoryboardID];
    }
    
    return _drawerSettingsViewController;
}

- (id<JVFloatingDrawerAnimation>)drawerAnimator {
    if (!_drawerAnimator) {
        _drawerAnimator = [[JVFloatingDrawerSpringAnimator alloc] init];
    }
    
    return _drawerAnimator;
}

- (UIStoryboard *)drawersStoryboard {
    if(!_drawersStoryboard) {
        _drawersStoryboard = [UIStoryboard storyboardWithName:kJVDrawersStoryboardName bundle:nil];
    }
    
    return _drawersStoryboard;
}

- (void)configureDrawerViewController {
    self.drawerViewController.leftViewController = self.leftDrawerViewController;
    self.drawerViewController.rightViewController = self.rightDrawerViewController;
    self.drawerViewController.centerViewController = self.drawerSettingsViewController;
    
    self.drawerViewController.animator = self.drawerAnimator;
    
    self.drawerViewController.backgroundImage = [UIImage imageNamed:@"sky"];
}

#pragma mark - Global Access Helper

+ (AppDelegate *)globalDelegate {
    return (AppDelegate *)[UIApplication sharedApplication].delegate;
}

- (void)toggleLeftDrawer:(id)sender animated:(BOOL)animated {
    [self.drawerViewController toggleDrawerWithSide:JVFloatingDrawerSideLeft animated:animated completion:nil];
}

- (void)toggleRightDrawer:(id)sender animated:(BOOL)animated {
    [self.drawerViewController toggleDrawerWithSide:JVFloatingDrawerSideRight animated:animated completion:nil];
}

@end
