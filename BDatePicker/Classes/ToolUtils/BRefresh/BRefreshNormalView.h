//
//  BRefreshNormalView.h
//  BYHDatePicker
//
//  Created by bai on 16/5/19.
//  Copyright © 2016年 bai.xianzhi. All rights reserved.
//

#define BNormalRefreshFooterWith 50.0f

#import "BBaseRefreshView.h"

typedef  void(^RefreshBlock)();

@interface BRefreshNormalView : BBaseRefreshView
- (void)addToScrollView:(UIScrollView *)scrollView refreshBlock:(RefreshBlock)refrsh;
@property (nonatomic, copy) RefreshBlock  refreshBlock;
@property(nonatomic)BOOL isAutoRefresh;

@end
