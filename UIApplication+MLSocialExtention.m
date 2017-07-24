//
//  UIApplication+MLSocialExtention.m
//  SocialSDKDemo
//
//  Created by 蔡杰 on 2017/7/17.
//  Copyright © 2017年 蔡杰. All rights reserved.
//

#import "UIApplication+MLSocialExtention.h"
#import "MLSocialManager.h"

@implementation UIApplication (MLSocialExtention)

+ (void)applicationSocialConfig {
    
    
    [[MLSocialManager defaultManager] setPlaform:MLPlatformTypeQQ appKey:kMLQQ_appID appSecret:kMLQQ_appKey redirectURL:nil];
    
       [[MLSocialManager defaultManager] setPlaform:MLPlatformTypeWeChat appKey:kMLWechat_appKey appSecret:nil redirectURL:nil];
    
    
}

@end
