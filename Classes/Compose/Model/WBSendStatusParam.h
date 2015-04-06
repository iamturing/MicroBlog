//
//  WBSendStatusParam.h
//  MicroBlog
//
//  Created by wangzhaolu on 15-3-19.
//  Copyright (c) 2015年 turing. All rights reserved.
//  封装发微博的参数

#import <Foundation/Foundation.h>
#import "WBBaseParam.h"

@interface WBSendStatusParam : WBBaseParam
/**
 *  要发布的微博文本内容，必须做URLencode，内容不超过140个汉字。
 */
@property (nonatomic, copy) NSString *status;
@end
