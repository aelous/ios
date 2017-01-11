//
//  BattleDetailHeaderView.m
//  MyBasketBall
//
//  Created by lw on 17/1/10.
//  Copyright © 2017年 lizhe. All rights reserved.
//

#import "BattleDetailHeaderView.h"
#import "SDAutoLayout.h"

@interface BattleDetailHeaderView()

@property (nonatomic, strong) UILabel *timeLabel;
@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UIImageView *leftIcon;
@property (nonatomic, strong) UIImageView *rightIcon;
@property (nonatomic, strong) UIButton *selectedButton;

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

//    NSString *mainColor = @"#224FA2";
    NSString *textColor = @"#8B8B8B";
    
//    CGFloat height = self.bounds.size.height;
    self.timeLabel = [UILabel labelWithSize:6 color:textColor];
    self.timeLabel.frame = CGRectMake(4, 4, SCR_W/2.0, 6);
    [self addSubview:self.timeLabel];
    
    self.nameLabel = [UILabel labelWithSize:6 color:textColor];
    self.nameLabel.frame = CGRectMake(SCR_W/2.0, 4, SCR_W/2.0-4, 6);
    self.nameLabel.textAlignment = NSTextAlignmentRight;
    [self addSubview:self.nameLabel];
    
    
    
    CGFloat buttonWidth = self.bounds.size.width / 3.0;
    NSArray *buttonTitles = [NSArray arrayWithObjects:@"直播",@"数据统计",@"动态", nil];
    for (int i = 0; i < 3; i++) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(i * buttonWidth, self.bounds.size.height - 40, buttonWidth, 40);
        [button setTitle:buttonTitles[i] forState:UIControlStateNormal];
        [button.titleLabel setFont:[UIFont systemFontOfSize:12.0]];
        [button setTitleColor:[UIColor ms_colorWithHexString:@"#FFFFFF"] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor ms_colorWithHexString:@"#224FA2"] forState:UIControlStateSelected];
        [button setBackgroundColor:[UIColor ms_colorWithHexString:@"#224FA2"]];
        [button setTag:i];
        [button addTarget:self action:@selector(headerButtonSelected:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:button];
        if (!i) {
            button.selected = YES;
            self.selectedButton = button;
        }
    }
}

- (void)headerButtonSelected:(UIButton *)sender {

    if (self.titleButtonBlock) {
        self.titleButtonBlock((int)sender.tag);
    }
    
}

- (void)setData {

    self.timeLabel.text = @"比赛时间：2016-10-26";
    self.nameLabel.text = @"北京工人体育馆";
    [self layoutIfNeeded];
}

@end
