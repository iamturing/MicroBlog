//
//  WBUser.h
//  MicroBlog
//
//  Created by student on 15-3-7.
//  Copyright (c) 2015年 itany. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WBUser : NSObject

/**
 *  用户的ID
 */
@property (nonatomic, copy) NSString *idstr;
/**
 *  用户的昵称
 */
@property (nonatomic, copy) NSString *name;
/**
 *  用户的头像
 */
@property (nonatomic, copy) NSString *profile_image_url;
/**
 *  会员等级
 */
@property (nonatomic, assign) int mbrank;
/**
 *  会员类型
 */
@property (nonatomic, assign) int mbtype;

@end
