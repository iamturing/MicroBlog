//
//  WBTextView.m
//  MicroBlog
//
//  Created by student on 15-3-18.
//  Copyright (c) 2015年 itany. All rights reserved.
//

#import "WBTextView.h"

@interface WBTextView ()
@property (nonatomic, strong)UILabel *placeholderLabel;
@end

@implementation WBTextView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //1.添加提示文字
        UILabel *placeholderLabel=[[UILabel alloc]init];
        placeholderLabel.textColor=[UIColor lightGrayColor];
        placeholderLabel.hidden=YES;       //隐藏
        placeholderLabel.numberOfLines=0;  //换行
        placeholderLabel.backgroundColor=[UIColor clearColor];  //背景颜色
        placeholderLabel.font=self.font;    //字体
        [self insertSubview:placeholderLabel atIndex:0];
        self.placeholderLabel=placeholderLabel;
        
        //2.监听textView文字改变的通知
        [WBNotificationCenter addObserver:self selector:@selector(textDidChange) name:UITextViewTextDidChangeNotification object:self];
    }
    return self;
}

- (void)dealloc
{
    [WBNotificationCenter removeObserver:self];
}

/**
 *  监听文字长度不为零，隐藏placeholderLabel
 */
- (void)textDidChange
{
    self.placeholderLabel.hidden=(self.text.length !=0);
}


- (void)setPlaceholder:(NSString *)placeholder
{
    _placeholder=[placeholder copy];
    
    self.placeholderLabel.text=placeholder;
    if (placeholder.length) {  //需要显示
        self.placeholderLabel.hidden=NO;
    
    //计算frame
    CGFloat placeholderX=5;
    CGFloat placeholderY=7;
    CGFloat maxW=self.frame.size.width-2*placeholderX;
    CGFloat maxH=self.frame.size.height- 2*placeholderY;
    CGSize placeholderSize=[placeholder sizeWithFont:self.placeholderLabel.font constrainedToSize:CGSizeMake(maxW,maxH)];
    self.placeholderLabel.frame = CGRectMake(placeholderX, placeholderY, placeholderSize.width, placeholderSize.height);
    } else {
        self.placeholderLabel.hidden = YES;
    }

}

/**
 *  设置placeholder颜色
 */
- (void)setPlaceholderColor:(UIColor *)placeholderColor
{
    _placeholderColor=placeholderColor;
    self.placeholderLabel.textColor=placeholderColor;
}

/**
 *  设置字体
 */
- (void)setFont:(UIFont *)font
{
    [super setFont:font];
    self.placeholderLabel.font=font;
    self.placeholder=self.placeholder;
}



@end
