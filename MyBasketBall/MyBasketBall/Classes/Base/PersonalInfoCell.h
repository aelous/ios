//
//  PersonalInfoCell.h
//  MyBasketBall
//
//  Created by lee on 16/12/16.
//  Copyright © 2016年 lizhe. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PersonalInfoCell : UITableViewCell

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *value;

+ (PersonalInfoCell *)cellWithTableView:(UITableView *)tableView;

@end
