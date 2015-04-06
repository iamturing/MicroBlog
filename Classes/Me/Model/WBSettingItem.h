//
//  WBSettingItem.h
//  MicroBlog
//
//  Created by student on 15-3-21.
//  Copyright (c) 2015年 itany. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^IWSettingItemOperation)();

@interface WBSettingItem : NSObject
@property (nonatomic, copy) NSString *icon;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *subtitle;
@property (nonatomic, copy) NSString *badgeValue;

@property (nonatomic, copy) IWSettingItemOperation operation;

+ (instancetype)itemWithIcon:(NSString *)icon title:(NSString *)title;
+ (instancetype)itemWithTitle:(NSString *)title;
+ (instancetype)item;
@end
