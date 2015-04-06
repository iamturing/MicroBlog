//
//  WBHomeStatusResult.m
//  MicroBlog
//
//  Created by student on 15-3-19.
//  Copyright (c) 2015年 itany. All rights reserved.
//

#import "WBHomeStatusResult.h"
#import "MJExtension.h"
#import "WBStatus.h"

@implementation WBHomeStatusResult

/**
 *  数组中需要转换的模型类
 *
 *  @return 字典中的key是数组属性名，value是数组中存放模型的Class
 */
- (NSDictionary *)objectClassInArray
{
    return @{@"statuses" : [WBStatus class]};
}
@end
