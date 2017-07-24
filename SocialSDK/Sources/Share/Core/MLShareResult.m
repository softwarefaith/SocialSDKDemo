//
//  MLShareResult.m
//  SocialSDKDemo
//
//  Created by 蔡杰 on 2017/7/17.
//  Copyright © 2017年 蔡杰. All rights reserved.
//

#import "MLShareResult.h"

@implementation MLShareResult

- (BOOL)isSuccess{
    return (_status == MLShareResultStatusSuccess);
}

- (NSString *)message{
    
    NSString *res = _message;
    if (res == nil) {
        switch (_status) {
            case MLShareResultStatusSuccess: {
                res = @"分享成功";
                break;
            }
            case MLShareResultStatusFailing: {
                res = @"分享失败";
                break;
            }
            case MLShareResultStatusCancel: {
                res = @"取消分享";
                break;
            }
            default:
                break;
        }
    }
    return res;
}

- (NSString *)description {
    
    return [NSString stringWithFormat:@"%zd == %@  == %@",_status,_message,_soucreMessage];
}

@end
