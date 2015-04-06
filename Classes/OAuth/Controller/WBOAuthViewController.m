//
//  WBOAuthViewController.m
//  MicroBlog
//
//  Created by student on 15-3-7.
//  Copyright (c) 2015年 itany. All rights reserved.
//

#import "WBOAuthViewController.h"
#import "WBAccount.h"
#import "WBAccountTool.h"
#import "MBProgressHUD+MJ.h"
#import "WBTool.h"
#import "WBHttpTool.h"

@interface WBOAuthViewController ()<UIWebViewDelegate>

@end

@implementation WBOAuthViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //1.添加webView
    UIWebView *webView=[[UIWebView alloc]init];
    webView.frame=self.view.bounds;
    webView.delegate=self;
    [self.view addSubview:webView];
    
    //加载授权页面（新浪提供的登录界面）
   NSURL *url = [NSURL URLWithString:WBLoginURL];
    NSURLRequest *request=[NSURLRequest requestWithURL:url];
    [webView loadRequest:request];

}

#pragma mark -webView代理方法

/**
 *  webView开始发送请求时就会调用
 */
- (void)webViewDidStartLoad:(UIWebView *)webView
{
    //显示提醒框
    [MBProgressHUD showMessage:@"玩命加载中..."];
}

/**
 *  webView请求完毕的时候就会调用
 */
- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    //隐藏提醒框
    [MBProgressHUD hideHUD];
}

/**
 *  webView请求失败的时候就会调用
 */
- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
     //隐藏提醒框
    [MBProgressHUD hideHUD];
}

/**
 *  当webView发送一个请求之前都会先调用这个方法, 询问代理可不可以加载这个页面(请求)
 *
 *  @return YES : 可以加载页面,  NO : 不可以加载页面
 */
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    //1.请求url绝对路径:http://ios.itcast.cn/?code=0f189b682cd020e79303dbb043d4fb28
    NSString *urlStr=request.URL.absoluteString;
    
    //2.查找code=在urlStr中的范围
    NSRange range=[urlStr rangeOfString:@"code="];
    
    //3.如果urlStr中包含了code=
    if (range.length) {
    
         //4.截取code=后面的请求标记(经过用户授权成功的)
        int loc=range.location + range.length;
        NSString *code=[urlStr substringFromIndex:loc];
        
         //5.发送post请求给新浪，通过code换取一个accessToken
        [self accessTokenWithCode:code];
        
        // 不加载这个请求
        return NO;
    }
    return YES;
}

/**
 *  通过code换取一个accessToken
 */
- (void)accessTokenWithCode:(NSString *)code
{
    
    //1.封装请求参数
    WBAccessTokenParam *param=[[WBAccessTokenParam alloc]init];
    param.client_id=WBAppKey;
    param.client_secret=WBAppSecret;
    param.grant_type=@"authorization_code";
    param.code=code;
    param.redirect_uri=WBRedirectURI;
    
    // 2.发送请求
    [WBAccountTool accessTokenWithParam:param success:^(WBAccessTokenResult *result) {
        // 3.存储模型数据
        [WBAccountTool saveAccount:result];
        
        // 4.新特性\去首页
        [WBTool chooseRootController];
        
        // 5.隐藏提醒框
        [MBProgressHUD hideHUD];
    } failure:^(NSError *error) {
        // 隐藏提醒框
        [MBProgressHUD hideHUD];
    }];
}
@end
