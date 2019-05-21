//
//  BCalerdarCollectionShowView.m
//  BYHDatePicker
//
//  Created by bai on 16/5/18.
//  Copyright © 2016年 bai.xianzhi. All rights reserved.
//

#import "BCalerdarCollectionShowView.h"
#import "BCalendarMonthView.h"
#import "BDateHelper.h"
#import "BDateConfig.h"
@interface BCollectionViewLayout : UICollectionViewLayout

@end

@implementation BCollectionViewLayout

-(BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds{
    return  YES;
}
-(CGSize)collectionViewContentSize{
    CGSize size = CGSizeMake(self.collectionView.frame.size.width*[self.collectionView numberOfItemsInSection:0 ], self.collectionView.frame.size.height);
   
    return size;
    
}

-(UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath{
   
//    UICollectionViewLayoutAttributes *attributes = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
//    attributes.frame = CGRectMake(indexPath.item*40, 0, self.collectionView.frame.size.width, self.collectionView.frame.size.height);
    
    UICollectionViewLayoutAttributes* attributes = attributes = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
    UICollectionView *collection = self.collectionView;
    float width = collection.frame.size.width;
    float height = collection.frame.size.height;
    float x = collection.contentOffset.x;
    CGFloat arc = M_PI * 2.0f;
    
    
    int numberOfVisibleItems = [self.collectionView numberOfItemsInSection:0 ];
    
    attributes.center = CGPointMake(x+width/2,height/2);
    attributes.size = CGSizeMake(width,height);
    
    
    CATransform3D transform = CATransform3DIdentity;
    //transform.m34 = -1.0f/700.0f;
    
    CGFloat radius = attributes.size.width/2/ tanf(arc/2.0f/numberOfVisibleItems);
    CGFloat angle = (indexPath.row-x/width+1)/ numberOfVisibleItems * arc;
    transform = CATransform3DRotate(transform, angle, 0.0f, 1.0f, 0.0f);
    transform = CATransform3DTranslate(transform, 0.f, 0.0f, radius);
    attributes.transform3D = transform ;
    return attributes;
}



-(NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect{
    
    NSArray *arr = [super layoutAttributesForElementsInRect:rect];
    if ([arr count] > 0) {
        return arr;
    }
    NSMutableArray *attributes = [NSMutableArray array];
    for (NSInteger i = 0 ; i < [self.collectionView numberOfItemsInSection:0 ]; i++) {
        NSIndexPath *indexPath = [NSIndexPath indexPathForItem:i inSection:0];
        [attributes addObject:[self layoutAttributesForItemAtIndexPath:indexPath]];
    }
    return attributes;
}

@end

@interface BCalerdarCollectionShowView()<UICollectionViewDataSource,UICollectionViewDelegate,UIScrollViewDelegate>{
    UICollectionView *collectionView;
    NSMutableArray *monthViews;
}
@end
@implementation BCalerdarCollectionShowView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self setUp];
    }
    return self;
}

-(void)setUp{
    
    self.backgroundColor = [UIColor whiteColor];
    
    BCollectionViewLayout *layout = [[BCollectionViewLayout alloc]init];
    
    [collectionView setBackgroundColor:[UIColor clearColor]];
    collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height) collectionViewLayout:layout];
    collectionView.delegate = self;
    collectionView.dataSource = self;
    
    [collectionView registerClass:[UICollectionViewCell class]forCellWithReuseIdentifier:@"UICollectionViewCell"];
    [self addSubview:collectionView];
    
    
    monthViews = [[NSMutableArray alloc]init];
    
}

-(void)setTempDate:(NSDate *)tempDate{
    _tempDate = tempDate;
    
    for (int i  = 0; i<4; i++) {
        NSDate *date = [[BDateHelper helper]addToDate:_tempDate months:i-4/2];
        BCalendarMonthView *monthView = [[BCalendarMonthView alloc]init];
        monthView.frame = CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height);
        monthView.manager = self.manager;
        [monthView setTempDate:date];
        [monthViews addObject:monthView];
        
    }
    [collectionView reloadData];
    
}

-(void)layoutSubviews{
   // collectionView .frame = CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height);

    
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return [monthViews count];
}
//定义展示的Section的个数
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * CellIdentifier = @"UICollectionViewCell";
    UICollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:CellIdentifier forIndexPath:indexPath];
  
    cell.backgroundColor = [UIColor whiteColor];
//    cell.backgroundColor = [UIColor colorWithRed:((10 * indexPath.row) / 255.0) green:((20 * indexPath.row)/255.0) blue:((30 * indexPath.row)/255.0) alpha:1.0f];
//    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 20, 20)];
//    label.textColor = [UIColor redColor];
//    label.text = [NSString stringWithFormat:@"%ld",(long)indexPath.row];
//    for (id subView in cell.contentView.subviews) {
//        [subView removeFromSuperview];
//    }
//    [cell.contentView addSubview:label];
    
    BCalendarMonthView *cellView = [monthViews objectAtIndex:indexPath.item];
    for (UIView *view in cell.contentView.subviews) {
        [view removeFromSuperview];
    }
    [cell.contentView addSubview:cellView];
    return cell;

}

#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)_scrollView
{
    //无限循环....
//    float targetX = _scrollView.contentOffset.x;
//    int numCount = [collectionView numberOfItemsInSection:0];
//    float ITEM_WIDTH = _scrollView.frame.size.width;
//    
//    if (numCount>=3)
//    {
//        if (targetX < ITEM_WIDTH/2) {
//            [_scrollView setContentOffset:CGPointMake(targetX+ITEM_WIDTH *numCount, 0)];
//        }
//        else if (targetX >ITEM_WIDTH/2+ITEM_WIDTH *numCount)
//        {
//            [_scrollView setContentOffset:CGPointMake(targetX-ITEM_WIDTH *numCount, 0)];
//        }
//    }
//    
}


@end
