//
//  LFShareConst.h
//  UmengSharePlugInDemo
//
//  Created by Xiao Xiao on 2018/8/27.
//  Copyright © 2018年 Xiao Xiao. All rights reserved.
//

#ifndef LFShareConst_h
#define LFShareConst_h


//QQ
#define UMQQAppID @"1105737761"
#define UMQQAppSecret @"I8PHlY7HkoczzI1E"
//微信
#define UMWeChatAppID @"wxaacd80f5db150672"
#define UMWeChatAppSecret @"936d790fc336cc6ca868f082b87b7df7"
//微博
#define UMSinaAppID @"1412448931"
#define UMSinaAppSecret @"50992bec1bcce331172eadc5960255b1"

static NSString *const LFUMengAppkey = @"5861e5daf5ade41326001eab";

//微信
static NSString *const LFWXAppkey = @"wx0956d7043849b19a";
static NSString *const LFWXAppSecret = @"728e98806e2592b86cd535e08e4b0616";
static NSString *const LFWXURLScheme = @"wx0956d7043849b19a";

//QQ
static NSString *const LFQQAppkey = @"1105737761";
static NSString *const LFQQAppSecret = @"JCViBopbm1F2E2ZT";
static NSString *const LFTencentURLScheme = @"tencent1105737761";

//微博
static NSString *const LFSinaAppkey = @"2601129562";
static NSString *const LFSinaAppSecret = @"e66df1b17344fa7bf2ec40f207be7c8b";
static NSString *const LFSinaURLScheme = @"wb2601129562";

static NSString *const LFShareRedirectURL = @"http://www.hefantv.com";


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
