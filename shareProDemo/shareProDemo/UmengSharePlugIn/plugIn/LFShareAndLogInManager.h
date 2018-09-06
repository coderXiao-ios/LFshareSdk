//
//  LFShareManager.h
//  UmengSharePlugInDemo
//
//  Created by Xiao Xiao on 2018/8/27.
//  Copyright © 2018年 Xiao Xiao. All rights reserved.
//
#import <Foundation/Foundation.h>
#import "LFShareModel.h"

@protocol LFShareAndLogInManagerDelegate <NSObject>
@optional
//显示第三方登录分享的提示消息
-(void)shareAndLogInToShowToastMessage:(NSString *)message;
//登录成功
-(void)thirdPlatformDidLoginSuccess:(NSDictionary *)responseObject;
@end
@interface LFShareAndLogInManager : NSObject
@property(weak,nonatomic)id<LFShareAndLogInManagerDelegate>delegate;

+ (LFShareAndLogInManager *)sharedInstance;
/**
 * 注册平台
 */
-(void)registerThirdPlatform;
/**
 * 登录
 */
-(void)logIn:(LFSharePlatFormType)platFormType;
/**
 * 第三方登录,分享跳转事件
 */
- (BOOL)thirdPlatformApplicationHandleOpenURL:(NSURL *)url;
/**
 * 退出登录
 */
-(void)logOut;
/**
 * 分享
 */
- (void) shareToThirdPlatformWithModel:(LFShareModel *)model;
@end
