//
//  WBMeViewController.m
//  MicroBlog
//
//  Created by student on 15-3-4.
//  Copyright (c) 2015年 itany. All rights reserved.
//

#import "WBMeViewController.h"
#import "WBSettingArrowItem.h"
#import "WBSettingGroup.h"
#import "WBSystemSettingViewController.h"

@interface WBMeViewController ()

@end

@implementation WBMeViewController



- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationItem.rightBarButtonItem=[[UIBarButtonItem alloc]initWithTitle:@"设置" style:UIBarButtonItemStyleDone target:self action:@selector(setting)];
   
    [self setupGroup0];
    [self setupGroup1];
    [self setupGroup2];
    [self setupGroup3];
}

/**
 *  设置
 */
- (void)setting
{
    WBSystemSettingViewController *sys=[[WBSystemSettingViewController alloc]init];
    [self.navigationController pushViewController:sys animated:YES];
}

- (void)setupGroup0
{
    WBSettingGroup *group = [self addGroup];
    
    WBSettingArrowItem *newFriend = [WBSettingArrowItem itemWithIcon:@"new_friend" title:@"新的好友" destVcClass:nil];
    newFriend.badgeValue = @"10";
    group.items = @[newFriend];
}


- (void)setupGroup1
{
    WBSettingGroup *group = [self addGroup];
    
    WBSettingArrowItem *album = [WBSettingArrowItem itemWithIcon:@"album" title:@"我的相册" destVcClass:nil];
    album.subtitle = @"(109)";
    WBSettingArrowItem *collect = [WBSettingArrowItem itemWithIcon:@"collect" title:@"我的收藏" destVcClass:nil];
    collect.subtitle = @"(0)";
    WBSettingArrowItem *like = [WBSettingArrowItem itemWithIcon:@"like" title:@"赞" destVcClass:nil];
    like.badgeValue = @"1";
    like.subtitle = @"(35)";
    group.items = @[album, collect, like];
}

- (void)setupGroup2
{
    WBSettingGroup *group = [self addGroup];
    
    WBSettingArrowItem *pay = [WBSettingArrowItem itemWithIcon:@"pay" title:@"微博支付" destVcClass:nil];
    WBSettingArrowItem *vip = [WBSettingArrowItem itemWithIcon:@"vip" title:@"会员中心" destVcClass:nil];
    group.items = @[pay, vip];
}

- (void)setupGroup3
{
    WBSettingGroup *group = [self addGroup];
    
    WBSettingArrowItem *card = [WBSettingArrowItem itemWithIcon:@"card" title:@"我的名片" destVcClass:nil];
    WBSettingArrowItem *draft = [WBSettingArrowItem itemWithIcon:@"draft" title:@"草稿箱" destVcClass:nil];
    group.items = @[card, draft];
}

@end
