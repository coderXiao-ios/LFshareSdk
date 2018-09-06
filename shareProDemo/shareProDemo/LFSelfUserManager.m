//
//  LFSelfUserManager.m
//  shareProDemo
//
//  Created by Xiao Xiao on 2018/9/4.
//  Copyright © 2018年 xiaoxiao. All rights reserved.
//

#import "LFSelfUserManager.h"

@implementation LFSelfUserManager
+ (LFSelfUserManager *)sharedInstance
{
    static LFSelfUserManager * sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[LFSelfUserManager alloc] init];
    });
    return sharedInstance;
}
@end
