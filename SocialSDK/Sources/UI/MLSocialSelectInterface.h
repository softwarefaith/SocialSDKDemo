//
//  MLSocialSelectInterface.h
//  SocialSDKDemo
//
//  Created by 蔡杰 on 2017/7/24.
//  Copyright © 2017年 蔡杰. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger,MLResourceType) {
    MLResourceTypeNone = 0,
    MLResourceTypeQQ = 1,
    MLResourceTypeWechat = 2,
    MLResourceTypeFriend = 3,
    MLResourceTypeCopy = 4
};

typedef void (^MLSelectViewCompletionBlock) (BOOL isCancel, MLResourceType reourcesType);

@protocol MLSocialSelectInterface <NSObject>

@end
