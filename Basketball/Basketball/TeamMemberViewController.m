//
//  TeamMemberViewController.m
//  Basketball
//
//  Created by lw on 16/11/24.
//  Copyright © 2016年 basketball. All rights reserved.
//

#import "TeamMemberViewController.h"
#import "MemberHeaderView.h"

@interface TeamMemberViewController ()

@end

@implementation TeamMemberViewController

#pragma mark - lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    [self setupUI];
    [self prepareTableView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UI

- (void)setupUI {

    self.title = @"球员信息";
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    self.tableView.backgroundColor = [UIColor whiteColor];
    MemberHeaderView *headerView = [[MemberHeaderView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 100)];
    self.tableView.tableHeaderView = headerView;
    [self.view addSubview:self.tableView];
}

- (void)prepareTableView {

    [super prepareTableView];
    self.title = @"球员信息";
    self.tableView.backgroundColor = [UIColor whiteColor];
    MemberHeaderView *headerView = [[MemberHeaderView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 100)];
    self.tableView.tableHeaderView = headerView;
    
}



@end
