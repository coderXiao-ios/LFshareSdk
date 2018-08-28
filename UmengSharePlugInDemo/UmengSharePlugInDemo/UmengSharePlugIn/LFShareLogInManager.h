//
//  LFShareLogInManager.h
//  UmengSharePlugInDemo
//
//  Created by Xiao Xiao on 2018/8/27.
//  Copyright © 2018年 Xiao Xiao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LFShareModel.h"
#import "LFShareConst.h"
typedef enum : NSUInteger {
    LFSharePlatFormQQ,
    LFSharePlatFormQQZone,
    LFSharePlatFormWX,
    LFSharePlatFormSina
} LFSharePlatForm;

typedef enum : NSUInteger {
    LFShareContentTypeVedio,
    LFShareContentTypeImage,
    LFShareContentTypeContent,
    LFShareContentTypeLink
} LFShareContentType;

@interface LFShareLogInManager : NSObject
HFSingletonH
@end
