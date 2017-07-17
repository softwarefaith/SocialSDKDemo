//
//  MLPlatformConfigInterface.h
//  SocialSDKDemo
//
//  Created by 蔡杰 on 2017/7/17.
//  Copyright © 2017年 蔡杰. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MLSocialDefinition.h"

@protocol MLPlatformConfigInterface <NSObject>

+ (MLPlatformType)platformType;

+ (BOOL)isInstalled;

- (void)configurePara:(NSDictionary *)para;

@end
