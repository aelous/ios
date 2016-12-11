//
//  MemberCell.m
//  Basketball
//
//  Created by lw on 16/11/26.
//  Copyright © 2016年 basketball. All rights reserved.
//

#import "MemberBattleCell.h"

@implementation MemberBattleCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

+ (MemberBattleCell *)cellWithTableView:(UITableView *)tableView {

    MemberBattleCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell_battle"];
    if (!cell) {
        UINib *nib = [UINib nibWithNibName:@"MemberBattleCell" bundle:nil];
        cell = [nib instantiateWithOwner:nil options:nil].lastObject;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return cell;
}

@end
