//
//  BaseViewController.h
//  Basketball
//
//  Created by lw on 16/11/24.
//  Copyright © 2016年 basketball. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseViewController : UIViewController

@property (nonatomic, strong) UITableView *tableView;

- (void)prepareTableView;

@end
