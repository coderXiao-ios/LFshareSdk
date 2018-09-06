//
//  LFSelfUserManager.h
//  shareProDemo
//
//  Created by Xiao Xiao on 2018/9/4.
//  Copyright © 2018年 xiaoxiao. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LFSelfUserManager : NSObject
/**
 * 是否登录
 */
-(BOOL)isLogIn;
/**
 * 获取本地用户Id
 */
-(NSString *)selfUserId;
/**
 * 获取本地用户昵称
 */
-(NSString *)selfUserName;
@end

NS_ASSUME_NONNULL_END
