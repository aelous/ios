//
//  BaseViewController.h
//  YiJianBluetooth
//
//  Created by tyl on 16/8/5.
//  Copyright © 2016年 LEI. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JGProgressHUD.h"
#import "JGProgressHUDIndicatorView.h"
#import "JGProgressHUDPieIndicatorView.h"
#import "JGProgressHUDFadeZoomAnimation.h"
#import "MBProgressHUD.h"


@interface BaseViewController : UIViewController<JGProgressHUDDelegate,MBProgressHUDDelegate>{
    BOOL _blockUserInteraction;
}

@property (strong, nonatomic) MBProgressHUD *progressHUD;


-(void)initLeftBarButtonItem ;
- (void)backToSuper ;

- (void)setExtraCellLineHidden:(UITableView *)tableView;

-(void)initrightBarButtonItem:(NSString*)title action:(SEL)action;

- (void)showSuccessHud:(NSUInteger)section ;

- (void)showErrorHud:(NSUInteger)section ;

- (void)showSimpleHud:(NSUInteger)section ;

- (void)showWithTextHud:(NSUInteger)section text:(NSString *)text done:(NSString *)text1;

- (void)showProgressHud:(NSUInteger)section text:(NSString *)text;

- (void)showZoomAnimationWithRing:(NSUInteger)section text:(NSString *)text;

-(void)showTextOnlyHud:(NSUInteger)section text:(NSString *)text;

- (void)dismissAfterDelay:(NSTimeInterval)delay animated:(BOOL)animated;

- (void)dismissAnimated:(BOOL)animated;




-(void)showToast:(NSString*) toast;

-(void)showHud:(NSString *)text onView:(UIView*)view;
-(void)showHud:(NSString *)text;
-(void)showHud;
-(void)hideHud;

- (void)setCustomNavigationLeftBar;
@end
