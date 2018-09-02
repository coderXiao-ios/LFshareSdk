//
//  LFShareLoadingView.m
//  shareProDemo
//
//  Created by xiaoxiao on 2018/9/2.
//  Copyright © 2018年 xiaoxiao. All rights reserved.
//

#import "LFShareLoadingView.h"
@interface LFShareLoadingView()
@property (weak, nonatomic) IBOutlet UILabel *tipLb;
@end
@implementation LFShareLoadingView

+ (LFShareLoadingView *)shareLoadingView{
    LFShareLoadingView *shareLoadingView =[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil].lastObject;
    return shareLoadingView;
}

- (void) showHUDStr:(NSString *)str{
    _tipLb.text = str;
}
@end
