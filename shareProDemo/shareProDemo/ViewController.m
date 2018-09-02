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

@interface ViewController ()
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)logInAciton:(UIButton *)sender {
    LFLogInViewController *vc = [[LFLogInViewController alloc] initWithNibName:NSStringFromClass([LFLogInViewController class]) bundle:nil];
    [self presentViewController:vc animated:YES completion:nil];
}

@end
