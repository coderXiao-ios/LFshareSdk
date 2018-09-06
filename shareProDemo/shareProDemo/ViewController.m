//
//  ViewController.m
//  shareProDemo
//
//  Created by xiaoxiao on 2018/9/2.
//  Copyright © 2018年 xiaoxiao. All rights reserved.
//

#import "ViewController.h"
//#import <TencentOpenAPI/TencentOAuth.h>
//#import <TencentOpenAPI/sdkdef.h>
//#import <TencentOpenAPI/QQApiInterface.h>
//#import "WXApi.h"
//#import "WXApiObject.h"
//#import "WeiboSDK.h"
//#import "WBHttpRequest.h"
#import "LFLogInViewController.h"
//#import "LFShareAndLogInManager.h"
#import "LFShareModel.h"
#import "LFSharePopView.h"
#import "LFSharePopVC.h"
#import "LFBindPhoneViewController.h"
@interface ViewController ()
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)logInAciton:(UIButton *)sender {
//    LFLogInViewController *vc = [[LFLogInViewController alloc] initWithNibName:NSStringFromClass([LFLogInViewController class]) bundle:[NSBundle bundleWithPath:path]];
    LFLogInViewController *vc = [[LFLogInViewController alloc] initWithNibName:NSStringFromClass([LFLogInViewController class]) bundle:nil];
    [self presentViewController:vc animated:YES completion:nil];
}

- (IBAction)shareAction:(id)sender {
    LFShareModel *model = [[LFShareModel alloc] init];
    model.title = @"分享测试标题";
    model.content = @"分享内容";
    model.linkUrl = @"https://www.baidu.com/";
    model.shareImage = [UIImage imageWithContentsOfFile:@"109951163446367212.jpeg"];
//    LFSharePopVC *popViewVC = [[LFSharePopVC alloc] init];
//    [self presentViewController:popViewVC animated:NO completion:nil];
    LFSharePopView *popView = [[LFSharePopView alloc] initWithFrame:self.view.bounds];
    [popView showShareView];
    
}

- (IBAction)bindAction:(id)sender {
    LFBindPhoneViewController *vc = [[LFBindPhoneViewController alloc] init];
    vc.isLogIn = YES;
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc];
    [self presentViewController:nav animated:YES completion:nil];
}

@end
