//
//  MLSocialManager.m
//  SocialSDKDemo
//
//  Created by 蔡杰 on 2017/7/17.
//  Copyright © 2017年 蔡杰. All rights reserved.
//

#import "MLSocialManager.h"
#import "MLPlatformConfigInterface.h"
#import <UIKit/UIKit.h>

@interface MLSocialManager ()

@end

@implementation MLSocialManager {
    
     NSMutableDictionary <NSNumber *, id<MLPlatformConfigInterface>> *_platformConfig;
    
     NSMutableDictionary <NSNumber *, Class>* _platforms;
    
    id<MLHandleInterface> _handle;

}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

+ (instancetype)defaultManager {
    
    static dispatch_once_t once_t;
    static MLSocialManager *social = nil;
    
    dispatch_once(&once_t, ^{
        social = [[MLSocialManager alloc] init];
    });
    return social;
}

- (instancetype)init {
    if (self == [super init]) {
        _platformConfig = [[NSMutableDictionary alloc] init];
        _platforms = [[NSMutableDictionary alloc] init];
         [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(notification:) name:UIApplicationDidBecomeActiveNotification object:nil];
    }
    return self;
}


- (void)addPlatformWithPlatformType:(MLPlatformType)platformType platform:(id<MLPlatformConfigInterface>)platform {
    if (platform == MLPlatformTypeNone) {
        return;
    }
     _platformConfig[@(platformType)] = platform;
}

- (void)addShareChannelWithChannelType:(MLShareChannelType)channelType channel:(Class)channel {
    if (channelType == MLShareChannelTypeNone) {
        return;
    }
    _platforms[@(channelType)] = channel;
}


- (void)setPlaform:(MLPlatformType)platform appKey:(NSString *)appKey appSecret:(NSString *)appSecret redirectURL:(NSString *)redirectURL {
    
    if (platform == MLPlatformTypeNone) {
        return;
    }
    MLPlatformType p = platform;
    NSDictionary *config = @{
                                 kMLSocial_appKey: appKey,
                                 kMLSocial_appSecret:appSecret,
                                 kMLSocial_redirectURL: redirectURL
                            };
    [_platformConfig[@(p)] configurePara:config];
}

#pragma mark - Handle
- (void)setHandle:(id<MLHandleInterface>)handle {
    
    _handle = handle;
}

- (BOOL)handleOpenURL:(NSURL *)url {
    BOOL res = NO;
    if (_handle) {
        res = [_handle handleOpenURL:url];
    }
    return res;

}

- (void)clearHandle{
    if (_handle) {
        _handle = nil;
    } else {
   
    }
}

- (void)notification:(NSNotification *)notification {
    if ([notification.name isEqualToString:UIApplicationDidBecomeActiveNotification]) {
        [self clearHandle];
    }
}

@end
