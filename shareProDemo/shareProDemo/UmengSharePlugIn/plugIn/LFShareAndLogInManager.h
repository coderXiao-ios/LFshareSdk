//
//  LFShareManager.h
//  UmengSharePlugInDemo
//
//  Created by Xiao Xiao on 2018/8/27.
//  Copyright © 2018年 Xiao Xiao. All rights reserved.
//

#import "LFQQApiPlugIn.h"
#import "LFWBApiPlugIn.h"
#import "LFWXApiPlugIn.h"
#import "LFShareModel.h"
@protocol LFShareAndLogInManagerDelegate <NSObject>
@optional
//显示第三方登录分享的提示消息
-(void)ShareAndLogInToShowToastMessage:(NSString *)message;
//登录成功
-(void)thirdPlatformDidLoginSuccess:(NSDictionary *)responseObject;
@end
@interface LFShareAndLogInManager : NSObject
@property(weak,nonatomic)id<LFShareAndLogInManagerDelegate>delegate;
//qq的管理类
@property(strong,nonatomic)LFQQApiPlugIn * qqPlugIn;
//微信的管理类
@property(strong,nonatomic)LFWXApiPlugIn * wxPlugIn;
//微博的管理类
@property(strong,nonatomic)LFWBApiPlugIn * wbPlugIn;
+ (LFShareAndLogInManager *)sharedInstance;
#pragma mark- AppDelegate方法处理
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
@end
