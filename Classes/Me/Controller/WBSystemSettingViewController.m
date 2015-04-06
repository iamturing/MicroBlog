//
//  WBSystemSettingViewController.m
//  MicroBlog
//
//  Created by student on 15-3-21.
//  Copyright (c) 2015年 itany. All rights reserved.
//

#import "WBSystemSettingViewController.h"
#import "WBSettingArrowItem.h"
#import "WBSettingGroup.h"
#import "WBGeneralViewController.h"

@interface WBSystemSettingViewController ()

@end

@implementation WBSystemSettingViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"设置";
    
    [self setupGroup0];
    [self setupGroup1];
    [self setupGroup2];
    [self setupGroup3];
    
    [self setupFooter];
}

- (void)setupFooter
{
    // 按钮
    UIButton *logoutButton = [[UIButton alloc] init];
    CGFloat logoutX = WBStatusTableBorder + 2;
    CGFloat logoutY = 10;
    CGFloat logoutW = self.tableView.frame.size.width - 2 * logoutX;
    CGFloat logoutH = 44;
    logoutButton.frame = CGRectMake(logoutX, logoutY, logoutW, logoutH);
    
    // 背景和文字
    [logoutButton setBackgroundImage:[UIImage resizedImageWithName:@"common_button_red"] forState:UIControlStateNormal];
    [logoutButton setBackgroundImage:[UIImage resizedImageWithName:@"common_button_red_highlighted"] forState:UIControlStateHighlighted];
    [logoutButton setTitle:@"退出当前帐号" forState:UIControlStateNormal];
    logoutButton.titleLabel.font = [UIFont systemFontOfSize:14];
    [logoutButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    // footer
    UIView *footer = [[UIView alloc] init];
    CGFloat footerH = logoutH + 20;
    footer.frame = CGRectMake(0, 0, 0, footerH);
    self.tableView.tableFooterView = footer;
    [footer addSubview:logoutButton];
}

- (void)setupGroup0
{
    WBSettingGroup *group = [self addGroup];
    
    WBSettingArrowItem *account = [WBSettingArrowItem itemWithTitle:@"帐号管理"];
    group.items = @[account];
}

- (void)setupGroup1
{
    WBSettingGroup *group = [self addGroup];
    
    WBSettingArrowItem *theme = [WBSettingArrowItem itemWithTitle:@"主题、背景" destVcClass:nil];
    group.items = @[theme];
}

- (void)setupGroup2
{
    WBSettingGroup *group = [self addGroup];
    
    WBSettingArrowItem *notice = [WBSettingArrowItem itemWithTitle:@"通知和提醒"];
    WBSettingArrowItem *general = [WBSettingArrowItem itemWithTitle:@"通用设置" destVcClass:[WBGeneralViewController class]];
    WBSettingArrowItem *safe = [WBSettingArrowItem itemWithTitle:@"隐私与安全"];
    group.items = @[notice, general, safe];
}

- (void)setupGroup3
{
    WBSettingGroup *group = [self addGroup];
    
    WBSettingArrowItem *opinion = [WBSettingArrowItem itemWithTitle:@"意见反馈"];
    WBSettingArrowItem *about = [WBSettingArrowItem itemWithTitle:@"关于微博"];
    group.items = @[opinion, about];
}
@end
