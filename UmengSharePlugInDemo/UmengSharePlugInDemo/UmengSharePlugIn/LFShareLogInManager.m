//
//  LFShareLogInManager.m
//  UmengSharePlugInDemo
//
//  Created by Xiao Xiao on 2018/8/27.
//  Copyright © 2018年 Xiao Xiao. All rights reserved.
//

#import "LFShareLogInManager.h"
#import <TencentOpenAPI/TencentOAuth.h>
#import <TencentOpenAPI/QQApiInterfaceObject.h>
#import <TencentOpenAPI/QQApiInterface.h>
#import <WeiboSDK.h>
@interface LFShareLogInManager()<TencentSessionDelegate>
@property(strong, nonatomic)TencentOAuth *oauth;
@end
@implementation LFShareLogInManager
HFSingletonM
- (void) logInWithPlatForm:(LFSharePlatForm)platform{
    switch (platform) {
        case LFSharePlatFormQQ:{
            _oauth = [[TencentOAuth alloc] initWithAppId:@"1106248070" andDelegate:self];
            NSArray *permissions = @[kOPEN_PERMISSION_GET_SIMPLE_USER_INFO, kOPEN_PERMISSION_ADD_SHARE, kOPEN_PERMISSION_GET_INFO, kOPEN_PERMISSION_GET_USER_INFO];
            [_oauth authorize:permissions];
        }
            break;
            
        default:
            break;
    }
}

- (void) shareToPlatform:(LFSharePlatForm)platform andshareModel:(LFShareModel *)model{
    _oauth = [[TencentOAuth alloc] initWithAppId:@"1106248070" andDelegate:self];
    NSString *utf8String = @"http://www.163.com";
    NSString *title = @"新闻标题";
    NSString *description = @"新闻描述";
    NSString *previewImageUrl = @"http://cdni.wired.co.uk/620x413/k_n/NewsForecast%20copy_620x413.jpg";
    QQApiNewsObject *newsObj = [QQApiNewsObject
                                objectWithURL:[NSURL URLWithString:utf8String]
                                title:title
                                description:description
                                previewImageURL:[NSURL URLWithString:previewImageUrl]];
    SendMessageToQQReq *req = [SendMessageToQQReq reqWithContent:newsObj];
    //将内容分享到qzone
    [QQApiInterface SendReqToQZone:req];
}

#pragma mark TencentSessionDelegate
/**
 登录成功
 */
- (void)tencentDidLogin {
    NSLog(@"%@",_oauth.accessToken);
    [_oauth getUserInfo];
}

- (void)tencentDidNotLogin:(BOOL)cancelled {
    NSLog(@"登录失败");
}

- (void)tencentDidNotNetWork {
    NSLog(@"网络问题,没网了吧 哈哈哈哈哈");
}

- (void)getUserInfoResponse:(APIResponse *)response {
    NSLog(@"userInfo： response %@",response.jsonResponse);
}

/**
 * 分享到QZone回调
 * \param response API返回结果，具体定义参见sdkdef.h文件中\ref APIResponse
 * \remarks 正确返回示例: \snippet example/addShareResponse.exp success
 *          错误返回示例: \snippet example/addShareResponse.exp fail
 */
- (void)addShareResponse:(APIResponse*) response {
    NSLog(@"%@",response);
}


#pragma mark getter/setter

@end
