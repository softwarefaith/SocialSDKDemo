//
//  MLShareInterface.h
//  SocialSDKDemo
//
//  Created by 蔡杰 on 2017/7/17.
//  Copyright © 2017年 蔡杰. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MLSocialDefinition.h"
#import "MLHandleInterface.h"
#import "MLShareResultInterface.h"
#import "MLShareResult.h"

typedef void (^MLShareCompletionBlock) (id<MLShareResultInterface> result);

@protocol MLShareInterface <NSObject,MLHandleInterface>

+ (MLPlatformType)platformType;

+ (MLShareChannelType)channelType;

//分享
- (void)shareSimpleText:(NSString *)text;

- (void)shareSingleImage:(id)image title:(NSString *)title description:(NSString *)description;

- (void)shareURL:(NSString *)url title:(NSString *)title description:(NSString *)description thumbnail:(id)thumbnail;

- (void)setShareCompletionBlock:(MLShareCompletionBlock)completionBlock;

@end
