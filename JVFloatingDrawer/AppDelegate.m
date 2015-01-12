//
//  AppDelegate.m
//  JVFloatingDrawer
//
//  Created by Julian Villella on 2015-01-11.
//  Copyright (c) 2015 JVillella. All rights reserved.
//

#import "AppDelegate.h"
#import "JVFloatingDrawerViewController.h"

static NSString * const kJVDrawersStoryboardName = @"Drawers";

static NSString * const kJVLeftDrawerStoryboardID = @"JVLeftDrawerViewControllerStoryboardID";
static NSString * const kJVRightDrawerStoryboardID = @"JVRightDrawerViewControllerStoryboardID";
static NSString * const kJVCenterStoryboardID = @"JVCenterViewControllerStoryboardID";

@interface AppDelegate ()

@property (nonatomic, strong) JVFloatingDrawerViewController *drawerViewController;
@property (nonatomic, strong) UITableViewController *leftDrawerViewController;
@property (nonatomic, strong) UITableViewController *rightDrawerViewController;
@property (nonatomic, strong) UIViewController *centerViewController;

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

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

#pragma mark - Drawer View Controllers

- (JVFloatingDrawerViewController *)drawerViewController {
    if (!_drawerViewController) {
        _drawerViewController = [[JVFloatingDrawerViewController alloc] init];
    }
    
    return _drawerViewController;
}

- (UITableViewController *)leftDrawerViewController {
    if (!_leftDrawerViewController) {
        _leftDrawerViewController = [self.drawersStoryboard instantiateViewControllerWithIdentifier:kJVLeftDrawerStoryboardID];
    }
    
    return _leftDrawerViewController;
}

- (UITableViewController *)rightDrawerViewController {
    if(!_rightDrawerViewController) {
        _rightDrawerViewController = [self.drawersStoryboard instantiateViewControllerWithIdentifier:kJVRightDrawerStoryboardID];
    }
    
    return _rightDrawerViewController;
}

- (UIViewController *)centerViewController {
    if (!_centerViewController) {
        _centerViewController = [self.drawersStoryboard instantiateViewControllerWithIdentifier:kJVCenterStoryboardID];
    }
    
    return _centerViewController;
}

- (UIStoryboard *)drawersStoryboard {
    if(!_drawersStoryboard) {
        _drawersStoryboard = [UIStoryboard storyboardWithName:kJVDrawersStoryboardName bundle:nil];
    }
    
    return _drawersStoryboard;
}

- (void)configureDrawerViewController {
//    self.drawerViewController.leftViewController = self.leftDrawerViewController;
//    self.drawerViewController.rightViewController = self.rightDrawerViewController;
//    self.drawerViewController.centerViewController = self.centerViewController;
    
    self.drawerViewController.backgroundImage = [UIImage imageNamed:@"sky"];
}

@end
