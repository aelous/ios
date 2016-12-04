//
//  TabLeagueViewController.h
//  basketBallTemplate
//
//  Created by lizhe on 16/10/12.
//  Copyright © 2016年 lizhe. All rights reserved.
//

#import "BaseViewController.h"
#import "HMSegmentedControl.h"
#import "LeagueMineViewController.h"
#import "LeagueInSchoolViewController.h"
//#import "LeagueOutSchoolViewController.h"
#import "LeagueBetweenSchoolViewController.h"
@interface TabLeagueViewController : BaseViewController

@property(nonatomic, strong)UIViewController    *currentViewController;
@property(nonatomic, strong)HMSegmentedControl  *HMSegmentedCtrl;
@property(nonatomic, strong)UIView              *containView;
@property(nonatomic, strong)LeagueBetweenSchoolViewController *viewCtrlBetSchool;
@property(nonatomic, strong)LeagueInSchoolViewController  *viewCtrlInSchool;
//@property(nonatomic, strong)LeagueOutSchoolViewController *viewCtrlOutSchool;
@property(nonatomic, strong)LeagueMineViewController      *viewCtrlMine;


@end
