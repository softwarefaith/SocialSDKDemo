//
//  MLWeChatFriendsCircleShare.m
//  SocialSDKDemo
//
//  Created by 蔡杰 on 2017/7/17.
//  Copyright © 2017年 蔡杰. All rights reserved.
//

#import "MLWeChatFriendsCircleShare.h"

#import "WXApi.h"

@interface MLWeChatFriendsCircleShare ()<WXApiDelegate>

@end

@implementation MLWeChatFriendsCircleShare


+ (void)load {
    [[MLSocialManager defaultManager] addShareChannelWithChannelType:[MLWeChatFriendsCircleShare channelType] channel:[MLWeChatFriendsCircleShare class]];
}

+ (MLPlatformType)platformType {
    return MLPlatformTypeWeChat;
}

+ (MLShareChannelType)channelType {
    return MLShareChannelTypeWechatFriendsCircle;
}

- (void)shareSimpleText:(NSString *)text
{
    SendMessageToWXReq *req = [[SendMessageToWXReq alloc] init];
    req.bText = YES;
    req.scene = WXSceneTimeline;
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
    req.scene = WXSceneTimeline;
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
    req.scene = WXSceneTimeline;
    req.message = message;
    [WXApi sendReq:req];
}

- (void)onResp:(BaseResp *)resp
{
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

- (BOOL)handleOpenURL:(NSURL *)url
{
    return [WXApi handleOpenURL:url delegate:self];
}


@end
