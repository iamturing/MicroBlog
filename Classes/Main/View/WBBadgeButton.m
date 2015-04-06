//
//  WBBadgeButton.m
//  MicroBlog
//
//  Created by student on 15-3-4.
//  Copyright (c) 2015年 itany. All rights reserved.
//

#import "WBBadgeButton.h"

@implementation WBBadgeButton

/**
 *  初始化大小
 */
- (id)initWithFrame:(CGRect)frame
{
    self=[super initWithFrame:frame];
    if (self) {
        self.hidden=YES;
        self.userInteractionEnabled=NO;
        [self setBackgroundImage:[UIImage resizedImageWithName:@"main_badge"] forState:UIControlStateNormal];
        self.titleLabel.font=[UIFont systemFontOfSize:11];
    }
    return self;
}

/**
 *  设置提醒值
 */
- (void)setBadgeValue:(NSString *)badgeValue
{
    _badgeValue=[badgeValue copy];
    if (badgeValue && [badgeValue intValue] != 0) {
        self.hidden=NO;
        
        //设置文字
        [self setTitle:badgeValue forState:UIControlStateNormal];
        
        //设置frame
        CGRect frame=self.frame;
        CGFloat badgeH=self.currentBackgroundImage.size.height;
        CGFloat badgeW=self.currentBackgroundImage.size.width;
        if (badgeValue.length>1) {
            //文字的尺寸
            CGSize badgeSize=[badgeValue sizeWithFont:self.titleLabel.font];
            badgeW=badgeSize.width+10;
        }
        frame.size.width=badgeW;
        frame.size.height=badgeH;
        self.frame=frame;
    }else{
        self.hidden=YES;
    }
}

@end
