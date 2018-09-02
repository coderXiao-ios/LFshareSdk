//
//  LFLogInViewController.m
//  UmengSharePlugInDemo
//
//  Created by Xiao Xiao on 2018/8/31.
//  Copyright © 2018年 Xiao Xiao. All rights reserved.
//

#import "LFLogInViewController.h"
#import "LFShareConst.h"
#import "LFShareAndLogInManager.h"
#import "LFShareLoadingView.h"

@interface LFLogInViewController ()<LFShareAndLogInManagerDelegate>
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *logoImgY;
@property (weak, nonatomic) IBOutlet UILabel *verifyCodeLb;
@property (weak, nonatomic) IBOutlet UITextField *phoneTextFiled;
@property (weak, nonatomic) IBOutlet UITextField *pswTextFiled;
@property(nonatomic, strong)LFShareLoadingView *loadingView;

@end

@implementation LFLogInViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    if (iPhoneX()) {
        _logoImgY.constant = _logoImgY.constant +IPhoneXSafeAreaPotraitTop;
    }else{
        _logoImgY.constant = AspectScale(_logoImgY.constant);
    }
 
}


- (IBAction)clearBtnAction:(UIButton *)sender {
}


- (IBAction)logInBtnAciton:(UIButton *)sender {
}


- (IBAction)QQBtnLogInAction:(UIButton *)sender {
    [self showLoadingView:YES];
    [[LFShareAndLogInManager sharedInstance] logIn:LFSharePlatFormQQ];
}


- (IBAction)WXLogInAction:(UIButton *)sender {
    [self showLoadingView:YES];
    [[LFShareAndLogInManager sharedInstance] logIn:LFSharePlatFormWX];
}

- (IBAction)WBLogInAction:(UIButton *)sender {
    [self showLoadingView:YES];
    [[LFShareAndLogInManager sharedInstance] logIn:LFSharePlatFormWeiBo];
}

- (void) showLoadingView:(BOOL)isThird{
    if (![self.view.subviews containsObject:self.loadingView]) {
         _loadingView = [LFShareLoadingView shareLoadingView];
        _loadingView.frame =self.view.bounds;
        [self.view addSubview:_loadingView];
    }
    if (isThird) {
        [_loadingView showHUDStr:@"正在授权..."];
        [LFShareAndLogInManager sharedInstance].delegate = self;
    }
}

- (void)thirdPlatformDidLoginSuccess:(NSDictionary *)responseObject{
    [LFShareAndLogInManager sharedInstance].delegate = nil;
    [_loadingView showHUDStr:@"授权成功,正在登录..."];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self->_loadingView removeFromSuperview];
    });
}
@end
