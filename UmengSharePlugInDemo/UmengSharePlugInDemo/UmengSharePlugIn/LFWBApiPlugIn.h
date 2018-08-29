//
//  LFWBApiPlugIn.h
//  UmengSharePlugInDemo
//
//  Created by Xiao Xiao on 2018/8/29.
//  Copyright © 2018年 Xiao Xiao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <WeiboSDK.h>
#import <WBHttpRequest.h>

@protocol LFWBApiPlugInDelegate <NSObject>
@optional
/**
 *收到微博的请求后，一些回调
 */
- (void)WBApiUtilsDidRecvSendMessageReq:(WBSendMessageToWeiboRequest *)request;
- (void)WBApiUtilsDidRecvAuthorizeReq:(WBAuthorizeRequest *)request;
/**
 * 收到微博的响应后，一些回调
 */
- (void)WBApiUtilsDidRecvSendMessageResponse:(WBSendMessageToWeiboResponse *)response;
- (void)WBApiUtilsDidRecvAuthorizeResponse:(WBAuthorizeResponse *)response;
@end
@interface LFWBApiPlugIn : NSObject<WeiboSDKDelegate>
@property (weak , nonatomic)id <LFWBApiPlugInDelegate> wbDelegate;
/**
 *创建单例
 */
+ (LFWBApiPlugIn *)sharedInstance;
/**
 * 登录方法
 */
- (void)WBOauthLogin;
/**
 * 向微博注册
 */
-(BOOL)WBRegister:(BOOL)enabled;
/**
 * 是否安装微博
 */
- (BOOL)isWBAppInstalled;
/**
 * 移除代理
 */
- (void)delegateDealloc;
/**
 * 分享图片
 */
- (BOOL)sharedImageToSinaWeibo:(NSString *) message
                         image:(UIImage *)image;
/**
 * 分享网页
 */
- (BOOL)sharedLinkToSinaWeiboWithTitle:(nonnull NSString*)title
                                webURL:(nullable NSString *)webURL
                               message:(nullable NSString *) message
                            coverImage:(nullable UIImage*)coverImage;
@end
