//
//  MLSoicalUIManager.h
//  SocialSDKDemo
//
//  Created by 蔡杰 on 2017/7/24.
//  Copyright © 2017年 蔡杰. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MLSocialSelectInterface.h"
#import "MLSocialDefinition.h"


@interface MLSoicalUIManager : NSObject


+ (void)showShareViewWithChannels:(NSArray <NSNumber *> *)channels completionBlock:(MLSelectViewCompletionBlock)completionBlock;

+ (MLShareChannelType)mapFromResourceType:(MLResourceType)type;


@end
