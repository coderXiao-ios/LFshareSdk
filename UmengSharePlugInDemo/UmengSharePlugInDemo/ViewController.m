//
//  ViewController.m
//  UmengSharePlugInDemo
//
//  Created by Xiao Xiao on 2018/8/27.
//  Copyright © 2018年 Xiao Xiao. All rights reserved.
//

#import "ViewController.h"
#import "LFShareManager.h"
#import "LFShareLogInManager.h"
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
    [LFShareManager showUMShareView:model];
}

- (IBAction)LogInAction:(UIButton *)sender {
    
}

- (IBAction)logOutAction:(UIButton *)sender {
}



@end
