//
//  MLShareResult.h
//  SocialSDKDemo
//
//  Created by 蔡杰 on 2017/7/17.
//  Copyright © 2017年 蔡杰. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "MLShareResultInterface.h"

@interface MLShareResult : NSObject<MLShareResultInterface>

@property(nonatomic, assign) MLShareResultStatus status;
@property(nonatomic, assign) NSInteger sourceCode;
@property(nonatomic, copy) NSString *soucreMessage;
@property(nonatomic, copy) NSString *message;

@end
