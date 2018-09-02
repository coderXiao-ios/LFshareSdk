//
//  LFShareLoadingView.h
//  shareProDemo
//
//  Created by xiaoxiao on 2018/9/2.
//  Copyright © 2018年 xiaoxiao. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface LFShareLoadingView : UIView
+ (LFShareLoadingView *)shareLoadingView;
- (void) showHUDStr:(NSString *)str;

@end

NS_ASSUME_NONNULL_END
