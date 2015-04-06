//
//  WBComposeToolbar.h
//  MicroBlog
//
//  Created by student on 15-3-18.
//  Copyright (c) 2015年 itany. All rights reserved.
//

#import <UIKit/UIKit.h>
@class WBComposeToolbar;

/**
 *  自定义枚举
 */
typedef enum {
    WBComposeToolbarButtonTypeCamera,
    WBComposeToolbarButtonTypePicture,
    WBComposeToolbarButtonTypeMention,
    WBComposeToolbarButtonTypeTrend,
    WBComposeToolbarButtonTypeEmotion
}WBComposeToolbarButtonType;

/**
 *  自定义发微博协议
 */
@protocol WBComposeToolbarDelegate <NSObject>
@optional
- (void)composeToolbar:(WBComposeToolbar *)toolbar didClickedButton:(WBComposeToolbarButtonType)buttonType;
@end



@interface WBComposeToolbar : UIView
/**
 *  代理属性
 */
@property (nonatomic,weak) id<WBComposeToolbarDelegate> delegate;
@end
