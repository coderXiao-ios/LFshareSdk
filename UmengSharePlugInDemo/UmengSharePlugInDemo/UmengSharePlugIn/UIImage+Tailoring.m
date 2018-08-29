//
//  UIImage+Tailoring.m
//  UmengSharePlugInDemo
//
//  Created by Xiao Xiao on 2018/8/29.
//  Copyright © 2018年 Xiao Xiao. All rights reserved.
//

#import "UIImage+Tailoring.h"

@implementation UIImage (Tailoring)
#pragma mark scale
- (UIImage *)imageWithFileSize:(NSUInteger)fileSize
{
    UIImage *newImage = self;
    NSData * imageData = UIImageJPEGRepresentation(self,1);
    NSUInteger oFileSize = imageData.length;
    if (oFileSize < fileSize) {
        return newImage;
    }
    
    CGFloat compression = 1.0f;
    
    while ([imageData length] > fileSize && compression >= 0) {
        compression -= 0.1;
        imageData = UIImageJPEGRepresentation(newImage, compression);
    }
    
    UIImage *compressedImage = [UIImage imageWithData:imageData];
    return compressedImage;
    
}
- (UIImage *)imageWithFileSize:(NSUInteger)fileSize
                  scaledToSize:(CGSize)targetSize
{
    
    //scale
    UIImage *sourceImage = self;
    UIImage *newImage = self;
    CGSize imageSize = sourceImage.size;
    CGFloat width = imageSize.width;
    CGFloat height = imageSize.height;
    CGFloat targetWidth = targetSize.width;
    CGFloat targetHeight = targetSize.height;
    CGFloat scaleFactor = 0.0;
    CGFloat scaledWidth = targetWidth;
    CGFloat scaledHeight = targetHeight;
    CGPoint thumbnailPoint = CGPointMake(0.0,0.0);
    
    if (CGSizeEqualToSize(imageSize, targetSize) == NO) {
        
        CGFloat widthFactor = targetWidth / width;
        CGFloat heightFactor = targetHeight / height;
        
        if (widthFactor > heightFactor)
            scaleFactor = widthFactor; // scale to fit height
        else
            scaleFactor = heightFactor; // scale to fit width
        scaledWidth= width * scaleFactor;
        scaledHeight = height * scaleFactor;
        
        // center the image
        if (widthFactor > heightFactor)
        {
            thumbnailPoint.y = (targetHeight - scaledHeight) * 0.5;
        }
        else if (widthFactor < heightFactor)
        {
            thumbnailPoint.x = (targetWidth - scaledWidth) * 0.5;
        }
        
        UIGraphicsBeginImageContext(targetSize); // this will crop
        
        CGRect thumbnailRect = CGRectZero;
        thumbnailRect.origin = thumbnailPoint;
        thumbnailRect.size.width= scaledWidth;
        thumbnailRect.size.height = scaledHeight;
        
        [sourceImage drawInRect:thumbnailRect];
        
        newImage = UIGraphicsGetImageFromCurrentImageContext();
        
        //pop the context to get back to the default
        UIGraphicsEndImageContext();
        
        if(newImage == nil)
        {
            NSLog(@"could not scale image");
            return self;
        }
        
    }
    
    //compress
    NSData * imageData = UIImageJPEGRepresentation(newImage,1);
    NSUInteger oFileSize = imageData.length;
    if (oFileSize < fileSize) {
        return newImage;
    }
    
    CGFloat compression = 1.0f;
    
    while ([imageData length] > fileSize && compression > 0) {
        compression -= 0.1;
        imageData = UIImageJPEGRepresentation(newImage, compression);
    }
    
    UIImage *compressedImage = [UIImage imageWithData:imageData];
    return compressedImage;
}
@end
