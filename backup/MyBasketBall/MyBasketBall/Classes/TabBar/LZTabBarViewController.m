//
//  LZTabBarViewController.m
//  basketBallTemplate
//
//  Created by lizhe on 16/10/11.
//  Copyright © 2016年 lizhe. All rights reserved.
//

#import "LZTabBarViewController.h"
#import "TabDynamicViewController.h"
#import "TabLeagueViewController.h"
#import "PersonInfoViewController.h"

@interface LZTabBarViewController ()

@end

@implementation LZTabBarViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    [self setTabViewController];
}

- (void)setTabViewController {
    
    TabDynamicViewController *dynamicViewController = [[TabDynamicViewController alloc] init];
    UINavigationController *nav_dynamic = [[UINavigationController alloc] initWithRootViewController:dynamicViewController];
    nav_dynamic.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"动态" image:[UIImage imageNamed:@"home"] tag:0];
    nav_dynamic.tabBarItem.badgeValue = @"1";
    
    
    TabLeagueViewController *leagueViewController = [[TabLeagueViewController alloc] init];
    UINavigationController *nav_league = [[UINavigationController alloc] initWithRootViewController:leagueViewController];
    nav_league.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"联赛" image:[UIImage imageNamed:@"invest"] tag:1];
    nav_league.tabBarItem.badgeValue = @"2";
    
    PersonInfoViewController *personInfoViewController = [[PersonInfoViewController alloc] init];
    UINavigationController *nav_personInfo = [[UINavigationController alloc] initWithRootViewController:personInfoViewController];
    nav_personInfo.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"我的" image:[UIImage imageNamed:@"account"] tag:2];
    nav_personInfo.tabBarItem.badgeValue = @"3";
    
    self.viewControllers = @[nav_dynamic, nav_league, nav_personInfo];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
