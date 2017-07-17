//
//  MLSocialManager.m
//  SocialSDKDemo
//
//  Created by 蔡杰 on 2017/7/17.
//  Copyright © 2017年 蔡杰. All rights reserved.
//

#import "MLSocialManager.h"
#import "MLPlatformConfigInterface.h"

@interface MLSocialManager ()

@end

@implementation MLSocialManager {
    
     NSMutableDictionary <NSNumber *, id<MLPlatformConfigInterface>> *_platforms;
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
        _platforms = [[NSMutableDictionary alloc] init];
    }
    return self;
}


- (void)addPlatformWithPlatformType:(MLPlatformType)platformType platform:(id<MLPlatformConfigInterface>)platform {
     _platforms[@(platformType)] = platform;
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
    [_platforms[@(p)] configurePara:config];
}

@end