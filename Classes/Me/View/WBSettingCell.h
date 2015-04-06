//
//  WBSettingCell.h
//  MicroBlog
//
//  Created by student on 15-3-21.
//  Copyright (c) 2015年 itany. All rights reserved.
//

#import <UIKit/UIKit.h>
@class WBSettingItem;

@interface WBSettingCell : UITableViewCell
@property (strong, nonatomic) WBSettingItem *item;
@property (nonatomic, strong) NSIndexPath *indexPath;
+ (instancetype)cellWithTableView:(UITableView *)tableView;
@end
