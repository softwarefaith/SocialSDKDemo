//
//  MLSocialSelectView.h
//  SocialSDKDemo
//
//  Created by 蔡杰 on 2017/7/24.
//  Copyright © 2017年 蔡杰. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MLSocialSelectInterface.h"

@class MLSocialItem;

@interface MLSocialSelectView : UIWindow <MLSocialSelectInterface>

@property(nonatomic ,copy) NSString *title;

@property(nonatomic, strong) UIWindow *window;

- (instancetype)initWithChannels:(NSArray<MLSocialItem *> *)channels completionBlock:(MLSelectViewCompletionBlock)completionBlock;

- (void)show;

@end
