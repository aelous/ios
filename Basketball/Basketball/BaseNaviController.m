//
//  BaseNaviController.m
//  Basketball
//
//  Created by lw on 16/11/24.
//  Copyright © 2016年 basketball. All rights reserved.
//

#import "BaseNaviController.h"
#import "UIColor+StringColor.h"

@interface BaseNaviController ()

@end

@implementation BaseNaviController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UINavigationBar *navigationBar = [UINavigationBar appearance];
    [navigationBar setTintColor:[UIColor whiteColor]];
    [navigationBar setBarTintColor:[UIColor ms_colorWithHexString:@"#224FA2"]];
    NSDictionary *attributes = @{NSForegroundColorAttributeName:[UIColor whiteColor]};
    [navigationBar setTitleTextAttributes:attributes];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
