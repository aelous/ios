//
//  PersonalViewController.m
//  MyBasketBall
//
//  Created by lee on 16/12/16.
//  Copyright © 2016年 lizhe. All rights reserved.
//

#import "MineViewController.h"
#import "MineInfoCell.h"
#import "SDAutoLayout.h"
#import "UIButton+Custom.h"

@interface MineViewController ()

@property (nonatomic, strong) NSArray *titleArray;
@property (nonatomic, strong) UIButton *save;

@end

@implementation MineViewController

#pragma mark - lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.titleArray = [NSArray arrayWithObjects:@[@"头像",@"名称",@"生日"]
                           ,@[@"性别",@"身高(cm)",@"体重(kg)",@"所在地"]
                           ,@[@"场上位置",@"球衣号",@"鞋码"], nil];
    
    [self prepareUI];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UI

- (void)prepareUI {

    self.title = @"个人信息";
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCR_W, SCR_H-64-40) style:UITableViewStyleGrouped];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.tableView.backgroundColor = [UIColor grayColor];
    self.tableView.rowHeight = 40;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.sectionFooterHeight = 0;
    self.tableView.tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, self.view.bounds.size.width, 0.01f)];
    [self.view addSubview:self.tableView];
    
    [self setSaveButton];
}

- (void)setSaveButton {

    UIButton *save = [UIButton colorButtonWithTitle:@"确认保存" fontSize:18 titleColor:@"#FFFFFF" backgroundColor:@"#f76672"];
    save.frame = CGRectMake(0, SCR_H-40, SCR_W, 40);
    [save addTarget:self action:@selector(savePersonalInfo) forControlEvents:UIControlEventTouchUpInside];
    self.save = save;
    [self.tableView addSubview:self.save];
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 5;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.titleArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    NSArray *titleArr = self.titleArray[section];
    return titleArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSArray *titleArr = self.titleArray[indexPath.section];
    if (indexPath.section == 0 && indexPath.row == 0) {
        UITableViewCell *cell = [self portraitCell];
        return cell;
        
    } else {
        MineInfoCell *cell = [MineInfoCell cellWithTableView:tableView];
        cell.title = titleArr[indexPath.row];
        return cell;
    }
}

- (UITableViewCell *)portraitCell {

    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"portrait"];
    
    UILabel *title = [UILabel labelWithTitle:@"头像" size:14 colorString:@"#000000"];
    [cell.contentView addSubview:title];
    
    UIImageView *portrait = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"touxiang"]];
    portrait.layer.cornerRadius = 12.5;
    portrait.layer.masksToBounds = YES;
    [cell.contentView addSubview:portrait];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.titleLabel.text = @"上传";
    button.titleLabel.textColor = [UIColor grayColor];
    button.backgroundColor = [UIColor redColor];
    [button addTarget:self action:@selector(upLoadPortrait) forControlEvents:UIControlEventTouchUpInside];
    [cell.contentView addSubview:button];
    
    UIView *line = [[UIView alloc] init];
    line.backgroundColor = [UIColor grayColor];
    [cell.contentView addSubview:line];
    
    title.sd_layout.centerYEqualToView(cell.contentView)
    .leftSpaceToView(cell.contentView, 20)
    .widthIs(80)
    .heightIs(20);
    
    button.sd_layout.centerYEqualToView(cell.contentView)
    .rightSpaceToView(cell.contentView, 20)
    .widthIs(40)
    .heightIs(20);
    
    portrait.sd_layout.centerYEqualToView(cell.contentView)
    .rightSpaceToView(button, 20)
    .heightIs(25)
    .widthIs(25);
    
    line.sd_layout.leftEqualToView(cell.contentView)
    .rightEqualToView(cell.contentView)
    .bottomSpaceToView(cell.contentView, 0)
    .heightIs(1);
    
    return cell;
    
}
     
- (void)upLoadPortrait {
//上传头像
    NSLog(@"upload portrait");

}

- (void)savePersonalInfo {

    NSLog(@"保存成功");
}

@end
