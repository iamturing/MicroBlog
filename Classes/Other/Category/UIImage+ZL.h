//
//  UIImage+ZL.h
//  MicroBlog
//
//  Created by student on 15-3-4.
//  Copyright (c) 2015年 itany. All rights reserved.
//



/**
 *
 * 类别（ category ）:
    是 Objective-C 语言的新特性，为现有的类添加新方法的方式。局限性：1、无法添加新的实例变量。2、与类本身的方法名称冲突。当名称冲突时，类别具有更高的优先级。作用：1、利用类别分散实现。2、使用类别创建前向引用。3、非正式协议和委托类别。
 */

#import <UIKit/UIKit.h>

@interface UIImage (ZL)
/**
 *  加载图片
 *
 *  @param name 图片名
 */
+ (UIImage *)imageWithName:(NSString *)name;

/**
 *  返回一张自由拉伸的图片
 */
+ (UIImage *)resizedImageWithName:(NSString *)name;
+ (UIImage *)resizedImageWithName:(NSString *)name left:(CGFloat)left  top:(CGFloat)top;


@end
