//
//  BattleDetailHeaderView.m
//  MyBasketBall
//
//  Created by lw on 17/1/10.
//  Copyright © 2017年 lizhe. All rights reserved.
//

#import "BattleDetailHeaderView.h"
#import "SDAutoLayout.h"

NSString *textColor = @"#8B8B8B";
@interface BattleDetailHeaderView()

@property (nonatomic, strong) UILabel *timeLabel;
@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UIImageView *leftIcon;
@property (nonatomic, strong) UIImageView *rightIcon;


@end

@implementation BattleDetailHeaderView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self == [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
        [self setupHeaderView];
    }
    return self;
}

- (void)setupHeaderView {

//    CGFloat height = self.bounds.size.height;
    self.timeLabel = [UILabel labelWithSize:6 color:textColor];
    [self addSubview:self.timeLabel];
    self.nameLabel = [UILabel labelWithSize:6 color:textColor];
    [self addSubview:self.nameLabel];

}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.timeLabel.sd_layout
    .leftSpaceToView(self,4)
    .topSpaceToView(self,4);
    
    self.nameLabel.sd_layout
    .topSpaceToView(self,4)
    .rightSpaceToView(self,4);
    
    
    
}

- (void)headerButtonSelected:(UIButton *)sender {

    
}

- (void)setData {

    self.timeLabel.text = @"比赛时间：2016-10-26";
    
    [self layoutIfNeeded];
}

@end
