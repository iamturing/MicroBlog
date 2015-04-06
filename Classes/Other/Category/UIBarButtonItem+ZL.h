//
//  UIBarButtonItem+ZL.h
//  MicroBlog
//
//  Created by student on 15-3-5.
//  Copyright (c) 2015年 itany. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (ZL)
/**
 *  快速创建一个显示图片的item
 *  @param action   监听方法
 */
+ (UIBarButtonItem *)itemWithIcon:(NSString *)icon highIcon:(NSString *)highIcon target:(id)target action:(SEL)action;
@end
