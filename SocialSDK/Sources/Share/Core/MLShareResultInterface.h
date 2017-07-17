//
//  MLShareResultInterface.h
//  SocialSDKDemo
//
//  Created by 蔡杰 on 2017/7/17.
//  Copyright © 2017年 蔡杰. All rights reserved.
//

#import <Foundation/Foundation.h>

//结果状态
typedef NS_ENUM(NSInteger,MLShareResultStatus) {
    MLShareResultStatusSuccess,
    MLShareResultStatusFailing,
    MLShareResultStatusCancel,
};

@protocol MLShareResultInterface <NSObject>


- (BOOL)isSuccess;
- (MLShareResultStatus)status;
- (NSInteger)sourceCode;
- (NSString *)soucreMessage;
- (NSString *)message;

@end
