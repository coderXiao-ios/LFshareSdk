//
//  LFSharePopVC.m
//  shareProDemo
//
//  Created by Xiao Xiao on 2018/9/4.
//  Copyright © 2018年 xiaoxiao. All rights reserved.
//

#import "LFSharePopVC.h"
#import "LFShareConst.h"
#import "LFShareAndLogInManager.h"
typedef void(^hiddenToShareblock)(void);
@interface LFSharePopVC ()
@property(nonatomic ,strong)UIImageView *shareTopImgView;
@property(nonatomic ,strong)UIView *shareBottomView;
@property(nonatomic ,strong)UIButton *shareQQbtn;
@property(nonatomic ,strong)UIButton *shareWXbtn;
@property(nonatomic ,strong)UIButton *shareWXFriendBtn;
@property(nonatomic ,strong)UIButton *shareWeiBoBtn;
@end

@implementation LFSharePopVC
+ (instancetype) sharePopVC{
    LFSharePopVC *vc = [[LFSharePopVC alloc] init];
    vc.definesPresentationContext = YES;
    vc.modalPresentationStyle = UIModalPresentationOverFullScreen;
    vc.view.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.3];
    return vc;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view addSubview:self.shareTopImgView];
    [self.view addSubview:self.shareBottomView];
    [_shareBottomView addSubview:self.shareWXFriendBtn];
    [_shareBottomView addSubview:self.shareWeiBoBtn];
    [_shareBottomView addSubview:self.shareQQbtn];
    [_shareBottomView addSubview:self.shareWXbtn];
}
- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [self showShareView];
}
- (void)viewWillLayoutSubviews{
    [super viewWillLayoutSubviews];
#ifdef __IPHONE_11_0
    if (@available(iOS 11.0, *)) {
        self.shareBottomView.frame = CGRectMake(0,CGRectGetHeight(self.view.frame)-(self.view.safeAreaInsets.bottom + 32+ 45+ 55+CGRectGetHeight(self.shareTopImgView.bounds)) , CGRectGetWidth(self.view.frame), self.view.safeAreaInsets.bottom + 32+ 45+ 55+CGRectGetHeight(self.shareTopImgView.bounds));

    } else {
  _shareBottomView.frame = CGRectMake(0,CGRectGetHeight(self.view.frame)- (32+ 45+ 55+CGRectGetHeight(self.shareTopImgView.bounds)) , CGRectGetWidth(self.view.frame), 32+ 45+ 55+CGRectGetHeight(self.shareTopImgView.bounds));
    }
#endif
    _shareTopImgView.frame = CGRectMake(0, CGRectGetMinY(_shareBottomView.frame) - CGRectGetHeight(_shareTopImgView.bounds), CGRectGetWidth(_shareTopImgView.bounds), CGRectGetHeight(_shareTopImgView.bounds));
    CGFloat btnSpace = CGRectGetWidth(self.view.frame) - 45*4- AspectScale(30)*2;
    _shareWXFriendBtn.frame = CGRectMake(AspectScale(30), 32 +CGRectGetMaxY(_shareTopImgView.frame), 45, 45+8+16.5);
    _shareWeiBoBtn.frame = CGRectMake(CGRectGetMaxX(_shareWXFriendBtn.frame)+btnSpace, CGRectGetMinY(_shareWXFriendBtn.frame), 45, 45+8+16.5);
    _shareQQbtn.frame = CGRectMake(CGRectGetMaxX(_shareWeiBoBtn.frame)+btnSpace, CGRectGetMinY(_shareWXFriendBtn.frame), 45, 45+8+16.5);
    _shareWXbtn.frame = CGRectMake(CGRectGetMaxX(_shareQQbtn.frame)+btnSpace, CGRectGetMinY(_shareWXFriendBtn.frame), 45, 45+8+16.5);
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self hideShareView:nil];
}

-(void)showShareView{
    typeof(self) __weak weakSelf = self;
    [UIView animateWithDuration:0.3 animations:^{
        typeof(weakSelf) __strong strongSelf = weakSelf;
        strongSelf.shareBottomView.transform = CGAffineTransformMakeTranslation(0, -(CGRectGetHeight(strongSelf.shareBottomView.frame) - 20));
    }];
}

-(void)hideShareView:(hiddenToShareblock)compelteBlck{
    typeof(self) __weak weakSelf = self;
    [UIView animateWithDuration:0.2 animations:^{
        [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
        typeof(weakSelf) __strong strongSelf = weakSelf;
        strongSelf.shareBottomView.transform = CGAffineTransformIdentity;
    } completion:^(BOOL finished) {
        typeof(weakSelf) __strong strongSelf = weakSelf;
        [strongSelf dismissViewControllerAnimated:YES completion:nil];
        if (compelteBlck) {
            compelteBlck();
        }
    }];
}
- (void) setUpBtnSpaceImgAndTitle:(UIButton *)btn andSpace:(CGFloat)space{
    CGFloat imageWith = btn.imageView.frame.size.width;
    CGFloat imageHeight = btn.imageView.frame.size.height;
    CGFloat labelWidth = btn.titleLabel.intrinsicContentSize.width;
    CGFloat labelHeight = btn.titleLabel.intrinsicContentSize.height;
    UIEdgeInsets imageEdgeInsets = UIEdgeInsetsMake(-labelHeight-space/2.0, 0, 0, -labelWidth);
    UIEdgeInsets  labelEdgeInsets = UIEdgeInsetsMake(0, -imageWith, -imageHeight-space/2.0, 0);
    btn.titleEdgeInsets = labelEdgeInsets;
    btn.imageEdgeInsets = imageEdgeInsets;
}

#pragma mark --Actions--
- (void) shareQQbtnAction{
    _model.platformType = LFSharePlatFormQQ;
    [self shareAction];
}

- (void) shareWXbtnAction{
    _model.platformType = LFSharePlatFormWX;
    [self shareAction];
}

- (void) shareWXFriendbtnAction{
    _model.platformType = LFSharePlatFormWXFriends;
    [self shareAction];
}
- (void) shareWBAction{
    _model.platformType = LFSharePlatFormWeiBo;
    [self shareAction];
}

- (void) shareAction{
    typeof(self) __weak weakSelf = self;
    [self hideShareView:^{
        typeof(weakSelf) __strong strongSelf = weakSelf;
        [[LFShareAndLogInManager sharedInstance] shareToThirdPlatformWithModel:strongSelf.model];
    }];
}
#pragma mark  --getter/setter--
- (UIImageView *)shareTopImgView{
    if (!_shareTopImgView) {
        _shareTopImgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"popup_share"]];
        [_shareTopImgView sizeToFit];
    }
    return _shareTopImgView;
}
- (UIView *)shareBottomView{
    if (!_shareBottomView) {
        _shareBottomView = [[UIView alloc] init];
        _shareBottomView.backgroundColor = [UIColor whiteColor];
    }
    return _shareBottomView;
}

- (UIButton *)shareQQbtn{
    if (!_shareQQbtn) {
        _shareQQbtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_shareQQbtn setTitle:@"QQ" forState:UIControlStateNormal];
        [_shareQQbtn setImage:[UIImage imageNamed:@"login_qq"] forState:UIControlStateNormal];
        _shareQQbtn.highlighted = NO;
        _shareQQbtn.titleLabel.font = [UIFont systemFontOfSize:12];
        [_shareQQbtn setTitleColor: [UIColor colorWithRed:100/255.0 green:100/255.0 blue:100/255.0 alpha:1/1.0] forState:UIControlStateNormal];
        [_shareQQbtn setFrame:CGRectMake(0, 0, 45, 45+8+16.5)];
        [_shareQQbtn addTarget:self action:@selector(shareQQbtnAction) forControlEvents:UIControlEventTouchUpInside];
        [self setUpBtnSpaceImgAndTitle:_shareQQbtn andSpace:8];
    }
    return _shareQQbtn;
}

- (UIButton *)shareWXbtn{
    if (!_shareWXbtn) {
        _shareWXbtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_shareWXbtn setTitle:@"微信" forState:UIControlStateNormal];
        [_shareWXbtn setImage:[UIImage imageNamed:@"login_weixin"] forState:UIControlStateNormal];
        _shareWXbtn.highlighted = NO;
        _shareWXbtn.titleLabel.font = [UIFont systemFontOfSize:12];
        [_shareWXbtn setTitleColor: [UIColor colorWithRed:100/255.0 green:100/255.0 blue:100/255.0 alpha:1/1.0] forState:UIControlStateNormal];
        [_shareWXbtn setFrame:CGRectMake(0, 0, 45, 45+8+16.5)];
        [_shareWXbtn addTarget:self action:@selector(shareWXbtnAction) forControlEvents:UIControlEventTouchUpInside];
        [self setUpBtnSpaceImgAndTitle:_shareWXbtn andSpace:8];
    }
    return _shareWXbtn;
}

- (UIButton *)shareWXFriendBtn{
    if (!_shareWXFriendBtn) {
        _shareWXFriendBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_shareWXFriendBtn setTitle:@"朋友圈" forState:UIControlStateNormal];
        [_shareWXFriendBtn setImage:[UIImage imageNamed:@"login_pengyouquan"] forState:UIControlStateNormal];
        _shareWXFriendBtn.highlighted = NO;
        _shareWXFriendBtn.titleLabel.font = [UIFont systemFontOfSize:12];
        [_shareWXFriendBtn setTitleColor: [UIColor colorWithRed:100/255.0 green:100/255.0 blue:100/255.0 alpha:1/1.0]
                                forState:UIControlStateNormal];
        [_shareWXFriendBtn setFrame:CGRectMake(0, 0, 45, 45+8+16.5)];
        [_shareWXFriendBtn addTarget:self
                              action:@selector(shareWXFriendbtnAction) forControlEvents:UIControlEventTouchUpInside];
        [self setUpBtnSpaceImgAndTitle:_shareWXFriendBtn andSpace:8];
    }
    return _shareWXFriendBtn;
}

- (UIButton *)shareWeiBoBtn{
    if (!_shareWeiBoBtn) {
        _shareWeiBoBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_shareWeiBoBtn setTitle:@"微博" forState:UIControlStateNormal];
        [_shareWeiBoBtn setImage:[UIImage imageNamed:@"login_weibo"] forState:UIControlStateNormal];
        _shareWeiBoBtn.highlighted = NO;
        _shareWeiBoBtn.titleLabel.font = [UIFont systemFontOfSize:12];
        [_shareWeiBoBtn setTitleColor: [UIColor colorWithRed:100/255.0 green:100/255.0 blue:100/255.0 alpha:1/1.0] forState:UIControlStateNormal];
        [_shareWeiBoBtn setFrame:CGRectMake(0, 0, 45, 45+8+16.5)];
        [_shareWeiBoBtn addTarget:self action:@selector(shareWBAction) forControlEvents:UIControlEventTouchUpInside];
        [self setUpBtnSpaceImgAndTitle:_shareWeiBoBtn andSpace:8];
    }
    return _shareWeiBoBtn;
}

@end
