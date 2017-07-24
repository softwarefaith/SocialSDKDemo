//
//  MLSoicalUIManager.m
//  SocialSDKDemo
//
//  Created by 蔡杰 on 2017/7/24.
//  Copyright © 2017年 蔡杰. All rights reserved.
//

#import "MLSoicalUIManager.h"
#import "MLSocialSelectView.h"
#import "MLSocialItem.h"

@implementation MLSoicalUIManager

+ (void)showShareViewWithChannels:(NSArray<NSNumber *> *)channels completionBlock:(MLSelectViewCompletionBlock)completionBlock {
    
    //channels 映射
    NSMutableArray *items = [NSMutableArray array];

    for (NSNumber *num in channels) {
        
        @autoreleasepool {
            NSString *path;
            NSString *title;
            [self mapFromResourceType:num toImageString:&path title:&title];
            [items addObject:[MLSocialItem createSocialItemWithImagePath:path title:title resourceType:[num integerValue]]];
        }
    }
    MLSocialSelectView *selectView = [[MLSocialSelectView alloc] initWithChannels:items completionBlock:completionBlock];
    selectView.window = selectView;
    [selectView makeKeyAndVisible];
    [selectView show];
}

+ (void)mapFromResourceType:(NSNumber *)type toImageString:(NSString **)aImagePath title:(NSString **)aTitle {
    
    NSInteger restype = [type integerValue];
    
    switch (restype) {
        case MLResourceTypeNone:{
            break;
        }
        case MLResourceTypeQQ:{
            *aImagePath = [self fetchBundlePath:@"social_qq"];
            *aTitle = @"QQ";
            break;
        }
        case MLResourceTypeFriend:{
            *aImagePath = [self fetchBundlePath:@"social_friends"];
            *aTitle = @"朋友圈";
            break;
        }
        case MLResourceTypeWechat:{
            *aImagePath = [self fetchBundlePath:@"social_wechat"];
            *aTitle = @"微信好友";
             break;
        }
        case MLResourceTypeCopy: {
            *aImagePath = [self fetchBundlePath:@"social_copy"];
            *aTitle = @"复制链接";
            break;
        }
        default:
            break;
    }
}

+ (NSString *)fetchBundlePath:(NSString *)image {
    
  return  [NSString stringWithFormat:@"MLSocialResourse.bundle/%@",image];
}

+ (MLShareChannelType)mapFromResourceType:(MLResourceType)type {
    
    switch (type) {
        case MLResourceTypeQQ:{
            return MLShareChannelTypeQQ;
            break;
        }
        case MLResourceTypeFriend: {
            
            return MLShareChannelTypeWechatFriendsCircle;
            break;
        }
        case MLResourceTypeWechat:{
            return MLShareChannelTypeWechat;
            break;
        }
        case MLResourceTypeCopy:{
            
            break;
        }
            break;
            
        default:
            break;
    }
    
    return MLShareChannelTypeNone;
}

@end
