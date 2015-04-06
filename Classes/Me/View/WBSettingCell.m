//
//  WBSettingCell.m
//  MicroBlog
//
//  Created by student on 15-3-21.
//  Copyright (c) 2015年 itany. All rights reserved.
//

#import "WBSettingCell.h"
#import "WBSettingItem.h"
#import "WBSettingArrowItem.h"
#import "WBSettingSwitchItem.h"
#import "WBSettingLabelItem.h"
#import "WBBadgeButton.h"

@interface WBSettingCell()
/**
 *  箭头
 */
@property (strong, nonatomic) UIImageView *arrowView;
/**
 *  开关
 */
@property (strong, nonatomic) UISwitch *switchView;
/**
 *  提醒数字
 */
@property (strong, nonatomic) WBBadgeButton *badgeButton;

@property (nonatomic, weak) UITableView *tableView;
/**
 *  背景
 */
@property (nonatomic, weak) UIImageView *bgView;
/**
 *  选中背景
 */
@property (nonatomic, weak) UIImageView *selectedBgView;
@end
@implementation WBSettingCell

/**
 *  开关懒加载
 */
- (UISwitch *)switchView
{
    if (_switchView==nil) {
        _switchView=[[UISwitch alloc]init];
    }
    return _switchView;
}

/**
 *  箭头懒加载
 */
- (UIImageView *)arrowView
{
    if (_arrowView == nil) {
        _arrowView = [[UIImageView alloc] initWithImage:[UIImage imageWithName:@"common_icon_arrow"]];
    }
    return _arrowView;
}

/**
 *  提醒按钮懒加载
 */
- (WBBadgeButton *)badgeButton
{
    if (_badgeButton == nil) {
        _badgeButton = [[WBBadgeButton alloc] init];
    }
    return _badgeButton;
}


+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *ID = @"setting";
    WBSettingCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[WBSettingCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:ID];
        cell.tableView = tableView;
    }
    return cell;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        
        // 标题
        self.textLabel.backgroundColor = [UIColor clearColor];
        self.textLabel.textColor = [UIColor blackColor];
        self.textLabel.highlightedTextColor = self.textLabel.textColor;
        self.textLabel.font = [UIFont boldSystemFontOfSize:15];
        
        // 创建背景
        UIImageView *bgView = [[UIImageView alloc] init];
        self.backgroundView = bgView;
        self.bgView = bgView;
        
        UIImageView *selectedBgView = [[UIImageView alloc] init];
        self.selectedBackgroundView = selectedBgView;
        self.selectedBgView = selectedBgView;
    }
    return self;
}

- (void)setFrame:(CGRect)frame
{
    if (iOS7) {
        frame.origin.x = 5;
        frame.size.width -= 10;
    }
    [super setFrame:frame];
}

- (void)setItem:(WBSettingItem *)item
{
    _item=item;
    
    //1.设置数据
    [self setupData];
    
    //2.设置右边的控制
    [self setupRightView];
}

- (void)setIndexPath:(NSIndexPath *)indexPath
{
    _indexPath = indexPath;
    
    // 设置背景的图片
    int totalRows = [self.tableView numberOfRowsInSection:indexPath.section];
    NSString *bgName = nil;
    NSString *selectedBgName = nil;
    if (totalRows == 1) { // 这组就1行
        bgName = @"common_card_background";
        selectedBgName = @"common_card_background_highlighted";
    } else if (indexPath.row == 0) { // 首行
        bgName = @"common_card_top_background";
        selectedBgName = @"common_card_top_background_highlighted";
    } else if (indexPath.row == totalRows - 1) { // 尾行
        bgName = @"common_card_bottom_background";
        selectedBgName = @"common_card_bottom_background_highlighted";
    } else { // 中行
        bgName = @"common_card_middle_background";
        selectedBgName = @"common_card_middle_background_highlighted";
    }
    self.bgView.image = [UIImage resizedImageWithName:bgName];
    self.selectedBgView.image = [UIImage resizedImageWithName:selectedBgName];
}

/**
 *  设置数据
 */
- (void)setupData
{
    //1.图标
    if (self.item.icon) {
        self.imageView.image=[UIImage imageWithName:self.item.icon];
    }
    //2.标题
    self.textLabel.text=self.item.title;
}

/**
 *  设置右边的控件
 */
- (void)setupRightView
{
    if (self.item.badgeValue) {
        self.badgeButton.badgeValue = self.item.badgeValue;
        self.accessoryView = self.badgeButton;
    } else if ([self.item isKindOfClass:[WBSettingSwitchItem class]])
    { // 右边是开关
        self.accessoryView = self.switchView;
    }
    else if ([self.item isKindOfClass:[WBSettingArrowItem class]])
    { // 右边是箭头
        self.accessoryView = self.arrowView;
    }
    else { // 右边没有东西
        self.accessoryView = nil;
    }
}

@end
