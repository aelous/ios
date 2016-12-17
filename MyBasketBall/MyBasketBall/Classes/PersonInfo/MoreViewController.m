//
//  MoreViewController.m
//  MyBasketBall
//
//  Created by lw on 16/12/11.
//  Copyright © 2016年 lizhe. All rights reserved.
//

#import "MoreViewController.h"
#import "MoreTableCell.h"

@interface MoreViewController ()

@property (nonatomic, strong) NSArray *titleArray;

@end

@implementation MoreViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self prepareUI];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareUI {

    self.title = @"更多";
    [self setCustomRightBarButtonItem];
    [self setCustomLeftBarButtonItem];
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCR_W, SCR_H-64) style:UITableViewStylePlain];
    self.tableView.backgroundColor = [UIColor whiteColor];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.tableView.rowHeight = 40;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:self.tableView];
    self.titleArray = [NSArray arrayWithObjects:@"球队",@"球员",@"联赛",@"排行", nil];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.titleArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    MoreTableCell *cell = [MoreTableCell cellWithTableView:tableView];
    cell.title = self.titleArray[indexPath.row];
    return cell;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
