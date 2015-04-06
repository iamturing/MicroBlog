//
//  WBAccountTool.m
//  MicroBlog
//
//  Created by student on 15-3-7.
//  Copyright (c) 2015年 itany. All rights reserved.
//

#import "WBAccountTool.h"
#import "WBAccount.h"
#import "WBHttpTool.h"
#import "MJExtension.h"

#define WBAccountFile [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"account.data"]

@implementation WBAccountTool
 + (void)saveAccount:(WBAccount *)account
{
    //计算账号的过期时间
    NSDate *now=[NSDate date];
    account.expiresTime=[now dateByAddingTimeInterval:account.expires_in];
    [NSKeyedArchiver archiveRootObject:account toFile:WBAccountFile];
}

+(WBAccount *)account
{
    //取出账号
    WBAccount *account=[NSKeyedUnarchiver unarchiveObjectWithFile:WBAccountFile];
    
    //判断账号是否过期
    NSDate *now =[NSDate date];
    if ([now compare:account.expiresTime]==NSOrderedAscending) { //还没有过期
        return account;
    }else{
        return nil;
    }
}

+ (void)accessTokenWithParam:(WBAccessTokenParam *)param success:(void (^)(WBAccessTokenResult *result))success failure:(void (^)(NSError *error))failure
{
    [WBHttpTool postWithURL:@"https://api.weibo.com/oauth2/access_token" params:param.keyValues success:^(id json) {
        if (success) {
            WBAccessTokenResult *result = [WBAccessTokenResult objectWithKeyValues:json];
            success(result);
        }
    } failure:^(NSError *error) {
        if (failure) {
            failure(error);
        }
    }];
}

@end
