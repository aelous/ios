//
//  UserInfoStatisticModel.h
//  MyBasketBall
//
//  Created by lw on 17/1/9.
//  Copyright © 2017年 lizhe. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MatchModel : NSObject

@property (copy, nonatomic) NSString *date;
@property (copy, nonatomic) NSString *score;
@property (copy, nonatomic) NSString *opponents;
@property (copy, nonatomic) NSString *blackBoard;
@property (copy, nonatomic) NSString *assist;
@property (copy, nonatomic) NSString *steal;
@property (copy, nonatomic) NSString *block;
@property (copy, nonatomic) NSString *shootRate;
@property (copy, nonatomic) NSString *threeRate;
@property (copy, nonatomic) NSString *penaltyRate;

@end

@interface AverageModel : NSObject

@property (nonatomic, copy) NSString *score;
@property (nonatomic, copy) NSString *blackBoard;
@property (nonatomic, copy) NSString *assist;
@property (nonatomic, copy) NSString *steal;
@property (nonatomic, copy) NSString *block;
@property (copy, nonatomic) NSString *mistake;
@property (copy, nonatomic) NSString *shootRate;
@property (copy, nonatomic) NSString *threeRate;
@property (copy, nonatomic) NSString *penaltyRate;

@end

@interface UserInfoStatisticModel : NSObject

@property (nonatomic, strong) NSMutableArray *diagram;
@property (nonatomic, strong) NSMutableArray *matches;
@property (nonatomic, strong) AverageModel *average;

@end
