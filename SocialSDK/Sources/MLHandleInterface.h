//
//  MLHandleInterface.h
//  SocialSDKDemo
//
//  Created by 蔡杰 on 2017/7/17.
//  Copyright © 2017年 蔡杰. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol MLHandleInterface <NSObject>

// 支持所有iOS系统
- (BOOL)handleOpenURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation;

//仅支持iOS9以上系统，iOS8及以下系统不会回调
- (BOOL)handleOpenURL:(NSURL *)url options:(NSDictionary<NSString *, id> *)options;

//支持目前所有iOS系统
- (BOOL)handleOpenURL:(NSURL *)url;


@end
