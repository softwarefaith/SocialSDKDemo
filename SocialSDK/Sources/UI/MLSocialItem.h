//
//  MLSocialItem.h
//  SocialSDKDemo
//
//  Created by 蔡杰 on 2017/7/18.
//  Copyright © 2017年 蔡杰. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MLSocialSelectInterface.h"

@interface MLSocialItem : NSObject

@property(nonatomic, copy) NSString *imagePath;
@property(nonatomic, copy) NSString *title;
@property(nonatomic, assign) MLResourceType resourceType;

- (instancetype)initWithImagePath:(NSString *)path title:(NSString *)title resourceType:(MLResourceType)type;

+ (instancetype)createSocialItemWithImagePath:(NSString *)path title:(NSString *)title resourceType:(MLResourceType)type;

@end
