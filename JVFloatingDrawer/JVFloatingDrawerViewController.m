//
//  JVFloatingDrawerViewController.m
//  JVFloatingDrawer
//
//  Created by Julian Villella on 2015-01-11.
//  Copyright (c) 2015 JVillella. All rights reserved.
//

#import "JVFloatingDrawerViewController.h"
#import "JVFloatingDrawerView.h"

@interface JVFloatingDrawerViewController ()

@property (nonatomic, strong, readonly) JVFloatingDrawerView *drawerView;

@end

@implementation JVFloatingDrawerViewController

#pragma mark - Initialization

- (instancetype)init {
    self = [super init];
    if(self) {
        [self setup];
    }
    return self;
}

- (void)setup {
    
}

#pragma mark - View Related

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)loadView {
    self.drawerView = [[JVFloatingDrawerView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.view = self.drawerView;
}

// Convenience type-wrapper around self.view. Maybe not the best idea?
- (void)setDrawerView:(JVFloatingDrawerView *)drawerView {
    self.view = drawerView;
}

- (JVFloatingDrawerView *)drawerView {
    return (JVFloatingDrawerView *)self.view;
}

#pragma mark - Interaction

- (void)openDrawerWithSide:(JVFloatingDrawerSide)drawerSide animated:(BOOL)animated
                completion:(void(^)(BOOL finished))completion {
}

- (void)closeDrawerWithSide:(JVFloatingDrawerSide)drawerSide animated:(BOOL)animated
                 completion:(void(^)(BOOL finished))completion {
    
}

- (void)toggleDrawerWithSide:(JVFloatingDrawerSide)drawerSide animated:(BOOL)animated
                  completion:(void(^)(BOOL finished))completion {
    
}

#pragma mark - Managed View Controllers

- (void)setLeftViewController:(UIViewController *)leftViewController {
    [self replaceViewController:self.leftViewController
             withViewController:leftViewController container:self.drawerView.leftViewContainer];
    
    _leftViewController = leftViewController;
}

- (void)setRightViewController:(UIViewController *)rightViewController {
    [self replaceViewController:self.rightViewController withViewController:rightViewController
                      container:self.drawerView.rightViewContainer];
    
    _rightViewController = rightViewController;
}

- (void)setCenterViewController:(UIViewController *)centerViewController {
    [self replaceViewController:self.centerViewController withViewController:centerViewController
                      container:self.drawerView.centerViewContainer];
    
    _centerViewController = centerViewController;
}

- (void)replaceViewController:(UIViewController *)sourceViewController withViewController:(UIViewController *)destinationViewController container:(UIView *)container {

    [sourceViewController willMoveToParentViewController:nil];
    [sourceViewController.view removeFromSuperview];
    [sourceViewController removeFromParentViewController];
    
    [self addChildViewController:destinationViewController];
    destinationViewController.view.frame = container.frame;
    [container addSubview:destinationViewController.view];
    [destinationViewController didMoveToParentViewController:self];
}

#pragma mark - Reveal Widths

- (void)setLeftDrawerRevealWidth:(CGFloat)leftDrawerRevealWidth {
    self.drawerView.leftViewContainerRevealWidth = leftDrawerRevealWidth;
}

- (void)setRightDrawerRevealWidth:(CGFloat)rightDrawerRevealWidth {
    self.drawerView.rightViewContainerRevealWidth = rightDrawerRevealWidth;
}

- (CGFloat)leftDrawerRevealWidth {
    return self.drawerView.leftViewContainerRevealWidth;
}

- (CGFloat)rightDrawerRevealWidth {
    return self.drawerView.rightViewContainerRevealWidth;
}

#pragma mark - Background Image

- (void)setBackgroundImage:(UIImage *)backgroundImage {
    self.drawerView.backgroundImageView.image = backgroundImage;
}

- (UIImage *)backgroundImage {
    return self.drawerView.backgroundImageView.image;
}

#pragma mark - Memory

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
