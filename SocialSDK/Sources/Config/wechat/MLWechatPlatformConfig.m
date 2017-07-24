//
//  MLWechatPlatformConfig.m
//  SocialSDKDemo
//
//  Created by 蔡杰 on 2017/7/17.
//  Copyright © 2017年 蔡杰. All rights reserved.
//

#import "MLWechatPlatformConfig.h"
#import "WXApi.h"

@implementation MLWechatPlatformConfig

+ (void)load {
    id<MLPlatformConfigInterface> platform = [[MLWechatPlatformConfig alloc] init];
    [[MLSocialManager defaultManager] addPlatformWithPlatformType:[MLWechatPlatformConfig platformType] platform:platform];
}


+ (MLPlatformType)platformType {
    
    return MLPlatformTypeWeChat;
}

+ (BOOL)isInstalled {
    
    return [WXApi isWXAppInstalled];
}

- (void)configurePara:(NSDictionary *)para {
     [WXApi registerApp:para[kMLSocial_appKey] enableMTA:YES];
    
    
    
    UInt64 typeFlag = MMAPP_SUPPORT_TEXT | MMAPP_SUPPORT_PICTURE | MMAPP_SUPPORT_LOCATION | MMAPP_SUPPORT_VIDEO |MMAPP_SUPPORT_AUDIO | MMAPP_SUPPORT_WEBPAGE | MMAPP_SUPPORT_DOC | MMAPP_SUPPORT_DOCX | MMAPP_SUPPORT_PPT | MMAPP_SUPPORT_PPTX | MMAPP_SUPPORT_XLS | MMAPP_SUPPORT_XLSX | MMAPP_SUPPORT_PDF;
    
    [WXApi registerAppSupportContentFlag:typeFlag];
}



@end
