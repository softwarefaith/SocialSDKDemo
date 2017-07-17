//
//  MLPlatformConfig.m
//  SocialSDKDemo
//
//  Created by 蔡杰 on 2017/7/17.
//  Copyright © 2017年 蔡杰. All rights reserved.
//

#import "MLPlatformConfig.h"

@implementation MLPlatformConfig

+ (MLPlatformType)platformType {
    return MLPlatformTypeNone;
}

+ (BOOL)isInstalled {
    return NO;
}

- (void)configurePara:(NSDictionary *)para {
    
}

@end
