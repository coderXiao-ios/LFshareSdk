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

static NSString *const LFWXAppkey = @"wxaacd80f5db150672";
static NSString *const LFWXAppSecret = @"936d790fc336cc6ca868f082b87b7df7";
static NSString *const LFQQAppkey = @"1105737761";
static NSString *const LFQQAppSecret = @"I8PHlY7HkoczzI1E";
static NSString *const LFSinaAppkey = @"UMSinaAppID";
static NSString *const LFSinaAppSecret = @"50992bec1bcce331172eadc5960255b1";
static NSString *const LFShareRedirectURL = @"http://mobile.umeng.com/social";

static NSString *const LFSinaURLScheme = @"wb1412448931";
static NSString *const LFWXURLscheme = @"wxaacd80f5db150672";
static NSString *const LFQQURLscheme = @"QQ41e83821";
#ifdef DEBUG
#define isDebug YES
#else
#define isDebug NO
#endif

//.h文件
#define HFSingletonH  + (nullable instancetype)sharedInstance;
#define HFSingletonM \
static id _instance;\
\
+ (nullable instancetype)allocWithZone:(struct _NSZone *)zone\
{\
static dispatch_once_t onceToken;\
dispatch_once(&onceToken, ^{\
_instance = [super allocWithZone:zone];\
});\
return _instance;\
}\
\
+ (instancetype)sharedInstance\
{\
static dispatch_once_t onceToken;\
dispatch_once(&onceToken, ^{\
_instance = [[self alloc]init];\
});\
return _instance;\
}\
\
- (id)copyWithZone:(NSZone *)zone\
{\
return _instance;\
}
#endif /* LFShareConst_h */
