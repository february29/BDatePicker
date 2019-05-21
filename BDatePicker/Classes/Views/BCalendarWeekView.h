//
//  BCalendarWeekView.h
//  BYHDatePicker
//
//  Created by bai on 16/5/13.
//  Copyright © 2016年 bai.xianzhi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BCalendarManager.h"

@interface BCalendarWeekView : UIView
@property(nonatomic,retain,readwrite)BCalendarManager *manager;
@property(nonatomic,retain,readwrite)NSDate *startDay;
///生成日历的时间，用于判断星期中是否有不是当月的date
@property(nonatomic,retain,readwrite)NSDate *tempDay;

@property(nonatomic,readwrite)BOOL shoudCheckAnotherMonth;
@end
