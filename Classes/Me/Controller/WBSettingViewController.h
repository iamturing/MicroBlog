//
//  WBSettingViewController.h
//  MicroBlog
//
//  Created by student on 15-3-21.
//  Copyright (c) 2015年 itany. All rights reserved.
//

#import <UIKit/UIKit.h>
@class WBSettingGroup;

@interface WBSettingViewController : UITableViewController
@property (nonatomic, strong) NSMutableArray * groups;

- (WBSettingGroup *)addGroup;
@end
