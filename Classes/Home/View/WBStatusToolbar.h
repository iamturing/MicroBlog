//
//  WBStatusToolbar.h
//  MicroBlog
//
//  Created by student on 15-3-10.
//  Copyright (c) 2015年 itany. All rights reserved.
//微博cell底部的工具条

#import <UIKit/UIKit.h>
@class WBStatus;

@interface WBStatusToolbar : UIImageView
@property (nonatomic, strong) WBStatus * status;
@end
