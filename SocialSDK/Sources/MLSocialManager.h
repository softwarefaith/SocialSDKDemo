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

- (void)setPlaform:(MLPlatformType)platform appKey:(NSString *)appKey  appSecret:(NSString *)appSecret redirectURL:(NSString *)redirectURL;

@end
