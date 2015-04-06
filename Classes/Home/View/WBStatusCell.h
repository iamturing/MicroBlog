//
//  WBStatusCell.h
//  MicroBlog
//
//  Created by student on 15-3-8.
//  Copyright (c) 2015年 itany. All rights reserved.
//  展示微博的cell

#import <UIKit/UIKit.h>
@class WBStatusFrame;

@interface WBStatusCell : UITableViewCell

+ (instancetype)cellWithTableView:(UITableView *)tableView;
@property (nonatomic, strong)WBStatusFrame * statusFrame;
@end
