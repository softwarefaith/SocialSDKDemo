//
//  MLChannelShare.h
//  SocialSDKDemo
//
//  Created by 蔡杰 on 2017/7/17.
//  Copyright © 2017年 蔡杰. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "MLShareInterface.h"
#import "MLSocialManager.h"
#import "MLShareResult.h"
#import "MLShareResultInterface.h"

@interface MLChannelShare : NSObject<MLShareInterface>

- (void)completionWithResult:(id<MLShareResultInterface>)result;


@end
