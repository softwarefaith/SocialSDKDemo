//
//  MLWeChatShare.m
//  SocialSDKDemo
//
//  Created by 蔡杰 on 2017/7/17.
//  Copyright © 2017年 蔡杰. All rights reserved.
//

#import "MLWeChatShare.h"

@implementation MLWeChatShare

+ (void)load {
    [[MLSocialManager defaultManager] addShareChannelWithChannelType:[MLWeChatShare channelType] channel:[MLWeChatShare class]];
}

+ (MLPlatformType)platformType {
    return MLPlatformTypeWeChat;
}

+ (MLShareChannelType)channelType {
    return MLShareChannelTypeWechat;
}

@end
