//
//  MemberHeaderView.m
//  Basketball
//
//  Created by lw on 16/11/24.
//  Copyright © 2016年 basketball. All rights reserved.
//

#import "MemberHeaderView.h"
#import "UIColor+StringColor.h"

@interface MemberHeaderView()

@property (nonatomic, strong) UIImageView *portraitView;
@property (nonatomic, strong) UILabel *titleLabel;

@end

@implementation MemberHeaderView

- (instancetype)initWithFrame:(CGRect)frame {

    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor ms_colorWithHexString:@""];
        [self setupHeaderView];
    }
    return self;
}

- (void)setupHeaderView {

    CGFloat width = self.bounds.size.width;
    CGFloat height = self.bounds.size.height;
    
    self.portraitView = [[UIImageView alloc] initWithFrame:CGRectMake(width/2.0 - 15, height/2.0 -30, 30, 30)];
    [self.portraitView setImage:[UIImage imageNamed:self.portrait]];
    self.portraitView.layer.masksToBounds = YES;
    self.portraitView.layer.cornerRadius = 15;
    [self addSubview:self.portraitView];
    
    self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.portraitView.frame) + 10, width, 18)];
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    self.titleLabel.textColor = [UIColor whiteColor];
    self.titleLabel.text = @"测试球队成员头像";
    [self addSubview:self.titleLabel];
    
    
}

@end
