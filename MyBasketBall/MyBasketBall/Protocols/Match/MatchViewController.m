//
//  MatchViewController.m
//  MyBasketBall
//
//  Created by lizhe on 16/11/18.
//  Copyright © 2016年 lizhe. All rights reserved.
//

#import "MatchViewController.h"
#import "LZProgressView.h"
#import "MyCustomButton.h"
@interface MatchViewController ()

@property (nonatomic, strong) UILabel *labelMatchTime;
@property (nonatomic, strong) UILabel *labelMatchAddr;
@property (nonatomic, strong) UIImageView *imageViewLeft;
@property (nonatomic, strong) UILabel *labelScoreLeft;
@property (nonatomic, strong) UILabel *labelNameLeft;
@property (nonatomic, strong) MyCustomButton *buttonLeft;

@property (nonatomic, strong) LZProgressView *viewProgress;

@property (nonatomic, strong) UIImageView *imageViewRight;
@property (nonatomic, strong) UILabel *labelScoreRight;
@property (nonatomic, strong) UILabel *labelNameRight;
@property (nonatomic, strong) MyCustomButton *buttonRight;

@end

@implementation MatchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setCustomLeftBarButtonItem];
    self.title = @"比赛的title";
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)initUI {
    self.labelMatchTime = [[UILabel alloc] init];
    [self.view addSubview:self.labelMatchTime];
    
    
}

- (void)initSegment {

}

@end
