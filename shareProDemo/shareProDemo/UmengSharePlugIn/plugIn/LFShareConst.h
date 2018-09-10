//
//  LFShareConst.h
//  UmengSharePlugInDemo
//
//  Created by Xiao Xiao on 2018/8/27.
//  Copyright © 2018年 Xiao Xiao. All rights reserved.
//

#ifndef LFShareConst_h
#define LFShareConst_h
#define iPhoneX() ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) : NO)

#define IPhoneXSafeAreaPotraitTop 44
#define IPhoneXSafeAreaPotraitBottom 34
#define IPhoneXSafeAreaPotraitLeft 0
#define IPhoneXSafeAreaPotraitRight 0

#define IPhoneXSafeAreaLanscapeTop 0
#define IPhoneXSafeAreaLanscapeBottom 21
#define IPhoneXSafeAreaLanscapeLeft 44
#define IPhoneXSafeAreaLanscapeRight 44

#define ScreenNarrowSide MIN(CGRectGetWidth([UIScreen mainScreen].bounds), CGRectGetHeight([UIScreen mainScreen].bounds))

#define AspectScale(measure) ((measure) *(ScreenNarrowSide/375.f))

#define LFBundle_Name @"LFSocialBundle.bundle"
#define LFBundle_Path [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:LFBundle_Name]
#define LFBundle [NSBundle bundleWithPath:LFBundle_Path]
#define LFBundle_Image(imageName)  [UIImage imageNamed:imageName inBundle:LFBundle compatibleWithTraitCollection:nil]

//微信
static NSString *const LFWXAppkey =@"wx5e38f4da3778a92e";
//@"wx0956d7043849b19a";
static NSString *const LFWXURLScheme =@"wx5e38f4da3778a92e";
//@"wx0956d7043849b19a";

//QQ
static NSString *const LFQQAppkey =@"101502108";
//@"1105737761";
static NSString *const LFTencentURLScheme = @"tencent101502108";
//@"tencent1105737761";
//微博
static NSString *const LFSinaAppkey =@"2454100575";
//@"3414149820";
static NSString *const LFSinaURLScheme = @"wb2454100575";

static NSString *const LFShareRedirectURL =@"http://www.bizrun.cn";

//----------------------------提示语相关-------------------
//QQ
static NSString *const LFQQToastLoginSuccessed = @"授权成功,正在登录中";
static NSString *const LFQQToastLoginFailed = @"用户授权失败";
static NSString *const LFQQToastLoginCancelled = @"用户取消授权";
static NSString *const LFQQToastNetworkError = @"网络出现问题";
static NSString *const LFQQToastShareSuccessed = @"QQ分享成功";
static NSString *const LFQQToastShareFailed = @"QQ分享失败";
//微信
static NSString *const LFWXToastLoginSuccessed = @"微信正在登录中";
static NSString *const LFWXToastLoginRefused = @"您已拒绝微信登录";
static NSString *const LFWXToastLoginCancelled = @"您已取消微信登录";
static NSString *const LFWXToastShareCancelled = @"微信分享取消";
static NSString *const LFWXToastShareSuccessed = @"已成功分享到微信";
static NSString *const LFWXToastShareFailed = @"微信分享失败";
//微博
static NSString *const LFWBToastLoginSuccessed = @"微信正在登录中";
static NSString *const LFWBToastLoginFailed = @"微博登录失败";
static NSString *const LFWBToastLoginCancelled = @"您已取消微博登录";
static NSString *const LFWBToastShareCancelled = @"微博分享取消";
static NSString *const LFWBToastShareSuccessed = @"已成功分享到微博";
static NSString *const LFWBToastShareFailed = @"微博分享失败";
#endif /* LFShareConst_h */
