//
//  JVDrawerSettingsTableViewController.m
//  JVFloatingDrawer
//
//  Created by Julian Villella on 2015-01-15.
//  Copyright (c) 2015 JVillella. All rights reserved.
//

#import "JVDrawerSettingsTableViewController.h"
#import "JVFloatingDrawerSpringAnimator.h"
#import "AppDelegate.h"

@interface JVDrawerSettingsTableViewController ()

@property (nonatomic, strong, readonly) JVFloatingDrawerSpringAnimator *drawerAnimator;

#pragma mark Labels

@property (weak, nonatomic) IBOutlet UILabel *animationDurationLabel;
@property (weak, nonatomic) IBOutlet UILabel *animationDelayLabel;
@property (weak, nonatomic) IBOutlet UILabel *initialSpringVelocityLabel;
@property (weak, nonatomic) IBOutlet UILabel *springDampingLabel;

#pragma mark Sliders

@property (weak, nonatomic) IBOutlet UISlider *animationDurationSlider;
@property (weak, nonatomic) IBOutlet UISlider *animationDelaySlider;
@property (weak, nonatomic) IBOutlet UISlider *initialSpringVelocitySlider;
@property (weak, nonatomic) IBOutlet UISlider *springDampingSlider;

@end

@implementation JVDrawerSettingsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self configureSliders];
}

- (void)configureSliders {
    self.animationDurationSlider.value     = self.drawerAnimator.animationDuration;
    self.animationDelaySlider.value        = self.drawerAnimator.animationDelay;
    self.initialSpringVelocitySlider.value = self.drawerAnimator.initialSpringVelocity;
    self.springDampingSlider.value         = self.drawerAnimator.springDamping;
    
    [self actionAnimationDurationValueChanged:    self.animationDurationSlider];
    [self actionAnimationDelayValueChanged:       self.animationDelaySlider];
    [self actionInitialSpringVelocityValueChanged:self.initialSpringVelocitySlider];
    [self actionSpringDampingValueChanged:        self.springDampingSlider];
}

#pragma mark - Actions

- (IBAction)actionToggleLeftDrawer:(id)sender {
    [[AppDelegate globalDelegate] toggleLeftDrawer:self animated:YES];
}

- (IBAction)actionToggleRightDrawer:(id)sender {
    [[AppDelegate globalDelegate] toggleRightDrawer:self animated:YES];
}

#pragma mark Sliders

- (IBAction)actionAnimationDurationValueChanged:(UISlider *)slider {
    self.animationDurationLabel.text = [NSString stringWithFormat:@"%.02f", slider.value];
    self.drawerAnimator.animationDuration = slider.value;
}

- (IBAction)actionAnimationDelayValueChanged:(UISlider *)slider {
    self.animationDelayLabel.text = [NSString stringWithFormat:@"%.02f", slider.value];
    self.drawerAnimator.animationDelay = slider.value;
}

- (IBAction)actionInitialSpringVelocityValueChanged:(UISlider *)slider {
    self.initialSpringVelocityLabel.text = [NSString stringWithFormat:@"%.02f", slider.value];
    self.drawerAnimator.initialSpringVelocity = slider.value;
}

- (IBAction)actionSpringDampingValueChanged:(UISlider *)slider {
    self.springDampingLabel.text = [NSString stringWithFormat:@"%.02f", slider.value];
    self.drawerAnimator.springDamping = slider.value;
}

#pragma mark - Helpers

- (JVFloatingDrawerSpringAnimator *)drawerAnimator {
    return [[AppDelegate globalDelegate] drawerAnimator];
}

#pragma mark - Memory

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
