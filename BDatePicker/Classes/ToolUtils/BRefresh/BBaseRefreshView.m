//
//  BBaseRefresh.m
//  BYHDatePicker
//
//  Created by bai on 16/5/19.
//  Copyright © 2016年 bai.xianzhi. All rights reserved.
//
#define BMethodNotImplemented() \
@throw [NSException exceptionWithName:NSInternalInconsistencyException \
reason:[NSString stringWithFormat:@"You must override %@ in a subclass.", NSStringFromSelector(_cmd)] \
userInfo:nil]


#import "BBaseRefreshView.h"

@implementation BBaseRefreshView


- (void)setScrollView:(UIScrollView *)scrollView
{
    _scrollView = scrollView;
     NSKeyValueObservingOptions options = NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld;
    [scrollView addObserver:self forKeyPath:BRefreshObserveKeyPath options:options context:nil];
}

- (void)willMoveToSuperview:(UIView *)newSuperview
{
    if (!newSuperview) {
        [self.scrollView removeObserver:self forKeyPath:BRefreshObserveKeyPath];
    }
}

- (void)endRefreshing
{
    self.refreshState = BRefreshViewStateNormal;
}


- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context
{
    // 子类实现
    BMethodNotImplemented();
}

@end
