//
//  TeamMemberViewController.m
//  Basketball
//
//  Created by lw on 16/11/24.
//  Copyright © 2016年 basketball. All rights reserved.
//

#import "MineViewController.h"
#import "MemberHeaderView.h"
#import "TableData.h"
#import "MemberDataCell.h"
#import "MemberBattleCell.h"
#import "MemberJoinCell.h"
#import "UIColor+StringColor.h"

typedef NS_ENUM(NSInteger, SelectedType) {
    TYPE_DATA = 0,
    TYPE_BATTLE = 1,
    TYPE_JOIN = 2,
    TYPE_MANAGE = 3,
};

@interface MineViewController ()<MemberHeaderViewButtonSelectedDelegate>

@property (nonatomic, assign) int selectedType;

@property (nonatomic, strong) NSMutableArray *data;

@property (nonatomic, assign) int testHeight;

@end

@implementation MineViewController

#pragma mark - lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUI];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UI

- (void)setupUI {
    self.view.backgroundColor = [UIColor ms_colorWithHexString:@"#224FA2"];
    self.navigationController.navigationBar.translucent = YES;
    UIImage *image = [[UIImage alloc] init];
    [self.navigationController.navigationBar setBackgroundImage:image forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.shadowImage = image;
    
    CGFloat width = self.view.bounds.size.width;
    CGFloat height = self.view.bounds.size.height;
    MemberHeaderView *headerView = [[MemberHeaderView alloc] initWithFrame:CGRectMake(0, 20, self.view.bounds.size.width, 186)];
    headerView.delegate = self;
    [self.view addSubview:headerView];
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(headerView.frame), width, height - 186 - 20)];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.backgroundColor = [UIColor whiteColor];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    [self.view addSubview:self.tableView];
    
    self.selectedType = TYPE_DATA;
    self.testHeight = 230;
}

- (void)headerViewButtonSelectedAtIndex:(int)index {

    self.selectedType = index;
    [self.tableView reloadData];

}

- (void)handleHeaderSelectedTypeClick {

    
    
}

#pragma mark - tableview datasource and delegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    int random = 3;
    switch (self.selectedType) {
        case TYPE_DATA:
            return random;
            break;
        case TYPE_BATTLE:
            return 1;
            break;
        default:
            return 2;
            break;
    }
    
    //return model.count
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    int random = 2;
    TableData *data = [self.data objectAtIndex:section];
    switch (self.selectedType) {
        case TYPE_DATA: {
            return data.isShow ? 1 : 0;
        }
            break;
        case TYPE_BATTLE:
            return random;
            break;
        case TYPE_JOIN:
            return random;
            break;
        case TYPE_MANAGE:
            return random;
            break;
        default:
            return 0;
            break;
    }
    
//    model = [modelArray objectAtIndex:section]
//    return model.array.count
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    switch (self.selectedType) {
        case TYPE_DATA: {
            MemberDataCell *cell = [MemberDataCell cellWithTabelView:tableView];
            cell.blockData = ^{
                self.testHeight = 350;
                [self.tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];
            };
            
            return cell;
        }
            break;
        case TYPE_BATTLE: {
            MemberBattleCell *cell = [MemberBattleCell cellWithTableView:tableView];
            return cell;
        }
            break;
        case TYPE_JOIN: {
            MemberJoinCell *cell = [MemberJoinCell cellWithTableView:tableView];
            return cell;
        }
            break;
        case TYPE_MANAGE: {
            MemberJoinCell *cell = [MemberJoinCell cellWithTableView:tableView];
            return cell;
        }
            break;
        default:
            return nil;
            break;
    }
    
//    if (!self.selectedType) {
//        
//        MemberDataCell *cell = [MemberDataCell cellWithTabelView:tableView];
//        return cell;
//        
//    } else {
//        
//        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
//        if (!cell) {
//            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
//        }
//        TableData *data = [self.data objectAtIndex:indexPath.section];
//        NSString *str = [data.dataArray objectAtIndex:indexPath.row];
//        cell.textLabel.text = str;
//        return cell;
//    }
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {

    switch (self.selectedType) {
        case TYPE_DATA:
            return 377;
            break;
        case TYPE_BATTLE:
            return 100;
            break;
        case TYPE_JOIN:
            return 50;
            break;
        case TYPE_MANAGE:
            return 50;
            break;
        default:
            return 0;
            break;
    }

}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {

    if (self.selectedType == TYPE_DATA) {
        return 17;
    } else if (self.selectedType == TYPE_BATTLE) {
        return 0;
    } else {
        return 26;
    }
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    return [self prepareHeaderView:(int)section];
}

- (void)headerClick:(UITapGestureRecognizer *)tap {
    
    UIView *view = tap.view;
    TableData *data = [self.data objectAtIndex:view.tag];
    data.isShow = !data.isShow;
    [self.tableView reloadSections:[NSIndexSet indexSetWithIndex:view.tag] withRowAnimation:UITableViewRowAnimationFade];

}

#pragma mark - private

- (UIView *)prepareHeaderView:(int)section {

    switch (self.selectedType) {
        case TYPE_DATA: {
            UIView *header = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 20)];
            header.backgroundColor = [UIColor colorWithRed:216/255.0 green:216/255.0 blue:216/255.0 alpha:1.0];
            header.tag = section;
            [header addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(headerClick:)]];
            
            UIImageView *icon = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"arrow"]];
            icon.center = CGPointMake(10, header.center.y);
            [header insertSubview:icon atIndex:0];
            TableData *data = [self.data objectAtIndex:section];
            if (data.isShow) {
                icon.transform = CGAffineTransformMakeRotation(M_PI_2);
            }
            
            UILabel *title = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetWidth(icon.frame) + 30, 0, 200, 20)];
            title.font = [UIFont systemFontOfSize:14.0];
            title.textColor = [UIColor darkGrayColor];
            title.text = @"2016赛季";
            [header insertSubview:title atIndex:1];
            return header;
        }
            break;
        case TYPE_JOIN: {
            UIView *header = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 20)];
            header.backgroundColor = [UIColor whiteColor];
            
            UILabel *title = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, 200, 20)];
            title.font = [UIFont systemFontOfSize:12.0];
            title.textColor = [UIColor darkGrayColor];
            if (section) {
                title.text = @"联赛";
            } else {
                title.text = @"球队";
            }
            [header addSubview:title];
            return header;
        }
            break;
        case TYPE_MANAGE: {
            UIView *header = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 20)];
            header.backgroundColor = [UIColor colorWithRed:216/255.0 green:216/255.0 blue:216/255.0 alpha:1.0];
            
            UILabel *title = [[UILabel alloc] initWithFrame:CGRectMake(10, 4, 200, 20)];
            title.font = [UIFont systemFontOfSize:12.0];
            title.textColor = [UIColor darkGrayColor];
            if (section) {
                title.text = @"我管理的联赛";
            } else {
                title.text = @"我管理的球队";
            }
            [header addSubview:title];
            return header;
        }
            break;
        default:
            return nil;
            break;
    }
}

- (NSMutableArray *)data {
    
    if (!_data) {
        _data = [[NSMutableArray alloc] init];
        for (int i = 0; i<3; i++) {
            TableData *value = [[TableData alloc] init];
            value.name = [NSString stringWithFormat:@"第%d个",i];
            value.isShow = false;
            [_data addObject:value];
        }
    }
    return _data;
}


@end
