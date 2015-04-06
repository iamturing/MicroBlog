//
//  WBRetweetStatusView.h
//  MicroBlog
//
//  Created by student on 15-3-10.
//  Copyright (c) 2015年 itany. All rights reserved.
//  微博cell内部 被转发微博的view
#import <UIKit/UIKit.h>
@class WBStatusFrame;

@interface WBRetweetStatusView : UIImageView
@property (nonatomic, strong)WBStatusFrame * statusFrame;
@end
