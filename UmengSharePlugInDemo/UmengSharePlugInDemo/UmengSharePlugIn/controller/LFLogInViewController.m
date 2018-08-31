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
@interface LFLogInViewController ()
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *logoImgY;
@property (weak, nonatomic) IBOutlet UILabel *verifyCodeLb;
@property (weak, nonatomic) IBOutlet UITextField *phoneTextFiled;
@property (weak, nonatomic) IBOutlet UITextField *pswTextFiled;

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
}


- (IBAction)WXLogInAction:(UIButton *)sender {
}

- (IBAction)WBLogInAction:(UIButton *)sender {
}

@end
