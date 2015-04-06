//
//  WBUserTool.m
//  MicroBlog
//
//  Created by student on 15-3-19.
//  Copyright (c) 2015年 itany. All rights reserved.
//  用户业务处理类（工具类）

#import "WBUserTool.h"
#import "WBHttpTool.h"
#import "MJExtension.h"

@implementation WBUserTool

+ (void)userInfoWithParam:(WBUserInfoParam *)param success:(void (^)(WBUserInfoResult *))success failure:(void (^)(NSError *))failure
{
    [WBHttpTool getWithURL:@"https://api.weibo.com/2/users/show.json" params:param.keyValues success:^(id json) {
        if (success) {
            WBUserInfoResult *result=[WBUserInfoResult objectWithKeyValues:json];
            success(result);
        }
    } failure:^(NSError *error) {
        if (failure) {
            failure(error);
        }
    }];
}

+ (void)userUnreadCountWithParam:(WBUserUnreadCountParam *)param success:(void (^)(WBUserUnreadCountResult *))success failure:(void (^)(NSError *))failure
{
    [WBHttpTool getWithURL:@"https://rm.api.weibo.com/2/remind/unread_count.json" params:param.keyValues success:^(id json) {
        if (success) {
            WBUserUnreadCountResult *result = [WBUserUnreadCountResult objectWithKeyValues:json];
            success(result);
        }
    } failure:^(NSError *error) {
        if (failure) {
            failure(error);
        }
    }];
}
@end
