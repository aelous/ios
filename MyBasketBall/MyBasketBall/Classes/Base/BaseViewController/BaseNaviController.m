//
//  BaseNaviController.m
//  Basketball
//
//  Created by lw on 16/11/24.
//  Copyright © 2016年 basketball. All rights reserved.
//

#import "BaseNaviController.h"
#import "UIColor+StringColor.h"
#import "UIImage+color.h"
@interface BaseNaviController ()

@end

@implementation BaseNaviController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UINavigationBar *navigationBar = [UINavigationBar appearance];
    [navigationBar setTintColor:[UIColor whiteColor]];
    NSDictionary *attributes = @{NSForegroundColorAttributeName:[UIColor whiteColor]};
    [navigationBar setTitleTextAttributes:attributes];
    [navigationBar setBackgroundImage:[UIImage createImageWithColor:[UIColor ms_colorWithHexString:@"#224FA2"] withSize:CGSizeMake(self.view.bounds.size.width, 64)] forBarPosition:UIBarPositionAny barMetrics:UIBarMetricsDefault];
    [navigationBar setShadowImage:[[UIImage alloc] init]];
//    [navigationBar setBarTintColor:[UIColor ms_colorWithHexString:@"#224FA2"]];
    
//    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"back"] style:UIBarButtonItemStylePlain target:nil action:nil];
//    self.navigationItem.leftBarButtonItem = item;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
