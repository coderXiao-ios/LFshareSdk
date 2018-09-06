//
//  NSString+TextFiledCheck.m
//  shareProDemo
//
//  Created by Xiao Xiao on 2018/9/4.
//  Copyright © 2018年 xiaoxiao. All rights reserved.
//

#import "NSString+TextFiledCheck.h"

@implementation NSString (TextFiledCheck)
- (BOOL)isNumber{
    NSString * regex = @"^[0-9]*$";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    return [predicate evaluateWithObject:self];
}
@end
