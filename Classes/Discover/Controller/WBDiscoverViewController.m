//
//  WBDiscoverViewController.m
//  MicroBlog
//
//  Created by student on 15-3-4.
//  Copyright (c) 2015年 itany. All rights reserved.
//

#import "WBDiscoverViewController.h"
#import "WBSearchBar.h"
#import "WBSettingArrowItem.h"
#import "WBSettingGroup.h"
#import "WBMoreViewController.h"
#import "WBDiscoverHeaderView.h"

@interface WBDiscoverViewController ()

@end

@implementation WBDiscoverViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // 1.添加搜索框
    WBSearchBar *search = [[WBSearchBar alloc] init];
    search.bounds = CGRectMake(0, 0, 305, 30);
    self.navigationItem.titleView = search;
    
    // 2.header
    self.tableView.tableHeaderView = [WBDiscoverHeaderView headerView];
    if (iOS7) {
        self.tableView.contentInset = UIEdgeInsetsZero;
    }
    
    [self setupGroup0];
    [self setupGroup1];
    [self setupGroup2];
}

- (void)setupGroup0
{
    WBSettingGroup *group = [self addGroup];
    
    WBSettingArrowItem *hot = [WBSettingArrowItem itemWithIcon:@"hot_status" title:@"热门微博" destVcClass:nil];
    hot.subtitle = @"笑话，娱乐，神最右都搬到这啦";
    
    WBSettingArrowItem *find = [WBSettingArrowItem itemWithIcon:@"find_people" title:@"找人" destVcClass:nil];
    find.subtitle = @"名人、有意思的人尽在这里";
    
    group.items = @[hot, find];
}

- (void)setupGroup1
{
    WBSettingGroup *group = [self addGroup];
    
    WBSettingArrowItem *gameCenter = [WBSettingArrowItem itemWithIcon:@"game_center" title:@"游戏中心" destVcClass:nil];
    WBSettingArrowItem *near = [WBSettingArrowItem itemWithIcon:@"near" title:@"周边" destVcClass:nil];
    WBSettingArrowItem *app = [WBSettingArrowItem itemWithIcon:@"app" title:@"应用" destVcClass:nil];
    group.items = @[gameCenter, near, app];
}

- (void)setupGroup2
{
    WBSettingGroup *group = [self addGroup];
    
    WBSettingArrowItem *video = [WBSettingArrowItem itemWithIcon:@"video" title:@"视频" destVcClass:nil];
    WBSettingArrowItem *music = [WBSettingArrowItem itemWithIcon:@"music" title:@"音乐" destVcClass:nil];
    WBSettingArrowItem *movie = [WBSettingArrowItem itemWithIcon:@"movie" title:@"电影" destVcClass:nil];
    WBSettingArrowItem *cast = [WBSettingArrowItem itemWithIcon:@"cast" title:@"播客" destVcClass:nil];
    WBSettingArrowItem *more = [WBSettingArrowItem itemWithIcon:@"more" title:@"更多" destVcClass:[WBMoreViewController class]];
    
    group.items = @[video, music, movie, cast, more];
}

#pragma mark - 代理
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    [self.view.window endEditing:YES];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.view.window endEditing:YES];
    [super tableView:tableView didSelectRowAtIndexPath:indexPath];
}



@end
