//
//  LFShareManager.m
//  UmengSharePlugInDemo
//
//  Created by Xiao Xiao on 2018/8/27.
//  Copyright © 2018年 Xiao Xiao. All rights reserved.
//

#import "LFShareManager.h"
#import "LFShareConst.h"
#import <WeiboSDK.h>
#import <TencentOpenAPI/QQApiInterface.h>
#import <TencentOpenAPI/TencentOAuth.h>

@implementation LFShareManager
+ (void) configUmengShareSettings{
    /* 设置友盟appkey */
    [[UMSocialManager defaultManager] setUmSocialAppkey:LFUMengAppkey];
    /* 打开调试日志 */
    [[UMSocialManager defaultManager] openLog:isDebug];
    /* 配置微信、QQ、新浪 */
    [[UMSocialManager defaultManager] setPlaform:UMSocialPlatformType_WechatSession appKey:LFWXAppkey appSecret:LFWXAppSecret redirectURL:LFUMengRedirectURL];
    [[UMSocialManager defaultManager] setPlaform:UMSocialPlatformType_QQ appKey:LFQQAppkey/*设置QQ平台的appID*/  appSecret:nil redirectURL:LFUMengRedirectURL];
    
//    [WeiboSDK registerApp:(NSString *)]
    
    
}
+ (void)showUMShareView:(LFShareModel *)model {
    
    [UMSocialUIManager showShareMenuViewInWindowWithPlatformSelectionBlock:^(UMSocialPlatformType platformType, NSDictionary *userInfo) {
        
        // 根据获取的platformType确定所选平台进行下一步操作
        [self shareWebPageToPlatformType:platformType shareModel:model];
    }];
}

+ (void)shareWebPageToPlatformType:(UMSocialPlatformType)platformType shareModel:(LFShareModel *)model  {
    
    UIImage *image = [UIImage imageNamed:@"btn_link_qq"];
    if (model.imageUrl.length) {
//        UIImage *webImage = [MKImageDownLoadManager downLoadImage:[NSURL URLWithString:model.imageUrl]];
//        if (webImage) {
//            image = webImage;
//        }
    }
    
    //创建分享消息对象
    UMSocialMessageObject *messageObject = [UMSocialMessageObject messageObject];
    
    //创建网页内容对象
    UMShareWebpageObject *shareObject = [UMShareWebpageObject shareObjectWithTitle:model.title descr:model.content thumImage:image];
    //设置网页地址
    shareObject.webpageUrl = model.webpageUrl;
    
    //分享消息对象设置分享内容对象
    messageObject.shareObject = shareObject;
    
    //调用分享接口
    [[UMSocialManager defaultManager] shareToPlatform:platformType messageObject:messageObject currentViewController:nil completion:^(id data, NSError *error) {
        if (error) {
            NSLog(@"************Share fail with error %@*********",error);
        }else{
            NSLog(@"response data is %@",data);
        }
    }];
}
@end
