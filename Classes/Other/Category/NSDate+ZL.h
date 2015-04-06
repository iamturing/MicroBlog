//
//  NSDate+ZL.h
//  MicroBlog
//
//  Created by student on 15-3-9.
//  Copyright (c) 2015年 itany. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (ZL)

/**
 *  是否是今天
 */
- (BOOL)isToday;

/**
 *  是否是昨天
 */
- (BOOL)isYesterday;

/**
 *  是否是今年
 */
- (BOOL)isThisYear;

/**
 *  返回一个只有年月日的时间
 */
- (NSDate *)dateWithYMD;

/**
 *  获得与当前时间的差距
 */
- (NSDateComponents *) deltaWithNow;

@end
