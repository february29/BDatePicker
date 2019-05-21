//
//  BCalendarDayView.h
//  BYHDatePicker
//
//  Created by bai on 16/5/13.
//  Copyright © 2016年 bai.xianzhi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BDateConfig.h"
#import "BCalendarManager.h"

@interface BCalendarDayView : UIView
@property(nonatomic,retain,readwrite)BCalendarManager *manager;

@property (nonatomic) NSDate *date;

///选中状态的显示圆圈
@property (nonatomic, readonly) UIView *circleView;

@property (nonatomic, readonly) UILabel *textLabel;

///不是当前月的时候灰色显示
@property (nonatomic) BOOL isFromAnotherMonth;

@end
