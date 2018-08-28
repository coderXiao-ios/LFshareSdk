//
//  LFShareLogInManager.m
//  UmengSharePlugInDemo
//
//  Created by Xiao Xiao on 2018/8/27.
//  Copyright © 2018年 Xiao Xiao. All rights reserved.
//

#import "LFShareLogInManager.h"
#import <TencentOpenAPI/TencentOAuth.h>
#import <WeiboSDK.h>
@interface LFShareLogInManager()

@end
@implementation LFShareLogInManager
- (void) logIn:(NSInteger)platform{
    switch (platform) {
        case 0:{
//            TencentOAuth *oauth = [[TencentOAuth alloc] initWithAppId:@"1106248070" andDelegate:self];
//            NSArray *permissions = @[kOPEN_PERMISSION_GET_SIMPLE_USER_INFO, kOPEN_PERMISSION_ADD_SHARE, kOPEN_PERMISSION_GET_INFO, kOPEN_PERMISSION_GET_USER_INFO];
//            [oauth authorize:permissions];
        }
            
            break;
            
        default:
            break;
    }
}
@end
