//
//  WBSettingGroup.h
//  MicroBlog
//
//  Created by student on 15-3-21.
//  Copyright (c) 2015年 itany. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WBSettingGroup : NSObject

@property (copy, nonatomic) NSString *header;
@property (copy, nonatomic) NSString *footer;
@property (strong, nonatomic) NSArray *items;

+ (instancetype)group;
@end
