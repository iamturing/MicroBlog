//
//  WBMoreViewController.m
//  MicroBlog
//
//  Created by student on 15-3-21.
//  Copyright (c) 2015年 itany. All rights reserved.
//

#import "WBMoreViewController.h"
#import "WBSettingArrowItem.h"
#import "WBSettingGroup.h"

@interface WBMoreViewController ()

@end

@implementation WBMoreViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    WBSettingGroup *group = [self addGroup];
    
    WBSettingArrowItem *shop = [WBSettingArrowItem itemWithIcon:@"shop" title:@"精选商品" destVcClass:nil];
    WBSettingArrowItem *lottery = [WBSettingArrowItem itemWithIcon:@"lottery" title:@"彩票" destVcClass:nil];
    WBSettingArrowItem *food = [WBSettingArrowItem itemWithIcon:@"food" title:@"美食" destVcClass:nil];
    WBSettingArrowItem *car = [WBSettingArrowItem itemWithIcon:@"car" title:@"汽车" destVcClass:nil];
    WBSettingArrowItem *tour = [WBSettingArrowItem itemWithIcon:@"tour" title:@"旅游" destVcClass:nil];
    WBSettingArrowItem *news = [WBSettingArrowItem itemWithIcon:@"news" title:@"新浪新闻" destVcClass:nil];
    WBSettingArrowItem *recommend = [WBSettingArrowItem itemWithIcon:@"recommend" title:@"官方推荐" destVcClass:nil];
    WBSettingArrowItem *read = [WBSettingArrowItem itemWithIcon:@"read" title:@"读书" destVcClass:nil];
    
    group.items = @[shop, lottery, food, car, tour, news, recommend, read];
}

@end
