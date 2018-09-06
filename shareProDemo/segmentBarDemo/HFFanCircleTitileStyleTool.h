//
//  HFFanCircleTitileStyleToool.h
//  XXSegmentedPager
//
//  Created by Xiao Xiao on 2018/7/4.
//  Copyright © 2018年 Xiao Xiao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
typedef NS_ENUM(NSInteger, HFFanCircleTitileStyleType) {
    HFFanCircleTitileStyleLeft =0,
    HFFanCircleTitileStyleRight ,
    HFFanCircleTitileStyleCenter
};

@interface HFFanCircleTitileStyleTool : NSObject
@property (assign, nonatomic)float durtionTime;//默认为0
@property (assign, nonatomic)float cellSpace;
@property (assign, nonatomic)BOOL isBottomeSpearateLine;//底部是否有分割线
@property (assign, nonatomic)BOOL isSpearateLine;//标签之间是否有分割线
@property (assign, nonatomic)BOOL isScrollLine;//是否有滚动条
@property (assign, nonatomic)float spearateLineHeight;//
@property (strong, nonatomic)UIColor *selectColor;
@property (strong, nonatomic)UIFont *selectFont;
@property (strong, nonatomic)UIFont *normalFont;
@property (strong, nonatomic)UIColor *normalColor;
@property (strong, nonatomic)UIColor *separateColor;
@property (assign, nonatomic)HFFanCircleTitileStyleType postionType;
@property (strong, nonatomic)UIColor *bottomeSpearateLineColor;
@end
