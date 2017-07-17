//
//  MLWeChatFriendsCircleShare.m
//  SocialSDKDemo
//
//  Created by 蔡杰 on 2017/7/17.
//  Copyright © 2017年 蔡杰. All rights reserved.
//

#import "MLWeChatFriendsCircleShare.h"

@implementation MLWeChatFriendsCircleShare


+ (void)load {
    [[MLSocialManager defaultManager] addShareChannelWithChannelType:[MLWeChatFriendsCircleShare channelType] channel:[MLWeChatFriendsCircleShare class]];
}

+ (MLPlatformType)platformType {
    return MLPlatformTypeWeChat;
}

+ (MLShareChannelType)channelType {
    return MLShareChannelTypeWechatFriendsCircle;
}


@end
