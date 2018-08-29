//
//  ViewController.m
//  UmengSharePlugInDemo
//
//  Created by Xiao Xiao on 2018/8/27.
//  Copyright © 2018年 Xiao Xiao. All rights reserved.
//

#import "ViewController.h"
#import "LFShareAndLogInManager.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
}

- (IBAction)shareAction:(id)sender {
    LFShareModel *model = [[LFShareModel alloc] init];
    model.content = @"测试一下分享";
    model.title = @"标题测试";
    model.webpageUrl =@"www.baidu.com";
//    [LFShareManager showUMShareView:model];
}

- (IBAction)LogInAction:(UIButton *)sender {
    switch (sender.tag) {
        case 100:
            [[LFShareAndLogInManager sharedInstance].qqPlugIn QQOauthLogin];
            break;
        case 101:
            [[LFShareAndLogInManager sharedInstance].wxPlugIn WXOauthLogin];
            break;
        case 102:
            [[LFShareAndLogInManager sharedInstance].wxPlugIn WXOauthLogin];
            break;
        default:
            break;
    }
    
}

- (IBAction)logOutAction:(UIButton *)sender {
}



@end
