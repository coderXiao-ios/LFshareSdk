//
//  LFWBApiPlugIn.m
//  UmengSharePlugInDemo
//
//  Created by Xiao Xiao on 2018/8/29.
//  Copyright © 2018年 Xiao Xiao. All rights reserved.
//

#import "LFWBApiPlugIn.h"
#import "LFShareConst.h"
#import "UIImage+Tailoring.h"
@interface LFWBApiPlugIn()
@property (strong, nonatomic) WBAuthorizeRequest *request;
//qq
@property (strong, nonatomic) WBAuthorizeRequest * wbOauth;
@end
@implementation LFWBApiPlugIn
+ (LFWBApiPlugIn *)sharedInstance
{
    static LFWBApiPlugIn * sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[LFWBApiPlugIn alloc] init];
        sharedInstance.request = [WBAuthorizeRequest request];
    });
    return sharedInstance;
}
//登录方法
- (void)WBOauthLogin
{
    self.request = [WBAuthorizeRequest request];
    self.request.redirectURI = LFShareRedirectURL;
    self.request.scope = @"all";
    self.request.userInfo = @{@"SSO_From": NSStringFromClass([self class]),
                              @"Other_Info_1": [NSNumber numberWithInt:123],
                              @"Other_Info_2": @[@"obj1", @"obj2"],
                              @"Other_Info_3": @{@"key1": @"obj1", @"key2": @"obj2"}};
    self.wbOauth = self.request;
    [WeiboSDK sendRequest:self.request];
}
//向微博注册
-(BOOL)WBRegister:(BOOL)enabled{
    //是否打开bug调试
    [WeiboSDK enableDebugMode:enabled];
    return [WeiboSDK registerApp:LFSinaAppkey];
}
//是否安装微博
- (BOOL)isWBAppInstalled
{
    return [WeiboSDK isWeiboAppInstalled];
}
//移除代理
- (void)delegateDealloc{
    self.wbDelegate = nil;
}
//分享图片
- (BOOL)sharedImageToSinaWeibo:(NSString *) message
                         image:(UIImage *)image
{
    self.request.redirectURI = LFShareRedirectURL;
    self.request.scope = @"all";
    UIImage *compressedImage = [image imageWithFileSize:10*1024*1024];
    NSData *imageData = UIImageJPEGRepresentation(compressedImage,1.0);
    WBMessageObject *wbMessageObject = [WBMessageObject message];
    if (wbMessageObject != nil)
    {
        wbMessageObject.text = message;
    }
    
    if ([imageData length] > 0)
    {
        WBImageObject *imageObj = [WBImageObject object];
        imageObj.imageData = imageData;
        wbMessageObject.imageObject = imageObj;
    }
    WBSendMessageToWeiboRequest *request = [WBSendMessageToWeiboRequest requestWithMessage:wbMessageObject authInfo:self.request access_token:nil];
    request.userInfo = @{@"ShareMessageFrom": @"SinaWeiboShare"};
    
    request.shouldOpenWeiboAppInstallPageIfNotInstalled = NO;
    return [WeiboSDK sendRequest:request];
}
//分享网页
- (BOOL)sharedLinkToSinaWeiboWithTitle:(nonnull NSString*)title
                                webURL:(nullable NSString *)webURL
                               message:(nullable NSString *) message
                            coverImage:(nullable UIImage*)coverImage;
{
    self.request.redirectURI = LFShareRedirectURL;
    self.request.scope = @"all";
    //实测缩略图限制为(?, ?)
    UIImage *compressedImage = coverImage?[coverImage imageWithFileSize:32*1024 scaledToSize:CGSizeMake(120, 120)]:nil;
    NSData *imageData = coverImage?UIImageJPEGRepresentation(compressedImage,1.0):nil;
    WBMessageObject *wbMessageObject = [WBMessageObject message];
    if (wbMessageObject != nil)
    {
        wbMessageObject.text = message;
    }
    
    if ([webURL length] > 0)
    {
        WBWebpageObject *webObj = [WBWebpageObject object];
        webObj.objectID = [NSString stringWithFormat:@"%d",arc4random()%1000000];
        webObj.webpageUrl = webURL;
        webObj.title = title;
        webObj.thumbnailData = imageData;
        wbMessageObject.mediaObject = webObj;
    }
    WBSendMessageToWeiboRequest *request = [WBSendMessageToWeiboRequest requestWithMessage:wbMessageObject authInfo:self.request access_token:nil];
    request.userInfo = @{@"ShareMessageFrom": @"SinaWeiboShare"};
    
    request.shouldOpenWeiboAppInstallPageIfNotInstalled = NO;
    return [WeiboSDK sendRequest:request];
}

#pragma mark- WeiboSDKDelegate
/**
 收到一个来自微博客户端程序的请求
 
 收到微博的请求后，第三方应用应该按照请求类型进行处理，处理完后必须通过 [WeiboSDK sendResponse:] 将结果回传给微博
 @param request 具体的请求对象
 */
- (void)didReceiveWeiboRequest:(WBBaseRequest *)request
{
    if ([request isKindOfClass:WBSendMessageToWeiboResponse.class])
    {
        if (self.wbDelegate
            && [self.wbDelegate respondsToSelector:@selector(WBApiPlugInDidRecvSendMessageReq:)]) {
            WBSendMessageToWeiboRequest* sendMessageToWeiboReq = (WBSendMessageToWeiboRequest*)request;
            [self.wbDelegate WBApiPlugInDidRecvSendMessageReq:sendMessageToWeiboReq];
        }
    }
    else if ([request isKindOfClass:WBAuthorizeResponse.class])
    {
        if (self.wbDelegate
            && [self.wbDelegate respondsToSelector:@selector(WBApiPlugInDidRecvAuthorizeReq:)]) {
            WBAuthorizeRequest *authReq = (WBAuthorizeRequest *)request;
            [self.wbDelegate WBApiPlugInDidRecvAuthorizeReq:authReq];
        }
    }
    
}
/**
 收到一个来自微博客户端程序的响应
 
 收到微博的响应后，第三方应用可以通过响应类型、响应的数据和 WBBaseResponse.userInfo 中的数据完成自己的功能
 @param response 具体的响应对象
 */
- (void)didReceiveWeiboResponse:(WBBaseResponse *)response
{
    if ([response isKindOfClass:WBSendMessageToWeiboResponse.class])
    {
        if (self.wbDelegate
            && [self.wbDelegate respondsToSelector:@selector(WBApiPlugInDidRecvSendMessageResponse:)]) {
            WBSendMessageToWeiboResponse* sendMessageToWeiboResponse = (WBSendMessageToWeiboResponse*)response;
            [self.wbDelegate WBApiPlugInDidRecvSendMessageResponse:sendMessageToWeiboResponse];
        }
    }
    else if ([response isKindOfClass:WBAuthorizeResponse.class])
    {
        if (self.wbDelegate
            && [self.wbDelegate respondsToSelector:@selector(WBApiPlugInDidRecvAuthorizeResponse:)]) {
            WBAuthorizeResponse *authResp = (WBAuthorizeResponse *)response;
            [self.wbDelegate WBApiPlugInDidRecvAuthorizeResponse:authResp];
        }
    }
    
}
@end
