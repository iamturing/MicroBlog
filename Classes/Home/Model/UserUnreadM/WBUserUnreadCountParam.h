//
//  WBUserUnreadCountParam.h
//  MicroBlog
//
//  Created by student on 15-3-19.
//  Copyright (c) 2015年 itany. All rights reserved.
//

#import "WBBaseParam.h"

@interface WBUserUnreadCountParam : WBBaseParam
/**
 *  需要查询的用户ID
 */
@property (nonatomic, strong) NSNumber * uid;
@end
