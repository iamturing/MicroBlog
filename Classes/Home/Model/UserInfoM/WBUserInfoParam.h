//
//  WBUserInfoParam.h
//  MicroBlog
//
//  Created by student on 15-3-19.
//  Copyright (c) 2015年 itany. All rights reserved.
//  封装加载用户信息的参数

#import <Foundation/Foundation.h>
#import "WBBaseParam.h"

@interface WBUserInfoParam : WBBaseParam

/**
 *  需要查询的用户ID。
 */
@property (nonatomic, strong) NSNumber *uid;

/**
 *  需要查询的用户昵称。
 */
@property (nonatomic, copy) NSString *screen_name;
@end
