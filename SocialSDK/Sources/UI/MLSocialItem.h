//
//  MLSocialItem.h
//  SocialSDKDemo
//
//  Created by 蔡杰 on 2017/7/18.
//  Copyright © 2017年 蔡杰. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^ExecuteBlock)();

@interface MLSocialItem : NSObject

@property(nonatomic, copy) NSString *image;
@property(nonatomic, copy) NSString *title;
@property(nonatomic, copy) ExecuteBlock execute;

@end
