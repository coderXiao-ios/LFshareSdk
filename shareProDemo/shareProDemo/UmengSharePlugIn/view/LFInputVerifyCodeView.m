//
//  LFInputVerifyCodeView.m
//  shareProDemo
//
//  Created by Xiao Xiao on 2018/9/5.
//  Copyright © 2018年 xiaoxiao. All rights reserved.
//

#import "LFInputVerifyCodeView.h"
@interface LFInputVerifyCodeView()
@property (weak, nonatomic) IBOutlet UITextField *verifyCodeTextFiled;
@property (weak, nonatomic) IBOutlet UIButton *verifyCodeBtn;

@end

@implementation LFInputVerifyCodeView

- (instancetype)init{
    if ([super init]) {
        self = [[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil].lastObject;
    }
    return self;
}
- (IBAction)sendVerifyCodeBtnAction:(id)sender {
}

@end
