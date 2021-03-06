//
//  GetUserInfoBattleThread.h
//  MyBasketBall
//
//  Created by lw on 17/1/7.
//  Copyright © 2017年 lizhe. All rights reserved.
//

#import "GetHttpThread.h"

@interface GetUserInfoBattleThread : GetHttpThread

@property (nonatomic, copy) void (^prev)();
@property (nonatomic, copy) void (^unavaliableNetwork)();
@property (nonatomic, copy) void (^timout)();
@property (nonatomic, copy) void (^success)(NSArray *arr);
@property (nonatomic, copy) void (^exception)(NSString* message);

- (instancetype)initWithUserId:(int)userId;
- (void)requireonPrev:(void (^)())prev success:(void (^)(NSArray *arr))success unavaliableNetwork:(void (^)())unavaliableNetwork timeout:(void (^)())timeout exception:(void (^)(NSString* message))exception;

@end
