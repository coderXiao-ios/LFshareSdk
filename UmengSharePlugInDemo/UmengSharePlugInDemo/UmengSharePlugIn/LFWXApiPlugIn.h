//
//  LFWXApiPlugIn.h
//  UmengSharePlugInDemo
//
//  Created by Xiao Xiao on 2018/8/29.
//  Copyright © 2018年 Xiao Xiao. All rights reserved.
//

#import "WXApi.h"
#import "WXApiObject.h"
typedef NS_ENUM(NSInteger,WXShareSceneType){
    WXShareSceneTypeSession  = 0,        /* 聊天界面*/
    WXShareSceneTypeTimeline = 1,        /* 朋友圈*/
};
@protocol LFWXApiPlugInDelegate <NSObject>
@optional
/**
 * 获取到发送请求消息
 */
- (void)WXApiPlugInDidRecvGetMessageReq:(GetMessageFromWXReq *)request;
/**
 * 获取到展示请求消息
 */
- (void)WXApiPlugInDidRecvShowMessageReq:(ShowMessageFromWXReq *)request;
/**
 * 微信终端打开第三方程序请求消息
 */
- (void)WXApiPlugInDidRecvLaunchFromWXReq:(LaunchFromWXReq *)request;
/**
 * 第三方程序向微信终端发送SendMessageToWXReq后，微信发送回来的处理结果，该结果用SendMessageToWXResp表示。
 */
- (void)WXApiPlugInDidRecvMessageResponse:(SendMessageToWXResp *)response;
/**
 * 微信处理完第三方程序的认证和权限申请后向第三方程序回送的处理结果响应
 */
- (void)WXApiPlugInDidRecvAuthResponse:(SendAuthResp *)response;


@end
@interface LFWXApiPlugIn : NSObject<WXApiDelegate>
@property (weak , nonatomic)id <LFWXApiPlugInDelegate> wxDelegate;
/**
 * 创建单例
 */
+ (LFWXApiPlugIn *)sharedInstance;
/**
 * 登录方法
 */
- (void)WXOauthLogin;
/**
 * 向微信注册
 */
-(BOOL)WXRegister;
/**
 * 是否安装微信
 */
- (BOOL)isWXAppInstalled;
/**
 * 移除代理
 */
- (void)delegateDealloc;
/**
 * 网页类型分享
 */
- (BOOL)sharedLinkToWeChat:(NSString *)title
               description:(NSString *)description
                 detailUrl:(NSString *)detailUrl
                     image:(UIImage *)image
                 shareType:(WXShareSceneType)sharedType;
/**
 * 分享图片
 */
-(BOOL)shareImageToWeChat:(UIImage *)image
                shareType:(WXShareSceneType)sharedType;
/**
 * 视频类型分享
 */
- (BOOL)sharedVideoToWeChat:(NSString *)title
                description:(NSString *)description
                   videoUrl:(NSString *)videoUrl
                      image:(UIImage *)image
                  shareType:(WXShareSceneType)sharedType;
@end

