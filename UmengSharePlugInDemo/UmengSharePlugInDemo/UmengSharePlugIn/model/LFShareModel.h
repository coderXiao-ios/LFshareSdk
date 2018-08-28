//
//  LFShareModel.h
//  UmengSharePlugInDemo
//
//  Created by Xiao Xiao on 2018/8/27.
//  Copyright © 2018年 Xiao Xiao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LFShareModel : NSObject
/** 分享标题 */
@property (nonatomic, copy) NSString *title;

/** 分享内容 */
@property (nonatomic, copy) NSString *content;

/** 分享图片地址 */
@property (nonatomic, copy) NSString *imageUrl;

/** 分享地址 */
@property (nonatomic, copy) NSString *webpageUrl;

@end
