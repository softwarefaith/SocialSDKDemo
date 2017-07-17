//
//  MLQQPlatformConfig.m
//  SocialSDKDemo
//
//  Created by 蔡杰 on 2017/7/17.
//  Copyright © 2017年 蔡杰. All rights reserved.
//

#import "MLQQPlatformConfig.h"
#import <TencentOpenAPI/TencentOAuth.h>
#import <TencentOpenAPI/QQApiInterface.h>

@interface MLQQPlatformConfig ()

@end

@implementation MLQQPlatformConfig {
    
     TencentOAuth *_oauth;
}


+ (void)load {
    id<MLPlatformConfigInterface> platform = [[MLQQPlatformConfig alloc] init];
    [[MLSocialManager defaultManager] addPlatformWithPlatformType:[MLQQPlatformConfig platformType] platform:platform];
}


+ (MLPlatformType)platformType {
    
    return MLPlatformTypeQQ;
}

+ (BOOL)isInstalled {
    
     return [QQApiInterface isQQInstalled];;
}

- (void)configurePara:(NSDictionary *)para {
     _oauth = [[TencentOAuth alloc] initWithAppId:para[kMLSocial_appKey] andDelegate:nil];
}

@end
