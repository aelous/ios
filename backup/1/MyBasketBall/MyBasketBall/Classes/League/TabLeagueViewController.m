//
//  TabLeagueViewController.m
//  basketBallTemplate
//
//  Created by lizhe on 16/10/12.
//  Copyright © 2016年 lizhe. All rights reserved.
//

#import "TabLeagueViewController.h"

@interface TabLeagueViewController ()
{
    IndexChangeBlock myIndexBlock;
}
@property (nonatomic, strong) UIView *navSuperView;
@end

@implementation TabLeagueViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    [self.navigationController setNavigationBarHidden:NO animated:YES];
//    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName: [UIColor blackColor],NSFontAttributeName:[UIFont systemFontOfSize:text_size_normal]};
    [self.view setBackgroundColor:[UIColor whiteColor]];
    [self setMyBlock];
    [self initHMSegmentedCtrl];
    self.navSuperView = [[UIView alloc] init];
    self.navSuperView.backgroundColor = UIColorFromRGB(LZCOLOR_MAIN);
    self.navSuperView.frame = CGRectMake(0, 0, SCR_W, 44);
    [self.navSuperView addSubview:_HMSegmentedCtrl];
    self.navigationItem.titleView = self.navSuperView;
//    [self.navigationController.navigationBar addSubview: _HMSegmentedCtrl];
    //    [self setCustomNavigationLeftBar];
    //    [self initLeftBarButtonItem];
    // Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)setMyBlock {
    __weak TabLeagueViewController *controller = self;
    myIndexBlock = ^(NSInteger index) {
        UIViewController *to;
        if (0 == index) {
            to = controller.viewCtrlBetSchool;
        }else if (1 == index){
            to = controller.viewCtrlInSchool;
        }else if (2 == index) {
            to = controller.viewCtrlMine;
        }
        
        [controller transitionFromViewController:controller.currentViewController
                                toViewController:to
                                        duration:0
                                         options:(UIViewAnimationOptionTransitionNone)
                                      animations:^{
                                      }
                                      completion:^(BOOL finished) {
                                          if (finished) {
                                              controller.currentViewController = to;
                                          }
                                          
                                      }];
        
    };
}

- (void)initHMSegmentedCtrl
{
    NSArray* items=[NSArray arrayWithObjects:@"校际", @"校内", @"我的", nil];
    _HMSegmentedCtrl = [[HMSegmentedControl alloc]initWithSectionTitles:items];
    _HMSegmentedCtrl.frame = CGRectMake(0, 14, SCR_W, SEGMENT_HEIGHT);
    //    [_HMSegmentedCtrl addBottomLine];
    //    _HMSegmentedCtrl.backgroundColor = [UIColor colorWithRed:0.96 green:0.96 blue:0.96 alpha:1];
    _HMSegmentedCtrl.backgroundColor = UIColorFromRGB(LZCOLOR_MAIN);
    //设置导航标题的颜色及字体大小
    _HMSegmentedCtrl.titleTextAttributes = @{NSForegroundColorAttributeName:[UIColor whiteColor],NSFontAttributeName:[UIFont systemFontOfSize:text_size_small]};
    _HMSegmentedCtrl.selectedTitleTextAttributes = @{NSForegroundColorAttributeName:[UIColor whiteColor]};  //BLUECOLOR
    _HMSegmentedCtrl.selectionIndicatorColor = [UIColor whiteColor];
    _HMSegmentedCtrl.selectionIndicatorHeight = 3;
    _HMSegmentedCtrl.selectionIndicatorLocation = HMSegmentedControlSelectionIndicatorLocationDown;
    _HMSegmentedCtrl.selectionStyle = HMSegmentedControlSelectionStyleTextWidthStripe;
    _HMSegmentedCtrl.verticalDividerEnabled = YES;
    _HMSegmentedCtrl.verticalDividerColor = UIColorFromRGB(LZCOLOR_MAIN);
    
    _containView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCR_W, SCR_H)];
    [self.view addSubview:_containView];
    [self.view addSubview:_HMSegmentedCtrl];
    
    self.viewCtrlBetSchool = [[LeagueBetweenSchoolViewController alloc] init];
    self.viewCtrlInSchool = [[LeagueInSchoolViewController alloc]init];
    //    self.viewCtrlOutSchool = [[LeagueOutSchoolViewController alloc]init];
    self.viewCtrlMine = [[LeagueMineViewController alloc]init];
    [self addChildViewController:self.viewCtrlBetSchool];
    [self addChildViewController:self.viewCtrlInSchool];
    [self addChildViewController:self.viewCtrlMine];
    [self.containView addSubview:self.viewCtrlBetSchool.view];
    _currentViewController = self.viewCtrlBetSchool;
    [_HMSegmentedCtrl setIndexChangeBlock:myIndexBlock];
    
}


@end
