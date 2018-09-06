//
//  LFSharePopVC.h
//  shareProDemo
//
//  Created by Xiao Xiao on 2018/9/4.
//  Copyright © 2018年 xiaoxiao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LFShareModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface LFSharePopVC : UIViewController
@property(nonatomic, strong)LFShareModel *model;
+ (instancetype) sharePopVC;
@end

NS_ASSUME_NONNULL_END
