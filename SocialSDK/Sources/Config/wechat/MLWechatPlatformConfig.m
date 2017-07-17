//
//  MLWechatPlatformConfig.m
//  SocialSDKDemo
//
//  Created by 蔡杰 on 2017/7/17.
//  Copyright © 2017年 蔡杰. All rights reserved.
//

#import "MLWechatPlatformConfig.h"

@implementation MLWechatPlatformConfig

+ (void)load {
    id<MLPlatformConfigInterface> platform = [[MLWechatPlatformConfig alloc] init];
    [[MLSocialManager defaultManager] addPlatformWithPlatformType:[MLWechatPlatformConfig platformType] platform:platform];
}


+ (MLPlatformType)platformType {
    
    return MLPlatformTypeQQ;
}

+ (BOOL)isInstalled {
    
    return YES;
}

- (void)configurePara:(NSDictionary *)para {
    
}

@end