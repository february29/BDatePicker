//
//  BDateHelper.h
//  BYHDatePicker
//
//  Created by bai on 16/5/13.
//  Copyright © 2016年 bai.xianzhi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BDateHelper : NSObject



+(BDateHelper *)helper;

-(NSDateFormatter *)dayFormatter;
-(NSDateFormatter *)monthFormatter;

- (NSCalendar *)calendar;

- (NSDate *)addToDate:(NSDate *)date months:(NSInteger)months;
- (NSDate *)addToDate:(NSDate *)date weeks:(NSInteger)weeks;
- (NSDate *)addToDate:(NSDate *)date days:(NSInteger)days;

// date所在月有多少个星期
- (NSUInteger)numberOfWeeks:(NSDate *)date;

/// date所在月的第一天日期
- (NSDate *)firstDayOfMonth:(NSDate *)date;
///date所在月的第一个星期的第一天（通常为上个月某个日期，特殊情况下为当天）
- (NSDate *)firstWeekDayOfMonth:(NSDate *)date;
///date所在星期的第一天
- (NSDate *)firstWeekDayOfWeek:(NSDate *)date;
///date所在月份
-(NSInteger)monthOfDay:(NSDate *)date;

- (BOOL)date:(NSDate *)dateA isTheSameMonthThan:(NSDate *)dateB;
- (BOOL)date:(NSDate *)dateA isTheSameWeekThan:(NSDate *)dateB;
- (BOOL)date:(NSDate *)dateA isTheSameDayThan:(NSDate *)dateB;

- (BOOL)date:(NSDate *)dateA isEqualOrBefore:(NSDate *)dateB;
- (BOOL)date:(NSDate *)dateA isEqualOrAfter:(NSDate *)dateB;
- (BOOL)date:(NSDate *)date isEqualOrAfter:(NSDate *)startDate andEqualOrBefore:(NSDate *)endDate;


@end
