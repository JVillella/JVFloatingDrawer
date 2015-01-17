//
//  JVCenterViewController.m
//  JVFloatingDrawer
//
//  Created by Julian Villella on 2015-01-11.
//  Copyright (c) 2015 JVillella. All rights reserved.
//

#import "JVGitHubViewController.h"
#import "AppDelegate.h"

static NSString * const kJVGithubProjectPage = @"http://github.com/JVillella/JVFloatingDrawer";

@interface JVGitHubViewController ()

@property (weak, nonatomic) IBOutlet UIWebView *webview;

@end

@implementation JVGitHubViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadWebpage];
}

- (void)loadWebpage {
    NSURL *webpageURL = [NSURL URLWithString:kJVGithubProjectPage];
    NSURLRequest *webpageRequest = [NSURLRequest requestWithURL:webpageURL];
    [self.webview loadRequest:webpageRequest];
}

#pragma mark - Actions

- (IBAction)actionToggleLeftDrawer:(id)sender {
    [[AppDelegate globalDelegate] toggleLeftDrawer:self animated:YES];
}

- (IBAction)actionToggleRightDrawer:(id)sender {
    [[AppDelegate globalDelegate] toggleRightDrawer:self animated:YES];
}

@end
