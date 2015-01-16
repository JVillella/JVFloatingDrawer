//
//  JVLeftDrawerTableViewController.m
//  JVFloatingDrawer
//
//  Created by Julian Villella on 2015-01-15.
//  Copyright (c) 2015 JVillella. All rights reserved.
//

#import "JVLeftDrawerTableViewController.h"
#import "JVLeftDrawerTableViewCell.h"
#import "AppDelegate.h"
#import "JVFloatingDrawerViewController.h"

enum {
    kJVDrawerSettingsIndex    = 0,
    kJVGitHubProjectPageIndex = 1
};

static const CGFloat kJVTableViewTopInset = 80.0;
static NSString * const kJVDrawerCellReuseIdentifier = @"JVDrawerCellReuseIdentifier";

@interface JVLeftDrawerTableViewController ()

@end

@implementation JVLeftDrawerTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.backgroundColor = [UIColor clearColor];
    self.tableView.contentInset = UIEdgeInsetsMake(kJVTableViewTopInset, 0.0, 0.0, 0.0);
    self.clearsSelectionOnViewWillAppear = NO;
    
    [self.tableView selectRowAtIndexPath:[NSIndexPath indexPathForItem:kJVDrawerSettingsIndex inSection:0] animated:NO scrollPosition:UITableViewScrollPositionNone];
}

#pragma mark - Table View Data Source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    JVLeftDrawerTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kJVDrawerCellReuseIdentifier forIndexPath:indexPath];
    
    if(indexPath.row == kJVDrawerSettingsIndex) {
        cell.titleText = @"Drawer Settings";
        cell.iconImage = [UIImage imageNamed:@"665-gear"];
        
    } else {
        cell.titleText = @"GitHub Page";
        cell.iconImage = [UIImage imageNamed:@"488-github"];
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    UIViewController *destinationViewController = nil;

    if(indexPath.row == kJVDrawerSettingsIndex) {
        destinationViewController = [[AppDelegate globalDelegate] drawerSettingsViewController];
    } else {
        destinationViewController = [[AppDelegate globalDelegate] githubViewController];
    }
    
    [[[AppDelegate globalDelegate] drawerViewController] setCenterViewController:destinationViewController];
    [[AppDelegate globalDelegate] toggleLeftDrawer:self animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
