//
//  MLSocialManager.h
//  SocialSDKDemo
//
//  Created by 蔡杰 on 2017/7/17.
//  Copyright © 2017年 蔡杰. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MLShareInterface.h"
#import "MLSocialDefinition.h"

@protocol MLPlatformConfigInterface;


@interface MLSocialManager : NSObject

+ (instancetype)defaultManager;


- (void)addPlatformWithPlatformType:(MLPlatformType)platformType platform:(id<MLPlatformConfigInterface>)platform;

- (void)addShareChannelWithChannelType:(MLShareChannelType)channelType channel:(Class)channel;

//配置各平台初始化 没有传nil
- (void)setPlaform:(MLPlatformType)platform appKey:(NSString *)appKey  appSecret:(NSString *)appSecret redirectURL:(NSString *)redirectURL;

- (BOOL)handleOpenURL:(NSURL *)url;

- (void)clearHandle;

@end
