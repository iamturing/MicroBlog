//
//  WBTabBarButton.m
//  MicroBlog
//
//  Created by student on 15-3-4.
//  Copyright (c) 2015年 itany. All rights reserved.
//
/**
 *  KVO,即：Key-Value Observing，它提供一种机制，当指定的对象的属性被修改后，则对象就会接受到通知
 *
 * 
 *
 *  @return
 */


//定义图标比例
#define WBTabBarButtonImageRatio 0.6

//定义按钮的默认文字颜色
#define WBTabBarButtonTitleColor (iOS7 ? [UIColor blackColor]:[UIColor whiteColor])

//定义按钮的选中文字颜色
#define WBTabBarButtonTitleSelectedColor (iOS7 ? WBColor (234,103,7) : WBColor (248,139,0))

#import "WBTabBarButton.h"
#import "WBBadgeButton.h"

@interface WBTabBarButton ()

/**
 *  提醒数字
 */
@property (nonatomic,weak) WBBadgeButton * badgeButton;
@end


@implementation WBTabBarButton

- (id)initWithFrame:(CGRect)frame
{
    self=[super initWithFrame:frame];
    if (self) {
        //图标居中
        self.imageView.contentMode=UIViewContentModeCenter;
        
        //文字居中
        self.titleLabel.textAlignment=NSTextAlignmentCenter;
        
        //文字大小
        self.titleLabel.font=[UIFont systemFontOfSize:11];
        
        //文字颜色
        [self setTitleColor:WBTabBarButtonTitleColor forState:UIControlStateNormal ];
        [self setTitleColor:WBTabBarButtonTitleSelectedColor forState:UIControlStateSelected];
    
        if (!iOS7) { //非iOS下设置按钮选中时的背景
            [self setBackgroundImage:[UIImage imageWithName:@"tabbar_slider"] forState:UIControlStateSelected];
        }
        
        //添加一个提醒数字的按钮
        WBBadgeButton *badgeButton=[[WBBadgeButton alloc]init];
        badgeButton.autoresizingMask=UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleBottomMargin;
        [self addSubview:badgeButton];
        self.badgeButton=badgeButton;
    }
    return self;
}

/**
 *  重写父类方法去掉高亮状态
 */
- (void)setHighlighted:(BOOL)highlighted{}


/**
 *  内部图片的frame
 */
- (CGRect)imageRectForContentRect:(CGRect)contentRect
{
    CGFloat imageW=contentRect.size.width;
    CGFloat imageH=contentRect.size.height * WBTabBarButtonImageRatio;
    return CGRectMake(0,0, imageW, imageH);
}

/**
 *  内部文字的frame
 */
- (CGRect)titleRectForContentRect:(CGRect)contentRect
{
    CGFloat titleY=contentRect.size.height * WBTabBarButtonImageRatio;
    CGFloat titleW=contentRect.size.width;
    CGFloat titleH=contentRect.size.height -titleY;
    return CGRectMake(0, titleY, titleW, titleH);
}

//设置item
- (void)setItem:(UITabBarItem *)item
{
    _item=item;
    
    //KVO 监听属性的改变
    [item addObserver:self forKeyPath:@"badgeValue" options:0 context:nil];
    [item addObserver:self forKeyPath:@"title" options:0 context:nil];
    [item addObserver:self forKeyPath:@"image" options:0 context:nil];
    [item addObserver:self forKeyPath:@"selectedImage" options:0 context:nil];
    
    [self observeValueForKeyPath:nil ofObject:nil change:nil context:nil];
}

- (void)dealloc
{
    [self.item removeObserver:self forKeyPath:@"badgeValue"];
    [self.item removeObserver:self forKeyPath:@"title"];
    [self.item removeObserver:self forKeyPath:@"image"];
    [self.item removeObserver:self forKeyPath:@"selectedImage"];
}

/**
 *  监听到某个对象的属性改变了，就会调用
 *
 *  @param keyPath 属性名
 *  @param object  哪个对象的属性被改变
 *  @param change  属性发生的改变
 */
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    //设置文字
    [self setTitle:self.item.title forState:UIControlStateSelected];
    [self setTitle:self.item.title forState:UIControlStateNormal];
    
    //设置图片
    [self setImage:self.item.image forState:UIControlStateNormal];
    [self setImage:self.item.selectedImage forState:UIControlStateSelected];
    
    //设置提醒数字
    self.badgeButton.badgeValue=self.item.badgeValue;
    
    //设置提醒数字的位置
    CGFloat badgeY=5;
    CGFloat badgeX=self.frame.size.width-self.badgeButton.frame.size.width-10;
    CGRect badgeF=self.badgeButton.frame;
    badgeF.origin.x=badgeX;
    badgeF.origin.y =badgeY;
    self.badgeButton.frame=badgeF;
}

@end