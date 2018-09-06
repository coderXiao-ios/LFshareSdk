//
//  LFSharePopView.h
//  UmengSharePlugInDemo
//
//  Created by Xiao Xiao on 2018/8/29.
//  Copyright © 2018年 Xiao Xiao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LFShareModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface LFSharePopView : UIView
@property(nonatomic, strong)LFShareModel *model;
-(void)showShareView;
@end

NS_ASSUME_NONNULL_END
