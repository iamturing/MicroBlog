//
//  WBSettingArrowItem.m
//  MicroBlog
//
//  Created by student on 15-3-21.
//  Copyright (c) 2015年 itany. All rights reserved.
//

#import "WBSettingArrowItem.h"

@implementation WBSettingArrowItem
+ (instancetype)itemWithIcon:(NSString *)icon title:(NSString *)title destVcClass:(Class)destVcClass
{
    WBSettingArrowItem *item = [self itemWithIcon:icon title:title];
    item.destVcClass = destVcClass;
    return item;
}

+ (instancetype)itemWithTitle:(NSString *)title destVcClass:(Class)destVcClass
{
    return [self itemWithIcon:nil title:title destVcClass:destVcClass];
}
@end
