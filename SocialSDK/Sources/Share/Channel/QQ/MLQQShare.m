//
//  MLQQShare.m
//  SocialSDKDemo
//
//  Created by 蔡杰 on 2017/7/17.
//  Copyright © 2017年 蔡杰. All rights reserved.
//

#import "MLQQShare.h"
#import <TencentOpenAPI/QQApiInterface.h>

@interface MLQQShare () <QQApiInterfaceDelegate>

@end


@implementation MLQQShare

+ (void)load {
    [[MLSocialManager defaultManager] addShareChannelWithChannelType:[MLQQShare channelType] channel:[MLQQShare class]];
}

+ (MLPlatformType)platformType {
    return MLPlatformTypeQQ;
}

+ (MLShareChannelType)channelType {
    return MLShareChannelTypeQQ;
}

- (void)shareSimpleText:(NSString *)text {
    QQApiTextObject *txtObj = [QQApiTextObject objectWithText:text];
    SendMessageToQQReq *request = [SendMessageToQQReq reqWithContent:txtObj];
    QQApiSendResultCode sent = [QQApiInterface sendReq:request];
    [self handleSendResult:sent];
}

- (void)shareSingleImage:(id)image title:(NSString *)title description:(NSString *)description {
    QQApiImageObject *img;
    if ([image isKindOfClass:[NSData class]]) {
        img = [QQApiImageObject objectWithData:image previewImageData:image title:title description:description];
    } else if ([image isKindOfClass:[UIImage class]]) {
        img = [QQApiImageObject objectWithData:UIImagePNGRepresentation(image) previewImageData:UIImagePNGRepresentation(image) title:title description:description];
    }
    [img setCflag:kQQAPICtrlFlagQQShare];
    SendMessageToQQReq *req = [SendMessageToQQReq reqWithContent:img];
    QQApiSendResultCode sent = [QQApiInterface sendReq:req];
    [self handleSendResult:sent];
}

- (void)shareURL:(NSString *)url title:(NSString *)title description:(NSString *)description thumbnail:(id)thumbnail {
    QQApiNewsObject *obj;
    if ([thumbnail isKindOfClass:[NSData class]]) {
        obj = [QQApiNewsObject objectWithURL:[NSURL URLWithString:url] title:title description:description previewImageData:thumbnail];
    } else if ([thumbnail isKindOfClass:[UIImage class]]) {
        obj = [QQApiNewsObject objectWithURL:[NSURL URLWithString:url] title:title description:description previewImageData:UIImagePNGRepresentation(thumbnail)];
    }
    [obj setCflag:kQQAPICtrlFlagQQShare];
    SendMessageToQQReq *req = [SendMessageToQQReq reqWithContent:obj];
    QQApiSendResultCode sent = [QQApiInterface sendReq:req];
    [self handleSendResult:sent];
}

- (void)handleSendResult:(QQApiSendResultCode)sendResult {
    if (sendResult != EQQAPISENDSUCESS) {
        [self completionWithResult:[self createErrorResult:sendResult]];
    }
}


- (BOOL)handleOpenURL:(NSURL *)url {
    return [QQApiInterface handleOpenURL:url delegate:self];
}
#pragma mark QQApiInterfaceDelegate
- (void)onResp:(QQBaseResp *)resp {
    [self completionWithResult:[self createResultWithResponse:resp]];
}

- (void)onReq:(QQBaseReq *)req {
    
}

- (void)isOnlineResponse:(NSDictionary *)response {
    
}

#pragma mark - Private
- (id<MLShareResultInterface>)createErrorResult:(QQApiSendResultCode)sendResult {
    MLShareResult *res = [[MLShareResult alloc] init];
    res.sourceCode = sendResult;
    res.status = MLShareResultStatusFailing;
    return res;
}

- (id<MLShareResultInterface>)createResultWithResponse:(QQBaseResp *)response {
    NSInteger resultCode = [response.result integerValue];
    MLShareResult *res = [[MLShareResult alloc] init];
    res.sourceCode = resultCode;
    res.soucreMessage = @"";
    res.status = MLShareResultStatusFailing;
    switch (resultCode) {
        case 0: {
            res.status = MLShareResultStatusSuccess;
            break;
        }
        case -4:{
            res.status = MLShareResultStatusCancel;
            break;
        }
        default:
            break;
    }
    
    return res;
}



@end
