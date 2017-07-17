//
//  MLSocialDefinition.h
//  SocialSDKDemo
//
//  Created by 蔡杰 on 2017/7/17.
//  Copyright © 2017年 蔡杰. All rights reserved.
//

#ifndef MLSocialDefinition_h
#define MLSocialDefinition_h


#define kMLSocial_appKey @"appKey"
#define kMLSocial_appSecret @"appSecret"
#define kMLSocial_redirectURL @"redirectURL"


//支持平台
typedef NS_ENUM (NSInteger,MLPlatformType){
    MLPlatformTypeNone,
    MLPlatformTypeSina,
    MLPlatformTypeQQ,
    MLPlatformTypeWeChat
};

//支持分享渠道类型
typedef NS_ENUM (NSInteger,MLShareChannelType){
    MLShareChannelTypeNone,//未定义渠道
    MLShareChannelTypeQQ,//QQ聊天分享
    MLShareChannelTypeWechatSession,//微信聊天分享
    MLShareChannelTypeWechatTimeLine//微信朋友圈分享
};

#endif /* MLSocialDefinition_h */
