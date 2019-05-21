//
//  BRefreshNormalView.m
//  BYHDatePicker
//
//  Created by bai on 16/5/19.
//  Copyright © 2016年 bai.xianzhi. All rights reserved.
//

#import "BRefreshNormalView.h"

@implementation BRefreshNormalView


- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setupView];
    }
    return self;
}

- (void)addToScrollView:(UIScrollView *)scrollView refreshBlock:(RefreshBlock)refrsh
{
    self.scrollView = scrollView;
    self.refreshBlock = refrsh;
}

- (void)setupView
{
    self.isAutoRefresh = YES;
    [self setBackgroundColor:[UIColor greenColor]];
}

- (void)setScrollView:(UIScrollView *)scrollView
{
    [super setScrollView:scrollView];
    
    [scrollView addSubview:self];
    self.hidden = YES;
}

- (void)endRefreshing
{
   
    
    [UIView animateWithDuration:0.2 animations:^{
        self.scrollView.contentInset = self.scrollViewOriginalInsets;
        
    }completion:^(BOOL finished) {
         [super endRefreshing];
    }];
   
}

- (void)setRefreshState:(BRefreshViewState)refreshState
{
    [super setRefreshState:refreshState];
    
    if (refreshState == BRefreshViewStateRefreshing) {
        
        self.scrollViewOriginalInsets = self.scrollView.contentInset;
        UIEdgeInsets insets = self.scrollView.contentInset;
        insets.right += BNormalRefreshFooterWith;
        self.scrollView.contentInset = insets;
//        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            if (self.refreshBlock) {
                self.refreshBlock();
            }

//        });

        
        
    }
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context
{
    self.frame = CGRectMake(self.scrollView.contentSize.width, 0 , BNormalRefreshFooterWith, self.scrollView.frame.size.height);

    if (![keyPath isEqualToString:BRefreshObserveKeyPath])return;
    
//   // 纵向下部
//    if (self.scrollView.contentOffset.y > self.scrollView.contentSize.height - self.scrollView.frame.size.height && self.refreshState != BRefreshViewStateRefreshing) {
//        self.frame = CGRectMake(0, self.scrollView.contentSize.height, self.scrollView.frame.size.width, BNormalRefreshFooterHeight);
//        self.hidden = NO;
//        self.refreshState = BRefreshViewStateRefreshing;
//    } else if (self.refreshState == BRefreshViewStateNormal) {
//        self.hidden = YES;
//    }
    
    
    NSLog(@"%d",self.refreshState);
  

    if (!self.isAutoRefresh||self.refreshState == BRefreshViewStateRefreshing||self.scrollView.contentSize.width==0)return;
    
    if (self.scrollView.contentInset.top+self.scrollView.contentOffset.x>self.scrollView.frame.size.height) {//内容大于 frame
          // 横向右部
        if (self.scrollView.contentOffset.x > self.scrollView.contentSize.width - self.scrollView.frame.size.width &&self.refreshState != BRefreshViewStateRefreshing) {
            // 防止手松开时连续调用
            CGPoint old = [change[@"old"] CGPointValue];
            CGPoint new = [change[@"new"] CGPointValue];
            if (new.x <= old.x) return;
           
            self.hidden = NO;
            self.refreshState = BRefreshViewStateRefreshing;
        } else if (self.refreshState == BRefreshViewStateNormal) {
            self.hidden = YES;
        }
    }
    
//    if (self.scrollView.isDragging) {
//    
//        if (self.refreshState == BRefreshViewStateNormal&&self.scrollView.contentOffset.x) {
//            
//        }
//        if (self.refreshState == BRefreshViewStateRefreshing)return;
//        
//        
//    }else if(self.refreshState == BRefreshViewStateNormal){
//        
//    }
    
  
//    if (self.scrollView.contentOffset.x > self.scrollView.contentSize.width - self.scrollView.frame.size.width &&self.refreshState != BRefreshViewStateRefreshing) {
//        
//        self.frame = CGRectMake(self.scrollView.contentSize.width, 0 , BNormalRefreshFooterWith, self.scrollView.frame.size.height);
//        self.hidden = NO;
//        self.refreshState = BRefreshViewStateRefreshing;
//    } else if (self.refreshState == BRefreshViewStateNormal) {
//        self.hidden = YES;
//    }else{
//      
//    }

}

@end
