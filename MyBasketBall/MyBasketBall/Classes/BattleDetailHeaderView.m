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

    CGFloat height = self.bounds.size.height;
    
//    self.timeLabel = [UILabel labelWithSize:<#(float)#> color:<#(NSString *)#>]

}

- (void)layoutSubviews {

    
}

- (void)headerButtonSelected:(UIButton *)sender {

    
}
@end
