//
//  LFShareManager.h
//  UmengSharePlugInDemo
//
//  Created by Xiao Xiao on 2018/8/27.
//  Copyright © 2018年 Xiao Xiao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UShareUI/UShareUI.h>
#import "LFShareModel.h"

@interface LFShareManager : NSObject
+ (void)configUmengShareSettings;

+ (void)showUMShareView:(LFShareModel *)model ;
@end
