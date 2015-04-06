//
//  WBSearchBar.m
//  MicroBlog
//
//  Created by student on 15-3-5.
//  Copyright (c) 2015年 itany. All rights reserved.
//

#import "WBSearchBar.h"

@implementation WBSearchBar

+ (instancetype)searchBar
{
    return [[self alloc]init];
}

- (id)initWithFrame:(CGRect)frame
{
    self=[super initWithFrame:frame];
    if (self) {
        //背景
        self.background=[UIImage resizedImageWithName:@"searchbar_textfield_background"];
        
        //左边的放大镜图标
        UIImageView *iconView=[[UIImageView alloc]initWithImage:[UIImage imageWithName:@"searchbar_textfield_search_icon"]];
        iconView.contentMode=UIViewContentModeCenter;
        self.leftView=iconView;
        self.leftViewMode=UITextFieldViewModeAlways;
        
        //字体
        self.font=[UIFont systemFontOfSize:13];
        
        //右边的清除按钮
        self.clearButtonMode=UITextFieldViewModeAlways;

        
        //设置提醒文字
        NSMutableDictionary *attrs=[NSMutableDictionary dictionary];
        attrs[NSForegroundColorAttributeName]=[UIColor grayColor];
        self.attributedPlaceholder=[[NSAttributedString alloc]initWithString:@"搜索" attributes:attrs];
        
        //设置键盘右下角按钮的样式
        self.returnKeyType=UIReturnKeySearch;
        self.enablesReturnKeyAutomatically=YES;
        
    }
    return self;
}


/**
 *  iOS：layoutSubviews的使用浅谈
 layoutSubviews是UIView中的属性方法，即只要继承于UIView，就可以使用这个方法，这个方法也很强大，以下是他的触发时机：

 1、init初始化不会触发layoutSubviews
 2、addSubview会触发layoutSubviews
 3、设置view的Frame会触发layoutSubviews，当然前提是frame的值设置前后发生了变化
 4、滚动一个UIScrollView会触发layoutSubviews
 5、旋转Screen会触发父UIView上的layoutSubviews事件
 6、改变一个UIView大小的时候也会触发父UIView上的layoutSubviews事件
 */
- (void)layoutSubviews
{
    [super layoutSubviews];
    //设置左边图标的frame
    self.leftView.frame=CGRectMake(0, 0, 30, self.frame.size.height);
}
@end
