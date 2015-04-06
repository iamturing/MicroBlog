//
//  WBAccountTool.h
//  MicroBlog
//
//  Created by student on 15-3-7.
//  Copyright (c) 2015年 itany. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WBAccessTokenParam.h"
#import "WBAccessTokenResult.h"

@class WBAccount;

@interface WBAccountTool : NSObject

/**
 *  存储账号信息
 *
 *  @param account 需要存储的账号
 */
+ (void)saveAccount:(WBAccount *)account;

/**
 *  返回存储的账号信息
 */
+ (WBAccount *)account;

/**
 *  获得accessToken
 *
 *  @param param   请求参数
 *  @param success 请求成功后的回调
 *  @param failure 请求失败后的回调
 */
+ (void)accessTokenWithParam:(WBAccessTokenParam *)param success:(void (^)(WBAccessTokenResult *result))success failure:(void (^)(NSError *error))failure;
@end
