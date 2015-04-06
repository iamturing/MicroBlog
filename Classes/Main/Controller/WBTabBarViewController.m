//
//  WBTabBarViewController.m
//  MicroBlog
//
//  Created by student on 15-3-4.
//  Copyright (c) 2015年 itany. All rights reserved.
//

#import "WBTabBarViewController.h"
#import "WBHomeViewController.h"
#import "WBMessageViewController.h"
#import "WBMeViewController.h"
#import "WBDiscoverViewController.h"
#import "UIImage+ZL.h"
#import "WBTabBar.h"
#import "WBComposeViewController.h"
#import "WBNavgationController.h"
#import "WBUserTool.h"
#import "WBAccount.h"
#import "WBAccountTool.h"


@interface WBTabBarViewController () <WBTabBarDelegate>
/**
 *  自定义tabbar
 */
@property (nonatomic,weak) WBTabBar * customTabBar;
//主页
@property (nonatomic, strong) WBHomeViewController *home;
//消息
@property (nonatomic, strong) WBMessageViewController *message;
//广场
@property (nonatomic, strong) WBDiscoverViewController *discover;
//我
@property (nonatomic, strong) WBMeViewController *me;
@end


@implementation WBTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //初始化tabbar
    [self setupTabbar];
    
    //初始化所有的子控制器
    [self setupAllChildViewControllers];
    
    //定时检查未读数
    NSTimer *timer=[NSTimer scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(checkUnreadCount) userInfo:nil repeats:YES];
    [[NSRunLoop mainRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
    
}

/**
 *  定时检查未读数
 */
- (void)checkUnreadCount
{
    //1.请求参数
    WBUserUnreadCountParam *param=[WBUserUnreadCountParam param];
    param.uid=@([WBAccountTool account].uid);
    
    //2.发送请求
    [WBUserTool userUnreadCountWithParam:param success:^(WBUserUnreadCountResult *result) {
        //3.1设置badgeValue 首页
        self.home.tabBarItem.badgeValue=[NSString stringWithFormat:@"%d",result.status];
    
        //3.2.消息
        self.message.tabBarItem.badgeValue = [NSString stringWithFormat:@"%d", result.messageCount];
        
        //3.3.我
        self.me.tabBarItem.badgeValue = [NSString stringWithFormat:@"%d", result.follower];
        
        //4.设置图标右上角的数字
        [UIApplication sharedApplication].applicationIconBadgeNumber = result.count;

    
    } failure:^(NSError *error) {
        
    }];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    //删除系统自动生成的UITabBarButton
    for (UIView *child in self.tabBar.subviews) {
        if ([child isKindOfClass:[UIControl class]]) {
            [child removeFromSuperview];
        }
    }
}

/**
 *  初始化tabbar
 */
- (void)setupTabbar
{
    WBTabBar *customTabBar=[[WBTabBar alloc]init];
    customTabBar.frame=self.tabBar.bounds;
    customTabBar.delegate=self;
    [self.tabBar addSubview:customTabBar];
    self.customTabBar=customTabBar;
}

#pragma mark -  tarbbar的代理方法
/**
 *  监听tabbar按钮的改变
 *  @param from   原来选中的位置
 *  @param to     最新选中的位置
 */
- (void)tabBar:(WBTabBar *)tabBar didSelectedButtonFrom:(int)from to:(int)to
{
    self.selectedIndex=to;
    if (to == 0) { //点击了首页
        [self.home refresh];
    }
}


/**
 *  监听加号按钮点击
 */
- (void)tabBarDidClickedPlusButton:(WBTabBar *)tabBar
{
    WBComposeViewController *compose = [[WBComposeViewController alloc] init];
    WBNavgationController *nav = [[WBNavgationController alloc] initWithRootViewController:compose];
    [self presentViewController:nav animated:YES completion:nil];
}

/**
 *  初始化所有的子控制器
 */
- (void)setupAllChildViewControllers
{
    //1.首页
    WBHomeViewController *home =[[WBHomeViewController alloc]init];
    [self setupChildViewController:home title:@"首页" imageName:@"tabbar_home" selectedImageName:@"tabbar_home_selected"];
    self.home=home;
    
    //2.消息
    WBMessageViewController *message =[[WBMessageViewController alloc]init];
    [self setupChildViewController:message title:@"消息" imageName:@"tabbar_message_center" selectedImageName:@"tabbar_message_center_selected"];
    self.message=message;
    
    // 3.广场
    WBDiscoverViewController *discover = [[WBDiscoverViewController alloc] init];
    [self setupChildViewController:discover title:@"广场" imageName:@"tabbar_discover" selectedImageName:@"tabbar_discover_selected"];
    self.discover=discover;
    
    // 4.我
    WBMeViewController *me = [[WBMeViewController alloc] init];
    [self setupChildViewController:me title:@"我" imageName:@"tabbar_profile" selectedImageName:@"tabbar_profile_selected"];
    self.me=me;
}

/**
 *  初始化一个子控制器
 *
 *  @param childVc           需要初始化的子控制器
 *  @param title             标题
 *  @param imageName         图标
 *  @param selectedImageName 选中的图标
 */
- (void)setupChildViewController:(UIViewController *)childVc title:(NSString *)title imageName:(NSString *)imageName selectedImageName:(NSString *)selectedImageName
{
    //1.设置控制器的属性
    childVc.title=title;
    
    //设置图标
    childVc.tabBarItem.image=[UIImage imageWithName:imageName];
    //设置选中的图标
    UIImage *selectedImage=[UIImage imageWithName:selectedImageName];
    if (iOS7) {
        childVc.tabBarItem.selectedImage=[selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    }else{
        childVc.tabBarItem.selectedImage=selectedImage;
    }
    
    //2.包装一个导航控制器
    UINavigationController *nav=[[UINavigationController alloc]initWithRootViewController:childVc];
    [self addChildViewController:nav];
    
    //3.添加tabbar内部的按钮
    [self.customTabBar addTabBarButtonWithItem:childVc.tabBarItem];
}

@end

