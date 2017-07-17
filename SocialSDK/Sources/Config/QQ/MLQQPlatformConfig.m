//
//  MLQQPlatformConfig.m
//  SocialSDKDemo
//
//  Created by 蔡杰 on 2017/7/17.
//  Copyright © 2017年 蔡杰. All rights reserved.
//

#import "MLQQPlatformConfig.h"

@interface MLQQPlatformConfig ()

@end

@implementation MLQQPlatformConfig


+ (void)load {
    id<MLPlatformConfigInterface> platform = [[MLQQPlatformConfig alloc] init];
    [[MLSocialManager defaultManager] addPlatformWithPlatformType:[MLQQPlatformConfig platformType] platform:platform];
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
