//
//  LFSharePopView.m
//  UmengSharePlugInDemo
//
//  Created by Xiao Xiao on 2018/8/29.
//  Copyright © 2018年 Xiao Xiao. All rights reserved.
//

#import "LFSharePopView.h"
@interface LFSharePopView()
@property(nonatomic ,strong)UIView *shareBottomView;
@property(nonatomic ,strong)UIButton *shareQQbtn;
@property(nonatomic ,strong)UIButton *shareWXbtn;
@property(nonatomic ,strong)UIButton *shareWXFriendBtn;

@end
@implementation LFSharePopView
+(instancetype)createShareView{
    LFSharePopView * shareView = [[LFSharePopView alloc] init];
    shareView.backgroundColor = [UIColor blackColor];
    shareView.alpha = 0.5;
    return shareView;
}

- (instancetype)init{
    if ([super init]) {
        [self addSubview:self.shareBottomView];
    }
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
}

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event{
    if (CGRectContainsPoint(self.bounds, point)){
        return [super hitTest:point withEvent:event];
    }
    [self hideShareView];
    return nil;
}

-(void)showShareView{
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    [window addSubview:self];
    typeof(self) __weak weakSelf = self;
    [UIView animateWithDuration:0.3 animations:^{
        typeof(weakSelf) __strong strongSelf = weakSelf;
        strongSelf.shareBottomView.transform = CGAffineTransformMakeTranslation(0, -(CGRectGetHeight(strongSelf.shareBottomView.frame) - 20));
    }];
}

-(void)hideShareView{
    typeof(self) __weak weakSelf = self;
    [UIView animateWithDuration:0.2 animations:^{
        [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
        typeof(weakSelf) __strong strongSelf = weakSelf;
        strongSelf.shareBottomView.transform = CGAffineTransformIdentity;
    } completion:^(BOOL finished) {
        typeof(weakSelf) __strong strongSelf = weakSelf;
        [strongSelf removeFromSuperview];
    }];
}
#pragma mark --Actions--
- (void) shareQQbtnAction{
    
}

- (void) shareWXbtnAction{
    
}

- (void) shareWXFriendbtnAction{
    
}
#pragma mark  --getter/setter--
- (UIView *)shareBottomView{
    if (!_shareBottomView) {
        _shareBottomView = [[UIView alloc] init];
    }
    return _shareBottomView;
}

- (UIButton *)shareQQbtn{
    if (!_shareQQbtn) {
        _shareQQbtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_shareQQbtn setTitle:@"QQ" forState:UIControlStateNormal];
        [_shareQQbtn addTarget:self action:@selector(shareQQbtnAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _shareQQbtn;
}

- (UIButton *)shareWXbtn{
    if (!_shareWXbtn) {
        _shareWXbtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_shareWXbtn setTitle:@"微信" forState:UIControlStateNormal];
        [_shareWXbtn addTarget:self action:@selector(shareWXbtnAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _shareWXbtn;
}

- (UIButton *)shareWXFriendBtn{
    if (!_shareWXFriendBtn) {
        _shareWXFriendBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_shareWXFriendBtn setTitle:@"QQ" forState:UIControlStateNormal];
        [_shareWXFriendBtn addTarget:self action:@selector(shareWXFriendBtnAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _shareWXFriendBtn;
}
@end
