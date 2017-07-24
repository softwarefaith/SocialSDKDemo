//
//  UIApplication+MLSocialExtention.h
//  SocialSDKDemo
//
//  Created by 蔡杰 on 2017/7/17.
//  Copyright © 2017年 蔡杰. All rights reserved.
//

#import <UIKit/UIKit.h>

//项目配置信息

//QQ scheme = tencent + appid

#define kMLQQ_appID @"1105959755"
#define kMLQQ_appKey @"uDxiIPgZAiB8alRZ"

#define kMLWechat_appKey @"wxd3f543edd8683db6"

//.配置ApplicationQueriesSchemes

//QQ “Other Linker Flags”配置项添加属性值“-fobjc-arc”。


/*
 <key>LSApplicationQueriesSchemes</key>
 <array>
 <!-- 微信 URL Scheme 白名单-->
 <string>wechat</string>
 <string>weixin</string>
 
 
 */


@interface UIApplication (MLSocialExtention)

+ (void)applicationSocialConfig;

@end
