//
//  WBComposePhotosView.h
//  MicroBlog
//
//  Created by student on 15-3-18.
//  Copyright (c) 2015年 itany. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WBComposePhotosView : UIView

/**
 *  添加一张图片
 */
- (void)addImage:(UIImage *)image;

/**
 *  返回内部所有图片
 */
- (NSArray *)totalImages;
@end
