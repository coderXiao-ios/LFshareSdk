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

@interface LFLogInViewController ()<LFShareAndLogInManagerDelegate,UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *logoImgY;
@property (weak, nonatomic) IBOutlet UILabel *verifyCodeLb;
@property (weak, nonatomic) IBOutlet UITextField *phoneTextFiled;
@property (weak, nonatomic) IBOutlet UITextField *pswTextFiled;
@property(nonatomic, strong)LFShareLoadingView *loadingView;
@end

@implementation LFLogInViewController
- (instancetype)init{
    if (self = [super init]) {
//        NSString *path= [[NSBundle mainBundle] pathForResource:@"Settings" ofType:@"bundle"];
//        LFLogInViewController *vc = [[LFLogInViewController alloc] initWithNibName:NSStringFromClass([LFLogInViewController class]) bundle:[NSBundle bundleWithPath:path]];
        NSBundle *bundle = [NSBundle bundleWithPath:[[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"Settings.bundle"]];
        
        self = [[bundle loadNibNamed:NSStringFromClass([LFLogInViewController class]) owner:self options:nil] lastObject];
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    if (iPhoneX()) {
    }else{
    }
    
    _phoneTextFiled.delegate = self;
    _pswTextFiled.delegate = self;
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(sendVerifyCodeAction)];
    [_verifyCodeLb addGestureRecognizer:tap];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}

- (void) sendVerifyCodeAction{
    if (_phoneTextFiled.text.length != 11 || [_phoneTextFiled.text hasPrefix:@"1"] == NO){
        NSLog(@"请您输入正确的手机号");
        return;
    }
    if ([_verifyCodeLb.text isEqualToString:@"获取验证码"] == NO)return;

    NSLog(@"√ 动态码已发送您的手机，请注意查收");
}

- (IBAction)clearBtnAction:(UIButton *)sender {
    _phoneTextFiled.text = @"";
}


- (IBAction)logInBtnAciton:(UIButton *)sender {
    if (_phoneTextFiled.text.length != 11 || [_phoneTextFiled.text hasPrefix:@"1"] == NO){
        NSLog(@"请您输入正确的手机号");
        return;
    }
   
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
