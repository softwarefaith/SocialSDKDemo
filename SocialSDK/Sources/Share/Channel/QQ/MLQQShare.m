//
//  MLQQShare.m
//  SocialSDKDemo
//
//  Created by 蔡杰 on 2017/7/17.
//  Copyright © 2017年 蔡杰. All rights reserved.
//

#import "MLQQShare.h"

@implementation MLQQShare

+ (void)load
{
    [[MLSocialManager defaultManager] addShareChannelWithChannelType:[MLQQShare channelType] channel:[MLQQShare class]];
}

+ (MLPlatformType)platformType
{
    return MLPlatformTypeQQ;
}

+ (MLShareChannelType)channelType
{
    return MLShareChannelTypeQQ;
}

- (void)shareSimpleText:(NSString *)text {
    
}

- (void)shareSingleImage:(id)image title:(NSString *)title description:(NSString *)description {
    
}

- (void)shareURL:(NSString *)url title:(NSString *)title description:(NSString *)description thumbnail:(id)thumbnail {
    
}
@end
