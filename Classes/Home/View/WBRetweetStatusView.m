//
//  WBRetweetStatusView.m
//  MicroBlog
//
//  Created by student on 15-3-10.
//  Copyright (c) 2015年 itany. All rights reserved.
//  微博cell内部 被转发微博的view

#import "WBRetweetStatusView.h"
#import "WBStatus.h"
#import "WBUser.h"
#import "WBStatusFrame.h"
#import "UIImageView+WebCache.h"
#import "WBPhotosView.h"
#import "WBPhoto.h"

@interface WBRetweetStatusView()
/** 被转发微博作者的昵称 */
@property (nonatomic, weak) UILabel *retweetNameLabel;
/** 被转发微博的正文\内容 */
@property (nonatomic, weak) UILabel *retweetContentLabel;
/** 被转发微博的配图 */
@property (nonatomic, weak) WBPhotosView *retweetPhotosView;
@end

@implementation WBRetweetStatusView

/**
 *  初始化frame
 */
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // 1.设置图片
        self.userInteractionEnabled = YES;
        self.image = [UIImage resizedImageWithName:@"timeline_retweet_background" left:0.9 top:0.5];
        
        /** 2.被转发微博作者的昵称 */
        UILabel *retweetNameLabel = [[UILabel alloc] init];
        retweetNameLabel.font = WBRetweetStatusNameFont;
        retweetNameLabel.textColor = WBColor(67, 107, 163);
        retweetNameLabel.backgroundColor = [UIColor clearColor];
        [self addSubview:retweetNameLabel];
        self.retweetNameLabel = retweetNameLabel;
        
        /** 3.被转发微博的正文\内容 */
        UILabel *retweetContentLabel = [[UILabel alloc] init];
        retweetContentLabel.font = WBRetweetStatusContentFont;
        retweetContentLabel.backgroundColor = [UIColor clearColor];
        retweetContentLabel.numberOfLines = 0;
        retweetContentLabel.textColor = WBColor(90, 90, 90);
        [self addSubview:retweetContentLabel];
        self.retweetContentLabel = retweetContentLabel;
        
        /** 4.被转发微博的配图 */
        WBPhotosView *retweetPhotosView = [[WBPhotosView alloc] init];
        [self addSubview:retweetPhotosView];
        self.retweetPhotosView = retweetPhotosView;
    }
    return self;
}

- (void)setStatusFrame:(WBStatusFrame *)statusFrame
{
    _statusFrame = statusFrame;
    
    WBStatus *retweetStatus = statusFrame.status.retweeted_status;
    WBUser *user = retweetStatus.user;
    
    // 1.昵称
    self.retweetNameLabel.text = [NSString stringWithFormat:@"@%@", user.name];
    self.retweetNameLabel.frame = self.statusFrame.retweetNameLabelF;
    
    // 2.正文
    self.retweetContentLabel.text = retweetStatus.text;
    self.retweetContentLabel.frame = self.statusFrame.retweetContentLabelF;
    
    // 3.配图
    if (retweetStatus.pic_urls.count) {
        self.retweetPhotosView.hidden = NO;
        self.retweetPhotosView.frame = self.statusFrame.retweetPhotosViewF;
        self.retweetPhotosView.photos = retweetStatus.pic_urls;
    } else {
        self.retweetPhotosView.hidden = YES;
    }
}



@end
