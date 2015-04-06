//
//  WBBaseParam.m
//  MicroBlog
//
//  Created by student on 15-3-19.
//  Copyright (c) 2015年 itany. All rights reserved.
//

#import "WBBaseParam.h"
#import "WBAccount.h"
#import "WBAccountTool.h"

@implementation WBBaseParam

- (id)init
{
    if (self=[super init]) {
        self.access_token=[WBAccountTool account].access_token;
    }
    return self;
}

+ (instancetype)param
{
    return [[self alloc]init];
}

//方法二：
//- (NSString *)access_token
//{
//    if (_access_token == nil) {
//        self.access_token = [IWAccountTool account].access_token;
//    }
//    return _access_token;
//}
@end
