//
//  LFShareModel.h
//  UmengSharePlugInDemo
//
//  Created by Xiao Xiao on 2018/8/27.
//  Copyright © 2018年 Xiao Xiao. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef enum : NSUInteger {
    LFSharePlatFormWX,
    LFSharePlatFormWXFriends,
    LFSharePlatFormWeiBo,
    LFSharePlatFormQQ,
    LFSharePlatFormQQZone,
} LFSharePlatFormType;
@interface LFShareModel : NSObject
/** 分享标题 */
@property (nonatomic, copy) NSString *title;

/** 分享内容 */
@property (nonatomic, copy) NSString *content;

/** 分享图片地址 */
@property (nonatomic, strong) UIImage *shareImage;

/** 分享地址 */
@property (nonatomic, copy) NSString *linkUrl;

/** 分享平台 分享弹窗会自动赋值*/
@property (nonatomic, assign) LFSharePlatFormType platformType;
@end
