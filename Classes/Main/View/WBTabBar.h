//
//  WBTabBar.h
//  MicroBlog
//
//  Created by student on 15-3-4.
//  Copyright (c) 2015年 itany. All rights reserved.
//

#import <UIKit/UIKit.h>

@class WBTabBar;

@protocol WBTabBarDelegate <NSObject>

@optional
- (void)tabBar:(WBTabBar *)tabBar didSelectedButtonFrom:(int)from to:(int)to;
- (void)tabBarDidClickedPlusButton:(WBTabBar *)tabBar;
@end

@interface WBTabBar : UIView
- (void)addTabBarButtonWithItem:(UITabBarItem *)item;

@property (nonatomic, weak) id<WBTabBarDelegate> delegate;

@end
