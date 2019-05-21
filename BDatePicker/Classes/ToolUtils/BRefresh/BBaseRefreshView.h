//
//  BBaseRefresh.h
//  BYHDatePicker
//
//  Created by bai on 16/5/19.
//  Copyright © 2016年 bai.xianzhi. All rights reserved.
//

#define BRefreshObserveKeyPath @"contentOffset"

#import <UIKit/UIKit.h>


typedef enum {
    BRefreshViewStateNormal,
    BRefreshViewStateWillRefresh,//即将刷新
    BRefreshViewStateRefreshing, //正在刷新
    
} BRefreshViewState;



@interface BBaseRefreshView : UIView
@property(nonatomic,strong)UIScrollView *scrollView;
- (void)endRefreshing;

@property (nonatomic, assign) UIEdgeInsets scrollViewOriginalInsets;
@property (nonatomic, assign) BRefreshViewState refreshState;

@end
