//
//  WBAccessTokenParam.h
//  MicroBlog
//
//  Created by student on 15-3-23.
//  Copyright (c) 2015年 itany. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WBAccessTokenParam : NSObject
@property (nonatomic, copy) NSString *client_id;
@property (nonatomic, copy) NSString *client_secret;
@property (nonatomic, copy) NSString *grant_type;
@property (nonatomic, copy) NSString *code;
@property (nonatomic, copy) NSString *redirect_uri;
@end
