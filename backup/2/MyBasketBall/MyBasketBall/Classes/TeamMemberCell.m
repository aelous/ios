//
//  TeamMemberCell.m
//  Basketball
//
//  Created by lw on 16/11/27.
//  Copyright © 2016年 basketball. All rights reserved.
//

#import "TeamMemberCell.h"

@implementation TeamMemberCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

+ (TeamMemberCell *)cellWithTableView:(UITableView *)tableView {

    TeamMemberCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell_member"];
    if (!cell) {
        UINib *nib = [UINib nibWithNibName:@"TeamMemberCell" bundle:nil];
        cell = [nib instantiateWithOwner:nil options:nil].lastObject;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return cell;
}

@end
