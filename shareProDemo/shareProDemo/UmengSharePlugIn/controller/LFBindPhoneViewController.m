//
//  LFBindPhoneViewController.m
//  shareProDemo
//
//  Created by Xiao Xiao on 2018/9/4.
//  Copyright © 2018年 xiaoxiao. All rights reserved.
//

#import "LFBindPhoneViewController.h"
#import "LFShareConst.h"
#define UIColorFromRGBA(rgbValue, a) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:a]

@interface LFBindPhoneViewController () 
@property(nonatomic, strong)UITextField *phoneTextFiled;
@property(nonatomic, strong)UITextField *verifyCodeTextFiled;
@property(nonatomic, strong)UILabel *verifyCodeLb;
@end

@implementation LFBindPhoneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.title  =@"绑定手机号";
    [self.view addSubview:self.phoneTextFiled];
    [self.view addSubview:self.verifyCodeTextFiled];
    [self.view addSubview:self.verifyCodeLb];
    [self initUI];
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}
- (void) initUI{
    UIButton *leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    if (_isLogIn ==NO) {
        [leftBtn addTarget:self action:@selector(backBtnAction) forControlEvents:UIControlEventTouchUpInside];
        [leftBtn setImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
       
    }else{
        [leftBtn addTarget:self action:@selector(jumpBtnAction) forControlEvents:UIControlEventTouchUpInside];
        [leftBtn setTitleColor:UIColorFromRGBA(0x323232, 1.0) forState:UIControlStateNormal];
        [leftBtn setTitle:@"跳过" forState:UIControlStateNormal];
        leftBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    }
   
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithCustomView:leftBtn];;
    [self.navigationItem setLeftBarButtonItem:leftItem];
    
    UIButton *bindBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [bindBtn addTarget:self action:@selector(jumpBtnAction) forControlEvents:UIControlEventTouchUpInside];
    [bindBtn setTitleColor:UIColorFromRGBA(0x323232, 1.0) forState:UIControlStateNormal];
    [bindBtn setTitle:@"绑定" forState:UIControlStateNormal];
    bindBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithCustomView:bindBtn];;
    [self.navigationItem setRightBarButtonItem:rightItem];
    
    UIButton *clearBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [clearBtn setImage:[UIImage imageNamed:@"login_icon_x"] forState:UIControlStateNormal];
    [clearBtn sizeToFit];

    clearBtn.frame = CGRectMake(CGRectGetWidth(self.view.bounds)-25 - CGRectGetWidth(clearBtn.bounds), 21.5 +(iPhoneX()?IPhoneXSafeAreaPotraitTop :20)+44, CGRectGetWidth(clearBtn.bounds), CGRectGetHeight(clearBtn.bounds));
    [clearBtn addTarget:self action:@selector(clearTextBtnAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:clearBtn];
    
    self.phoneTextFiled.frame = CGRectMake(25, 19+(iPhoneX()?IPhoneXSafeAreaPotraitTop :20)+44, CGRectGetMaxX(clearBtn.frame) - 10 -25, 22.5);
    
    UIView *phoneSeperateLine = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.phoneTextFiled.frame) +18.5, CGRectGetWidth(self.view.bounds), 0.5)];
    phoneSeperateLine.backgroundColor = UIColorFromRGBA(0xe6e6e6, 1.0);
    [self.view addSubview:phoneSeperateLine];
    
    self.verifyCodeLb.frame = CGRectMake(CGRectGetWidth(self.view.bounds) -20-70, CGRectGetMaxY(phoneSeperateLine.frame) +21, 70, 20);
    
    UIView *verticalSeperateLine = [[UIView alloc] initWithFrame:CGRectMake(CGRectGetMinX(_verifyCodeLb.frame) - 0.5 -15, CGRectGetMinY(_verifyCodeLb.frame), 0.5,20)];
    verticalSeperateLine.backgroundColor = UIColorFromRGBA(0xe6e6e6, 1.0);
    [self.view addSubview:verticalSeperateLine];
    
    self.verifyCodeTextFiled.frame = CGRectMake(CGRectGetMinX(_phoneTextFiled.frame), CGRectGetMaxY(phoneSeperateLine.frame) +19, CGRectGetMinX(_verifyCodeLb.frame) - 0.5 -15 -10, CGRectGetHeight(_phoneTextFiled.bounds));
    
    UIView *verifyCodeSeperateLine = [[UIView alloc] initWithFrame:CGRectMake(0,CGRectGetMaxY(_verifyCodeTextFiled.frame) +18, CGRectGetWidth(self.view.bounds), 0.5)];
    verifyCodeSeperateLine.backgroundColor = UIColorFromRGBA(0xe6e6e6, 1.0);
    [self.view addSubview:verifyCodeSeperateLine];
    
}


- (void)backBtnAction{
    
}

- (void) jumpBtnAction{
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
}

- (void) bindBtnAction{
    
}

- (void) clearTextBtnAction{
    _phoneTextFiled.text = @"";
}

- (void) sendVerifyCodeAction{
    if (_phoneTextFiled.text.length != 11 || [_phoneTextFiled.text hasPrefix:@"1"] == NO){
        NSLog(@"请您输入正确的手机号");
        return;
    }
    if ([_verifyCodeLb.text isEqualToString:@"获取验证码"] == NO)return;
    
    NSLog(@"√ 动态码已发送您的手机，请注意查收");
}

#pragma mark getter/setter
- (UITextField *)phoneTextFiled{
    if (!_phoneTextFiled ) {
        _phoneTextFiled = [[UITextField alloc] init];
        _phoneTextFiled.placeholder = @"请输入手机号";
        _phoneTextFiled.keyboardType = UIKeyboardTypeNumberPad;
        _phoneTextFiled.borderStyle = UITextBorderStyleNone;
    }
    return _phoneTextFiled;
}

- (UITextField *)verifyCodeTextFiled{
    if (!_verifyCodeTextFiled ) {
        _verifyCodeTextFiled = [[UITextField alloc] init];
        _verifyCodeTextFiled.placeholder = @"填写验证码";
        _verifyCodeTextFiled.keyboardType = UIKeyboardTypeNumberPad;
        _verifyCodeTextFiled.borderStyle = UITextBorderStyleNone;
    }
    return _verifyCodeTextFiled;
}

- (UILabel *)verifyCodeLb{
    if (!_verifyCodeLb) {
        _verifyCodeLb = [[UILabel alloc] init];
        _verifyCodeLb.textColor = UIColorFromRGBA(0xFF5B5B, 1.0);
        _verifyCodeLb.font = [UIFont fontWithName:@"PingFangSC-Regular" size:14];
        _verifyCodeLb.textAlignment = NSTextAlignmentCenter;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(sendVerifyCodeAction)];
        [_verifyCodeLb addGestureRecognizer:tap];
        _verifyCodeLb.text =@"获取验证码";
        _verifyCodeLb.backgroundColor = [UIColor clearColor];
    }
    return _verifyCodeLb;
}

@end
