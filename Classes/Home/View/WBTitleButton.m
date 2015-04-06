//
//  WBTitleButton.m
//  MicroBlog
//
//  Created by student on 15-3-5.
//  Copyright (c) 2015年 itany. All rights reserved.
//  导航栏上面的标题按钮

#import "WBTitleButton.h"


#define WBTitleButtonImageW 20
@implementation WBTitleButton

+ (instancetype)titleButton
{
    return [[self alloc]init];
}

- (id)initWithFrame:(CGRect)frame
{
    self=[super initWithFrame:frame];
    if (self) {
        //高亮状态不要自动调整图标
        self.adjustsImageWhenHighlighted=NO;
        self.titleLabel.font=[UIFont boldSystemFontOfSize:19];
        self.imageView.contentMode=UIViewContentModeCenter;
        self.titleLabel.textAlignment=NSTextAlignmentRight;
        
        //背景
        [self setBackgroundImage:[UIImage resizedImageWithName:@"navigationbar_filter_background_highlighted"] forState:UIControlStateHighlighted];
        [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    }
    return self;
}

- (CGRect)imageRectForContentRect:(CGRect)contentRect
{
    CGFloat imageY=0;
    CGFloat imageW=WBTitleButtonImageW;
    CGFloat imageX=contentRect.size.width-imageW;
    CGFloat imageH=contentRect.size.height;
    return CGRectMake(imageX,imageY , imageW, imageH);
}


- (CGRect)titleRectForContentRect:(CGRect)contentRect
{
    CGFloat titleY = 0;
    CGFloat titleX = 0;
    CGFloat titleW = contentRect.size.width - WBTitleButtonImageW;
    CGFloat titleH = contentRect.size.height;
    return CGRectMake(titleX, titleY, titleW, titleH);
}

- (void)setTitle:(NSString *)title forState:(UIControlState)state
{
    // 根据title计算自己的宽度
    CGFloat titleW = [title sizeWithFont:self.titleLabel.font].width;
    
    CGRect frame = self.frame;
    frame.size.width = titleW + WBTitleButtonImageW + 5;
    self.frame = frame;
    
    [super setTitle:title forState:state];
}
@end
