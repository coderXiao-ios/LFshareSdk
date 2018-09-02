//
//  UIImage+Tailoring.h
//  UmengSharePlugInDemo
//
//  Created by Xiao Xiao on 2018/8/29.
//  Copyright © 2018年 Xiao Xiao. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (Tailoring)
- (UIImage *)imageWithFileSize:(NSUInteger)fileSize;

- (UIImage *)imageWithFileSize:(NSUInteger)fileSize
                  scaledToSize:(CGSize)targetSize;
@end

NS_ASSUME_NONNULL_END
