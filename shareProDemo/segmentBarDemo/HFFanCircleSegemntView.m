//
//  HFFanCircleTitleView.m
//  XXSegmentedPager
//
//  Created by Xiao Xiao on 2018/7/3.
//  Copyright © 2018年 Xiao Xiao. All rights reserved.
//

#import "HFFanCircleSegemntView.h"
#import "UIView+Extension.h"
#define ScreenNarrowSide MIN(CGRectGetWidth([UIScreen mainScreen].bounds), CGRectGetHeight([UIScreen mainScreen].bounds))
#define UIColorFromRGBA(rgbValue, a) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:a]

@interface HFFanCircleTitleLayOut:UICollectionViewFlowLayout
@property (nonatomic,assign)CGFloat betweenOfCell;
@property (nonatomic,assign)NSInteger itemCount;
@property (nonatomic,strong)NSMutableArray *attributeAttay;
@property (nonatomic,assign)CGFloat top;
@property (nonatomic,assign)CGFloat cellHeight;
@property (strong, nonatomic) NSMutableArray<NSNumber *> *widthsArry;
@end
@implementation HFFanCircleTitleLayOut
-(instancetype)init{
    self = [super init];
    if (self){
        self.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    }
    return self;
}

-(void)setBetweenOfCell:(CGFloat)betweenOfCell{
    _betweenOfCell = betweenOfCell;
    self.minimumInteritemSpacing = betweenOfCell;
}

- (void)prepareLayout
{
    [super prepareLayout];
    if (_attributeAttay.count ==0) {
        if (_attributeAttay == nil) {
            _attributeAttay = [[NSMutableArray alloc]init];
        }
        [_attributeAttay removeAllObjects];
        _itemCount = [self.collectionView numberOfItemsInSection:0];
        for (int i = 0 ; i < _itemCount; i ++) {
            UICollectionViewLayoutAttributes *attribute = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:[NSIndexPath indexPathForRow:i inSection:0]];
            attribute.frame = CGRectMake( i == 0? ScreenNarrowSide/2.0 - _betweenOfCell/2.0 -_widthsArry[i].doubleValue :ScreenNarrowSide/2.0 +_betweenOfCell/2.0,_top, _widthsArry[i].doubleValue, _cellHeight);
            [_attributeAttay addObject:attribute];
        }
    }
}

-(NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect{
    return _attributeAttay;
}

@end

@interface HFFanCircleTitleCell:UICollectionViewCell
@property(strong, nonatomic)UILabel *titleLb;
@property(assign, nonatomic)BOOL isSelect;
@property(nonatomic, strong)HFFanCircleTitileStyleTool *segementStyle;
@end

@implementation HFFanCircleTitleCell
- (void)layoutSubviews{
    [super layoutSubviews];
    _titleLb.frame = self.bounds;
}
-  (void)setIsSelect:(BOOL)isSelect{
    _isSelect = isSelect;
    if (isSelect == YES) {
        _titleLb.textColor = _segementStyle.selectColor;
        _titleLb.font = _segementStyle.selectFont;
    }else{
        _titleLb.textColor = _segementStyle.normalColor;
        _titleLb.font = _segementStyle.normalFont;
    }
}

- (UILabel *)titleLb{
    if (!_titleLb) {
        _titleLb = [[UILabel alloc] init];
        [self addSubview:_titleLb];
        
    }
    return _titleLb;
}

@end

@interface HFFanCircleSegemntView()<UICollectionViewDelegate, UICollectionViewDataSource>
@property(nonatomic, strong)UICollectionView *collectionView;
@property (strong, nonatomic) UIView *scrollLine;
@property (strong, nonatomic) UIView *separatLine;
@property (strong, nonatomic) UIView *cellSeparatLine;
@property (strong, nonatomic) NSMutableArray<NSNumber *> *titlesWidthArry;
@end
@implementation HFFanCircleSegemntView
- (instancetype)initWithFrame:(CGRect)frame titlesArry:(NSMutableArray<NSString *> *)titlesArry  segementStyle:(HFFanCircleTitileStyleTool *)segementStyle{
    if ([super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
        _selectIdx = 0;
        _segementStyle = segementStyle;
        _titlesWidthArry = [NSMutableArray array];
        self.titlesArry = [NSMutableArray arrayWithArray:titlesArry];
        self.scrollLine.frame = CGRectMake( ScreenNarrowSide/2.0 - _segementStyle.cellSpace/2.0 -_titlesWidthArry.firstObject.floatValue/2.0 - 23/2.0, CGRectGetHeight(frame)  - 6.5 - 3, 23, 3);

        [self addSubview:self.collectionView];
        _collectionView.backgroundColor = [UIColor clearColor];
        if (_segementStyle.isBottomeSpearateLine) {
            [self addSubview:self.separatLine];
            if (_segementStyle.bottomeSpearateLineColor) {
                self.separatLine.backgroundColor = _segementStyle.bottomeSpearateLineColor;
            }
        }
        if (_segementStyle.isScrollLine) {
            [self addSubview:self.scrollLine];
        }
        if (_segementStyle.isSpearateLine) {
            _cellSeparatLine = [[UIView alloc] init];
            _cellSeparatLine.backgroundColor = UIColorFromRGBA(0xe6e6e6, 1.0);
            [self addSubview:_cellSeparatLine];
        }
    }
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    _collectionView.frame = self.bounds;
    _separatLine.frame =CGRectMake(0, CGRectGetHeight(self.frame) - 0.5, CGRectGetWidth(self.frame), 0.5);
    _cellSeparatLine.frame =CGRectMake(floor(( CGRectGetWidth(self.frame) -0.5)/2.0), floor(( CGRectGetHeight(self.frame) -_segementStyle.spearateLineHeight)/2.0) , 0.5, _segementStyle.spearateLineHeight);
}

- (UIView *)separatLine{
    if (!_separatLine) {
        _separatLine = [[UIView alloc] init];
        _separatLine.backgroundColor = UIColorFromRGBA(0xd1d1d1 , 1.0);
    }
    return _separatLine;
}

- (void)setTitlesArry:(NSMutableArray *)titlesArry{
    _titlesArry = titlesArry;
    __weak typeof(self) weakParam = self;
    [_titlesArry enumerateObjectsUsingBlock:^(NSString * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        CGRect bounds = [obj boundingRectWithSize:CGSizeMake(MAXFLOAT, 0.0) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName: [UIFont systemFontOfSize:16]} context:nil];
        [weakParam.titlesWidthArry addObject:[NSNumber numberWithDouble:CGRectGetWidth(bounds)]];
    }];
 
}

- (void) setSelectedSegmentIndex:(NSInteger)toIndex animated:(BOOL) animat{
    if (_selectIdx == toIndex) return;
    HFFanCircleTitleCell *oldCell = (HFFanCircleTitleCell *)[_collectionView cellForItemAtIndexPath:[NSIndexPath indexPathForItem:_selectIdx inSection:0]];
    oldCell.isSelect = NO;
    NSTimeInterval durationTime = animat == YES ?0.3 :0;
    HFFanCircleTitleCell *cell = (HFFanCircleTitleCell *)[self.collectionView cellForItemAtIndexPath:[NSIndexPath indexPathForItem:toIndex inSection:0]];
    [UIView animateWithDuration:durationTime animations:^{
        self.scrollLine.centerX = cell.centerX;
        cell.isSelect = YES;
        self.selectIdx = toIndex;
    }];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.titlesArry.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    HFFanCircleTitleCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([HFFanCircleTitleCell class]) forIndexPath:indexPath];
    cell.segementStyle = _segementStyle;
    cell.titleLb.text = _titlesArry[indexPath.item];
    if (indexPath.item == _selectIdx) {
        cell.isSelect = YES;
    }else{
        cell.isSelect = NO;
    }
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    HFFanCircleTitleCell *cell = (HFFanCircleTitleCell *)[collectionView cellForItemAtIndexPath:indexPath];
    if (cell.isSelect == YES ) {
        if(self.needRefreshBlock)self.needRefreshBlock(indexPath.item);
    }else{
        [self setSelectedSegmentIndex:indexPath.item animated:YES];   if(self.scrollNextPageBlock)self.scrollNextPageBlock(indexPath.item);
    }
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake([self.titlesWidthArry[indexPath.item] doubleValue], _segementStyle.isScrollLine == YES?23:self.height);
}
#pragma mark getter
- (UIView *)scrollLine{
    if (!_scrollLine) {
        _scrollLine = [[UIView alloc] init];
        _scrollLine.backgroundColor = [UIColor colorWithRed:255/255.0 green:37/255.0 blue:83/255.0 alpha:1/1.0];
        _scrollLine.layer.cornerRadius = 1.5;
    }
    return _scrollLine;
}

- (UICollectionView *)collectionView{
        if (!_collectionView) {
            HFFanCircleTitleLayOut *layout = [[HFFanCircleTitleLayOut alloc] init];
            layout.betweenOfCell = _segementStyle.cellSpace;
            layout.widthsArry = _titlesWidthArry.mutableCopy;
            layout.cellHeight =_segementStyle.isScrollLine == YES?23:self.height;
            layout.top= _segementStyle.isScrollLine == YES?10.5:0;
            _collectionView = [[UICollectionView alloc] initWithFrame:self.bounds collectionViewLayout:layout];
            _collectionView.delegate = self;
            _collectionView.dataSource =self;
            _collectionView.alwaysBounceVertical = NO;
            [_collectionView registerClass:[HFFanCircleTitleCell class] forCellWithReuseIdentifier:NSStringFromClass([HFFanCircleTitleCell class])];
        }
        return _collectionView;
}
@end
