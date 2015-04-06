//
//  WBDiscoverHeaderView.m
//  MicroBlog
//
//  Created by student on 15-3-21.
//  Copyright (c) 2015年 itany. All rights reserved.
//

#import "WBDiscoverHeaderView.h"
#import "WBDiscoverGridView.h"

@interface WBDiscoverHeaderView()
@property (weak, nonatomic) UIImageView *topImageView;
@property (weak, nonatomic) WBDiscoverGridView *gridView;
@end

@implementation WBDiscoverHeaderView
+ (instancetype)headerView
{
    return [[self alloc] init];
}

- (id)initWithFrame:(CGRect)frame
{
    frame.size.height = 180;
    self = [super initWithFrame:frame];
    if (self) {
        // 1.头部图片
        UIImageView *topImageView = [[UIImageView alloc] init];
        topImageView.image = [UIImage imageWithName:@"square_ad"];
        [self addSubview:topImageView];
        self.topImageView = topImageView;
        
        // 2.中间格子内容
        WBDiscoverGridView *gridView = [WBDiscoverGridView gridView];
        gridView.gridData = @[@"网博iOS", @"上海iOS招聘", @"学习iOS,年薪10万", @"面试宝典"];
        [self addSubview:gridView];
        self.gridView = gridView;
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    // 1.头部图片
    CGFloat topX = WBSettingTableBorder + 2;
    CGFloat topY = WBSettingCellMargin;
    CGFloat topW = self.frame.size.width - 2 * topX;
    CGFloat topH = self.topImageView.image.size.height;
    self.topImageView.frame = CGRectMake(topX, topY, topW, topH);
    
    // 2.格子
    CGFloat gridX = WBSettingTableBorder;
    CGFloat gridY = CGRectGetMaxY(self.topImageView.frame) + WBSettingCellMargin;
    CGFloat gridW = self.frame.size.width - 2 * gridX;
    CGFloat gridH = self.frame.size.height - gridY - WBSettingCellMargin;
    self.gridView.frame = CGRectMake(gridX, gridY, gridW, gridH);
}

@end
