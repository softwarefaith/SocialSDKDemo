//
//  MLSocialItem.m
//  SocialSDKDemo
//
//  Created by 蔡杰 on 2017/7/18.
//  Copyright © 2017年 蔡杰. All rights reserved.
//

#import "MLSocialItem.h"

@implementation MLSocialItem

- (instancetype)initWithImagePath:(NSString *)path title:(NSString *)title resourceType:(MLResourceType)type{
    
    if (self = [super init]) {
        _imagePath = path;
        _title = title;
        _resourceType = type;
    }
    return self;
}

+(instancetype)createSocialItemWithImagePath:(NSString *)path title:(NSString *)title resourceType:(MLResourceType)type{
    
    return [[MLSocialItem alloc] initWithImagePath:path title:title resourceType:type] ;
}
@end
