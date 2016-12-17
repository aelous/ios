//
//  FollowViewController.m
//  MyBasketBall
//
//  Created by lw on 16/12/11.
//  Copyright © 2016年 lizhe. All rights reserved.
//

#import "FollowViewController.h"

@interface FollowViewController ()

@end

@implementation FollowViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setCustomLeftBarButtonItem];
    [self setCustomRightBarButtonItem];
    [self prepareUI];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareUI {

    self.title = @"关注";
    self.view.backgroundColor = [UIColor whiteColor];
}

@end
