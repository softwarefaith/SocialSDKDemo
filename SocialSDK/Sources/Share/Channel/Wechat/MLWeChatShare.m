//
//  MLWeChatShare.m
//  SocialSDKDemo
//
//  Created by 蔡杰 on 2017/7/17.
//  Copyright © 2017年 蔡杰. All rights reserved.
//

#import "MLWeChatShare.h"
#import "WXApi.h"


@interface MLWeChatShare ()<WXApiDelegate>

@end

@implementation MLWeChatShare

+ (void)load {
    [[MLSocialManager defaultManager] addShareChannelWithChannelType:[MLWeChatShare channelType] channel:[MLWeChatShare class]];
}

+ (MLPlatformType)platformType {
    return MLPlatformTypeWeChat;
}

+ (MLShareChannelType)channelType {
    return MLShareChannelTypeWechat;
}

- (void)shareSimpleText:(NSString *)text
{
    SendMessageToWXReq *req = [[SendMessageToWXReq alloc] init];
    req.bText = YES;
    req.scene = WXSceneSession;
    req.text = text;
    [WXApi sendReq:req];
}

- (void)shareSingleImage:(id)image title:(NSString *)title description:(NSString *)description
{
    WXImageObject *ext = [WXImageObject object];
    if ([image isKindOfClass:[NSData class]]) {
        ext.imageData = image;
    } else if ([image isKindOfClass:[UIImage class]]) {
        ext.imageData = UIImagePNGRepresentation(image);
    }
    WXMediaMessage *message = [WXMediaMessage message];
    message.title = title;
    message.description = description;
    message.mediaObject = ext;
    SendMessageToWXReq *req = [[SendMessageToWXReq alloc] init];
    req.bText = NO;
    req.scene = WXSceneSession;
    req.message = message;
    [WXApi sendReq:req];
}

- (void)shareURL:(NSString *)url title:(NSString *)title description:(NSString *)description thumbnail:(id)thumbnail
{
    WXWebpageObject *ext = [WXWebpageObject object];
    ext.webpageUrl = url;
    
    WXMediaMessage *message = [WXMediaMessage message];
    message.title = title;
    message.description = description;
    message.mediaObject = ext;
    
    if ([thumbnail isKindOfClass:[NSData class]]) {
        message.thumbData = thumbnail;
    } else if ([thumbnail isKindOfClass:[UIImage class]]) {
        message.thumbData = UIImagePNGRepresentation(thumbnail);
    }
    
    SendMessageToWXReq *req = [[SendMessageToWXReq alloc] init];
    req.bText = NO;
    req.scene = WXSceneSession;
    req.message = message;
    [WXApi sendReq:req];
}
- (BOOL)handleOpenURL:(NSURL *)url
{
    return [WXApi handleOpenURL:url delegate:self];
}

#pragma mark - WXApiDelegate
- (void)onResp:(BaseResp *)resp {
    [self completionWithResult:[self createResultWithResponse:resp]];
}

- (id<MLShareResultInterface>)createResultWithResponse:(BaseResp *)response
{
    int errCode = response.errCode;
    MLShareResult *res = [[MLShareResult alloc] init];
    res.sourceCode = errCode;
    res.soucreMessage = @"";
    res.status = MLShareResultStatusFailing;
    switch (errCode) {
        case WXSuccess: {
            res.status = MLShareResultStatusSuccess;
            break;
        }
        case WXErrCodeUserCancel: {
            res.status = MLShareResultStatusCancel;
            break;
        }
        default:
            break;
    }
    return res;
}



@end
