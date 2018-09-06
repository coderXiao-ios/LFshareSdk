//
//  HFFanCircleTitleView.h
//  XXSegmentedPager
//
//  Created by Xiao Xiao on 2018/7/3.
//  Copyright © 2018年 Xiao Xiao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HFFanCircleTitileStyleTool.h"
@interface HFFanCircleSegemntView : UIView
/*!带分割线的样式当前只支持两个标签的样式*/
@property(nonatomic, strong)HFFanCircleTitileStyleTool *segementStyle;
@property (strong, nonatomic) NSMutableArray<NSString *> *titlesArry;
@property (nonatomic, copy) void(^needRefreshBlock)(NSInteger index);
@property (nonatomic, copy) void(^scrollNextPageBlock)(NSInteger index);
@property(assign, nonatomic)NSInteger selectIdx;

- (instancetype)initWithFrame:(CGRect)frame titlesArry:(NSMutableArray<NSString *> *)titlesArry  segementStyle:(HFFanCircleTitileStyleTool *)segementStyle;
- (void) setSelectedSegmentIndex:(NSInteger)toIndex animated:(BOOL) animat;
@end
