//
//  JVCenterViewController.m
//  JVFloatingDrawer
//
//  Created by Julian Villella on 2015-01-11.
//  Copyright (c) 2015 JVillella. All rights reserved.
//

#import "JVCenterViewController.h"

static NSString * const kJVGithubProjectPage = @"https://github.com/JVillella/JVFloatingDrawer";

@interface JVCenterViewController ()

@property (weak, nonatomic) IBOutlet UIWebView *webview;

@end

@implementation JVCenterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadWebpage];
}

- (void)loadWebpage {
    NSURL *webpageURL = [NSURL URLWithString:kJVGithubProjectPage];
    NSURLRequest *webpageRequest = [NSURLRequest requestWithURL:webpageURL];
    [self.webview loadRequest:webpageRequest];
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

@end
