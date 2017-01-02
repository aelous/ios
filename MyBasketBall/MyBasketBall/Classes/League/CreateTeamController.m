//
//  CreateTeamController.m
//  MyBasketBall
//
//  Created by lw on 16/12/21.
//  Copyright © 2016年 lizhe. All rights reserved.
//

#import "CreateTeamController.h"
#import "UILabel+Custom.h"

@interface CreateTeamController ()<UITextFieldDelegate>

@property (nonatomic, strong) UITextField *nameText;

@end

@implementation CreateTeamController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self prepareUI];
}


- (void)prepareUI {

    self.title = @"创建球队";
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton *right = [UIButton buttonWithType:UIButtonTypeCustom];
    right.titleLabel.font = [UIFont systemFontOfSize:14];
    [right setTitle:@"创建" forState:UIControlStateNormal];
    right.titleLabel.textColor = [UIColor whiteColor];
//    UIBarButtonItem *right = [[UIBarButtonItem alloc] initWithTitle:@"创建" style:UIBarButtonItemStylePlain target:self action:@selector(rightItemClick)];
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:right];
    self.navigationItem.rightBarButtonItem = item;
    
    float width = self.view.bounds.size.width;
    UILabel *name = [UILabel labelWithTitle:@"队名" size:14 colorString:@"#000000"];
    name.frame = CGRectMake(20, 24, 40, 20);
    [self.view addSubview:name];
    
    self.nameText = [[UITextField alloc] initWithFrame:CGRectMake(80, 24, width - 100, 20)];
    self.nameText.font = [UIFont systemFontOfSize:14];
    self.nameText.placeholder = @"请不要超过10个字";
    self.nameText.delegate = self;
    [self.view addSubview:self.nameText];
    
    UIView *topLine = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.nameText.frame)+9, width, 1)];
    topLine.backgroundColor = [UIColor ms_colorWithHexString:@"#D8D8D8"];
    [self.view addSubview:topLine];
    
    UILabel *location = [UILabel labelWithTitle:@"所在地" size:14 colorString:@"#000000"];
    location.frame = CGRectMake(20, CGRectGetMaxY(topLine.frame)+9, 50, 20);
    [self.view addSubview:location];
    
    //选择器？
    
    UIView *bottomLine = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(location.frame)+9, width, 1)];
    bottomLine.backgroundColor = [UIColor ms_colorWithHexString:@"#D8D8D8"];
    [self.view addSubview:bottomLine];

}

- (void)rightItemClick {

    NSLog(@"跳转球队详情");
}


#pragma mark - textfield delegate

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {

    if (self.nameText == textField) {
        if (textField.text.length < 11) {
            return YES;
        }
    }
    return NO;
}

@end
