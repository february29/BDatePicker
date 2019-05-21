//
//  BCalendarNormalView.m
//  BYHDatePicker
//
//  Created by bai on 16/5/17.
//  Copyright © 2016年 bai.xianzhi. All rights reserved.
//

#import "BCalendarNormalShowView.h"
#import "BCalendarMonthView.h"
#import "BDateHelper.h"
#import "BDateConfig.h"
#import "BRefreshNormalView.h"

@interface BCalendarNormalShowView()<UIScrollViewDelegate>{
    NSMutableArray *monthViews;
    UIScrollView *scrollerView;
    BRefreshNormalView *rithtRrefshView;
    NSInteger currentImageIndex;
}
@end
@implementation BCalendarNormalShowView
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
    self.layer.cornerRadius = 3.0f;
    
    monthViews = [[NSMutableArray alloc]init];
    
    scrollerView = [[UIScrollView alloc]init];
    scrollerView.scrollEnabled = YES;
    scrollerView.showsHorizontalScrollIndicator = NO;
    scrollerView.showsVerticalScrollIndicator = NO;
    scrollerView.pagingEnabled = YES;
    scrollerView.clipsToBounds = YES;
    scrollerView.delegate = self;
    
    [self addSubview: scrollerView];
    
    
    //加载控件待完善。。
    rithtRrefshView = [BRefreshNormalView new];
    __weak typeof(rithtRrefshView) weakrithtRrefshView = rithtRrefshView;
   
    [rithtRrefshView  addToScrollView:scrollerView refreshBlock:^{
        NSLog(@"---->>");
        [weakrithtRrefshView endRefreshing];
        
//        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//            
//        });

       
    }];
   
    
}



-(void)setTempDate:(NSDate *)tempDate{
    _tempDate = tempDate;
    
    for (int i  = 0; i<BNormalShowMonthNumber; i++) {
        NSDate *date = [[BDateHelper helper]addToDate:_tempDate months:i-BNormalShowMonthNumber/2];
        BCalendarMonthView *monthView = [[BCalendarMonthView alloc]init];
        monthView.manager = self.manager;
        [monthView setTempDate:date];
        [scrollerView addSubview:monthView];
        [monthViews addObject:monthView];
    }
}

-(void)layoutSubviews{
  
    float w = self.bounds.size.width;
    scrollerView.frame = CGRectMake(0, 0, w, self.bounds.size.height);
    [monthViews enumerateObjectsUsingBlock:^(BCalendarMonthView *obj, NSUInteger idx, BOOL *stop) {
        CGFloat x = idx * w;
        obj.frame = CGRectMake(x, 0,w, self.bounds.size.height);
    }];
    
    scrollerView.contentSize = CGSizeMake(monthViews.count * w,self.bounds.size.height);
    scrollerView.contentOffset = CGPointMake(1+BNormalShowMonthNumber/2 * w, 0);

}




//-(void)changeScrollerContenSize{
//    float w = self.bounds.size.width;
//    [scrollerView.subviews enumerateObjectsUsingBlock:^(BCalendarMonthView *obj, NSUInteger idx, BOOL *stop) {
//        CGFloat x = idx * w;
//        obj.frame = CGRectMake(x, 0,w, self.bounds.size.height);
//    }];
//    
//    scrollerView.contentSize = CGSizeMake(scrollerView.subviews.count * w, 0);
//}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    int index = (scrollView.contentOffset.x + scrollerView.frame.size.width * 0.5) / scrollerView.bounds.size.width;
    currentImageIndex = index;
   
    // 拖动一定距离后生成新的月份
//    CGFloat margin = 100;
//    CGFloat x = scrollView.contentOffset.x;
//    if ((x - index * self.bounds.size.width) > margin ) {
//        //右滑动
//        BCalendarMonthView *monthView = scrollerView.subviews.lastObject;
//        BCalendarMonthView *newMonthView = [[BCalendarMonthView alloc]init];
//        [monthView setTempDate:[[BDateHelper helper]addToDate:monthView.tempDate months:1] ];
//        [scrollerView addSubview:newMonthView];
//        [self changeScrollerContenSize];
//        NSLog(@"dfa");
//        
//    }else if((x - index * self.bounds.size.width) < - margin){
//        //左滑动
//        BCalendarMonthView *monthView = scrollerView.subviews.firstObject;
//        BCalendarMonthView *newMonthView = [[BCalendarMonthView alloc]init];
//        [monthView setTempDate:[[BDateHelper helper]addToDate:monthView.tempDate months:-1] ];
//        [scrollerView addSubview:newMonthView];
//        [self changeScrollerContenSize];
//         NSLog(@"dfa");
//    }
    
//    if (x == 0) {
//       
//        BCalendarMonthView *monthView = scrollerView.subviews[0];
//        BCalendarMonthView *newMonthView = [[BCalendarMonthView alloc]init];
//        [monthView setTempDate:[[BDateHelper helper]addToDate:monthView.tempDate months:1] ];
//        [scrollerView addSubview:newMonthView];
//        [self changeScrollerContenSize];
//
//    }else if(index == 1){
//        
//    }
    
   // NSLog(@"%d",index);
    
    
    
}



@end
