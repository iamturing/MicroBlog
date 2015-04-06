//
//  WBGeneralViewController.m
//  MicroBlog
//
//  Created by student on 15-3-21.
//  Copyright (c) 2015年 itany. All rights reserved.
//

#import "WBGeneralViewController.h"
#import "WBSettingSwitchItem.h"
#import "WBSettingArrowItem.h"
#import "WBSettingGroup.h"
#import "MBProgressHUD+MJ.h"
#import "SDWebImageManager.h"


@interface WBGeneralViewController ()

@end

@implementation WBGeneralViewController


- (void)viewDidLoad
{
    [super viewDidLoad];

    
    [self setupGroup0];
    [self setupGroup1];
    [self setupGroup2];
    [self setupGroup3];
    [self setupGroup4];
}

- (void)setupGroup0
{
    WBSettingGroup *group = [self addGroup];
    
    WBSettingArrowItem *read = [WBSettingArrowItem itemWithTitle:@"阅读模式" destVcClass:nil];
    
    WBSettingArrowItem *font = [WBSettingArrowItem itemWithTitle:@"字号大小" destVcClass:nil];
    
    WBSettingSwitchItem *mark = [WBSettingSwitchItem itemWithTitle:@"显示备注"];
    
    group.items = @[read, font, mark];
}

- (void)setupGroup1
{
    WBSettingGroup *group = [self addGroup];
    
    WBSettingArrowItem *picture = [WBSettingArrowItem itemWithTitle:@"图片质量设置" destVcClass:nil];
    group.items = @[picture];
}

- (void)setupGroup2
{
    WBSettingGroup *group = [self addGroup];
    
    WBSettingSwitchItem *voice = [WBSettingSwitchItem itemWithTitle:@"声音"];
    group.items = @[voice];
}

- (void)setupGroup3
{
    WBSettingGroup *group = [self addGroup];
    
    WBSettingSwitchItem *language = [WBSettingSwitchItem itemWithTitle:@"多语言环境"];
    group.items = @[language];
}

- (void)setupGroup4
{
    WBSettingGroup *group = [self addGroup];
    
    WBSettingArrowItem *clearCache = [WBSettingArrowItem itemWithTitle:@"清除图片缓存"];
    clearCache.operation = ^{
        // 弹框
        [MBProgressHUD showMessage:@"哥正在帮你拼命清理中..."];
        
        // 执行清除缓存
        NSFileManager *mgr = [NSFileManager defaultManager];
        NSString *cachePath = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject];
        [mgr removeItemAtPath:cachePath error:nil];
        
        // 关闭弹框
        [MBProgressHUD hideHUD];
        
        // 计算缓存文件夹的大小
        //        NSArray *subpaths = [mgr subpathsAtPath:cachePath];
        //        long long totalSize = 0;
        //        for (NSString *subpath in subpaths) {
        //            NSString *fullpath = [cachePath stringByAppendingPathComponent:subpath];
        //            BOOL dir = NO;
        //            [mgr fileExistsAtPath:fullpath isDirectory:&dir];
        //            if (dir == NO) {// 文件
        //                totalSize += [[mgr attributesOfItemAtPath:fullpath error:nil][NSFileSize] longLongValue];
        //            }
        //        }
    };
    
    WBSettingArrowItem *clearHistory = [WBSettingArrowItem itemWithTitle:@"清空搜索历史"];
    group.items = @[clearCache, clearHistory];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self.tableView reloadData];
}


@end
