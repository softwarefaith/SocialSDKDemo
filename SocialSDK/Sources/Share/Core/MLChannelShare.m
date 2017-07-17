//
//  MLChannelShare.m
//  SocialSDKDemo
//
//  Created by 蔡杰 on 2017/7/17.
//  Copyright © 2017年 蔡杰. All rights reserved.
//

#import "MLChannelShare.h"

@implementation MLChannelShare

+ (MLPlatformType)platformType {
    return MLPlatformTypeNone;
}

+ (MLShareChannelType)channelType {
    return MLShareChannelTypeNone;
}

//分享
- (void)shareSimpleText:(NSString *)text {
    
}

- (void)shareSingleImage:(id)image title:(NSString *)title description:(NSString *)description {
    
}

- (void)shareURL:(NSString *)url title:(NSString *)title description:(NSString *)description thumbnail:(id)thumbnail {
    
}

@end
