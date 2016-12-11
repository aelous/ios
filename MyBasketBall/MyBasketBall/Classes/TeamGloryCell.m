//
//  TeamGloryCell.m
//  Basketball
//
//  Created by lw on 16/11/27.
//  Copyright © 2016年 basketball. All rights reserved.
//

#import "TeamGloryCell.h"

@implementation TeamGloryCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

+ (TeamGloryCell *)cellWithTableView:(UITableView *)tableView {

    TeamGloryCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell_glory"];
    if (!cell) {
        UINib *nib = [UINib nibWithNibName:@"TeamGloryCell" bundle:nil];
        cell = [nib instantiateWithOwner:nil options:nil].lastObject;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return cell;
}

@end
