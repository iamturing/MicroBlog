//
//  WBTool.m
//  MicroBlog
//
//  Created by student on 15-3-7.
//  Copyright (c) 2015年 itany. All rights reserved.
//

#import "WBTool.h"
#import "WBTabBarViewController.h"
#import "WBNewFeatureViewController.h"

@implementation WBTool

+ (void)chooseRootController
{
    NSString *key=@"CFBundleVersion";
    
    //取出沙盒中存储的上次使用的版本号
    NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
    NSString *lastVersion=[defaults stringForKey:key];
    
    //获得当前软件的版本号
    NSString *currentVersion=[NSBundle mainBundle].infoDictionary[key];
    if ([currentVersion isEqualToString:lastVersion]) {
        // 显示状态栏
        [UIApplication sharedApplication].statusBarHidden=NO;
        [UIApplication sharedApplication].keyWindow.rootViewController=[[WBTabBarViewController alloc]init];
    }else{ //新版本
        [UIApplication sharedApplication].keyWindow.rootViewController=[[WBNewFeatureViewController alloc]init];
        
        //存储新版本
        [defaults setObject:currentVersion forKey:key];
        [defaults synchronize];
    }
}
@end
