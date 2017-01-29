//
//  TeamMessageController.m
//  Basketball
//
//  Created by lw on 16/11/24.
//  Copyright © 2016年 basketball. All rights reserved.
//

#import "TeamMessageController.h"
#import "TeamHeaderView.h"
#import "TeamStatusCell.h"
#import "TeamMemberCell.h"
#import "TeamGloryCell.h"
#import "MemberDataCell.h"
#import "UILabel+Custom.h"
#import "TableData.h"

#import "GetTeamInfoHeadThread.h"
#import "GetTeamInfoFollowThread.h"
#import "GetTeamInfoDynamicThread.h"
#import "GetTeamInfoStatisticThread.h"

#import "UserInfoBattleModel.h"

typedef NS_ENUM(NSInteger, SelectedType) {
    TYPE_STATUS = 0,
    TYPE_DATA = 1,
    TYPE_MEMBER = 2,
    TYPE_GLORY = 3,
};

@interface TeamMessageController ()<TeamHeaderViewButtonSelectedDelegate>

@property (nonatomic, strong) TeamHeaderView *headerView;
@property (nonatomic, assign) int selectedType;
@property (nonatomic, strong) NSMutableArray *data;
@property (nonatomic, assign) int testHeight;

@property (nonatomic, strong) NSMutableArray *dynamicArray;

@end

@implementation TeamMessageController

#pragma mark - lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    [self prepareUI];
    [self requestHeaderData];
}

#pragma mark - UI

- (void)prepareUI {
    
    self.title = @"球队信息";
    CGFloat width = self.view.bounds.size.width;
    CGFloat height = self.view.bounds.size.height;
    self.headerView = [[TeamHeaderView alloc] initWithFrame:CGRectMake(0, 0, width, 200)];
    self.headerView.delegate = self;
    __weak typeof(self)weakSelf = self;
    self.headerView.followBlock = ^{
        GetTeamInfoFollowThread *follow = [[GetTeamInfoFollowThread alloc] initWithUserId:[AppDelegate instance].userModel.userId teamId:[AppDelegate instance].userModel.teamId];
        [follow requireonPrev:^{
        } success:^(NSString *str) {
            [weakSelf showToast:@"关注状态修改成功"];
        } unavaliableNetwork:^{
        } timeout:^{
        } exception:^(NSString *message) {
        }];
        
    };
    [self.view addSubview:self.headerView];
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.headerView.frame), width, height - 200 - 64)];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.backgroundColor = [UIColor whiteColor];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    
    self.selectedType = TYPE_STATUS;
    self.testHeight = 230;
}

- (void)prepareLeftItem {

    UIBarButtonItem *left = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"back"] style:UIBarButtonItemStylePlain target:self action:@selector(leftClick)];
    self.navigationItem.leftBarButtonItem = left;
}

- (void)leftClick {
    if (self.leftItemBlock) {
        self.leftItemBlock();
    } else {
        [self.navigationController popViewControllerAnimated:YES];
    }
}

- (void)headerViewButtonSelectedAtIndex:(int)index {

    self.selectedType = index;
    [self.tableView reloadData];
    
}

#pragma mark - request data 

- (void)requestHeaderData {

    GetTeamInfoHeadThread *headThread = [[GetTeamInfoHeadThread alloc] initWithUserId:[AppDelegate instance].userModel.userId teamId:[AppDelegate instance].userModel.teamId];
    [headThread requireonPrev:^{
    } success:^(NSDictionary *dic) {
        TeamHeaderModel *model = [[TeamHeaderModel alloc] initWithDict:dic];
        self.headerView.headerModel = model;
    } unavaliableNetwork:^{
    } timeout:^{
    } exception:^(NSString *message) {
    }];
    
}

- (void)requestDynamicData {
    GetTeamInfoDynamicThread *dynamic = [[GetTeamInfoDynamicThread alloc] initWithTeamId:[AppDelegate instance].userModel.teamId];
    [dynamic requireonPrev:^{
    } success:^(NSArray *dic) {
        
        
        
        
    } unavaliableNetwork:^{
    } timeout:^{
    } exception:^(NSString *message) {
    }];

}

#pragma mark - tableview delegate and datasource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    int random = 3;
    switch (self.selectedType) {
        case TYPE_STATUS: {
            return random;
        }
            break;
        case TYPE_DATA: {
            return random;
        }
            break;
        default:
            return 1;
            break;
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    TableData *data = [self.data objectAtIndex:section];
    switch (self.selectedType) {
        case TYPE_STATUS: {
            return 2;
        }
            break;
        case TYPE_DATA: {
            return data.isShow ? 1 : 0;
        }
            break;
        default:
            return 4;
            break;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    switch (self.selectedType) {
        case TYPE_STATUS: {
            TeamStatusCell *cell = [TeamStatusCell cellWithTableView:tableView];
            return cell;
        }
            break;
        case TYPE_DATA: {
            MemberDataCell *cell = [MemberDataCell cellWithTabelView:tableView];
            cell.blockData = ^{
                self.testHeight = 350;
                [self.tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];
            };
            return cell;
        }
            break;
        case TYPE_MEMBER: {
            TeamMemberCell *cell = [TeamMemberCell cellWithTableView:tableView];
            return cell;
        }
            break;
        case TYPE_GLORY: {
            TeamGloryCell *cell = [TeamGloryCell cellWithTableView:tableView];
            return cell;
        }
            break;
        default:
            return nil;
            break;
    }

}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    switch (self.selectedType) {
        case TYPE_STATUS: {
            return 90;
        }
            break;
        case TYPE_DATA: {
            return 377;
        }
            break;
        case TYPE_MEMBER: {
            return 26;
        }
            break;
        case TYPE_GLORY: {
            return 43;
        }
            break;
        default:
            return 0;
            break;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    switch (self.selectedType) {
        case TYPE_STATUS:
            return 22;
            break;
        case TYPE_DATA:
            return 17;
            break;
        case TYPE_MEMBER:
            return 24;
            break;
        default:
            return 0;
            break;
    }
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    return [self prepareHeaderView:(int)section];
}

- (UIView *)prepareHeaderView:(int)section {
    CGFloat width = self.view.bounds.size.width;
    switch (self.selectedType) {
        case TYPE_STATUS: {
            UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, width, 22)];
            view.backgroundColor = [UIColor ms_colorWithHexString:@"#EFEFEF"];
            UILabel *title = [UILabel labelWithTitle:@"昨天 11月 5日 周三" size:15.0 colorString:@"#000000"];
            title.center = view.center;
            [view addSubview:title];
            return view;
        }
            break;
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
        case TYPE_MEMBER: {
            UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, width, 24)];
            view.backgroundColor = [UIColor whiteColor];
            NSArray *title = [NSArray arrayWithObjects:@"号码",@"名字",@"位置",@"场均", nil];
            float titleWidth = width / 4.0;
            for (int i=0; i<4; i++) {
                UILabel *label = [UILabel labelWithTitle:title[i] size:8.7 colorString:@"#8B8B8B"];
                label.frame = CGRectMake(i * titleWidth + 7, 8, titleWidth - 4, 8);
                [view addSubview:label];
                UIView *separate = [[UIView alloc] initWithFrame:CGRectMake(0, 23, width, 1)];
                separate.backgroundColor = [UIColor ms_colorWithHexString:@"#D8D8D8"];
                [view addSubview:separate];
            }
            return view;
        }
            break;
        default:
            return nil;
            break;
    }
}

- (void)headerClick:(UITapGestureRecognizer *)tap {
    
    UIView *view = tap.view;
    TableData *data = [self.data objectAtIndex:view.tag];
    data.isShow = !data.isShow;
    [self.tableView reloadSections:[NSIndexSet indexSetWithIndex:view.tag] withRowAnimation:UITableViewRowAnimationFade];
    
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
