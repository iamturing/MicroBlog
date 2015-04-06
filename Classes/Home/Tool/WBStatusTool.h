//
//  WBStatusTool.h
//  MicroBlog
//
//  Created by student on 15-3-19.
//  Copyright (c) 2015年 itany. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WBHomeStatusParam.h"
#import "WBHomeStatusResult.h"
#import "WBSendStatusParam.h"
#import "WBSendStatusResult.h"

@interface WBStatusTool : NSObject

/**
 *  加载首页的微博数据
 *
 *  @param param   请求参数
 *  @param success 请求成功后的回调
 *  @param failure 请求失败后的回调
 */
+ (void)homeStatusesWithParam:(WBHomeStatusParam *)param success:(void (^)(WBHomeStatusResult *result))success failure:(void (^)(NSError *error))failure;

/**
 *  发送一条微博
 *
 *  @param param   请求参数
 *  @param success 请求成功后的回调
 *  @param failure 请求失败后的回调
 */
+ (void)sendStatusWithParam:(WBSendStatusParam *)param success:(void (^)(WBSendStatusResult *result))success failure:(void (^)(NSError *error))failure;
@end
