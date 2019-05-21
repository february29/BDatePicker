//
//  BDateConfig.h
//  BYHDatePicker
//
//  Created by bai on 16/5/16.
//  Copyright © 2016年 bai.xianzhi. All rights reserved.
//

#ifndef BDateConfig_h
#define BDateConfig_h
//=======================Globle config==========================

#define BcalendarHasSelectDayNotification @"BcalendarHasSelectDayNotification"
#define MScreenW [UIScreen mainScreen].bounds.size.width
#define MScreenH [UIScreen mainScreen].bounds.size.height  

//=======================DayView config==========================
#define BDayCirlcleColor [UIColor colorWithRed:0x33/256. green:0xB3/256. blue:0xEC/256. alpha:.5];
#define BDayTextColor [UIColor blackColor]
#define BDayAnotherMonthTextColor [UIColor grayColor];
#define BDayTextFont [UIFont systemFontOfSize:[UIFont systemFontSize]];

//=======================WeekView config==========================
#define BWeekSymbolsTextColor [UIColor colorWithRed:152./256. green:147./256. blue:157./256. alpha:1.];
#define BWeekSymbolsFont [UIFont systemFontOfSize:11]
#define BWeekViewSymbolsH 20.0f
#define BWeekViewH  40.0f
#define BWeekViewTitleH  60.0f
#define BWeekTilteTextColor [UIColor blackColor]
#define BWeekTitleFont [UIFont systemFontOfSize:18]

//=======================MonthView config==========================
#define BMonthViewH 6*BWeekViewH + BWeekViewSymbolsH+BWeekViewTitleH
//#define BMonthViewW MScreenW-40
#define BMonthViewW 300

//=======================normalshowview config==========================
#define BNormalShowMonthNumber  24  //日历显示的月份个数

#endif /* BDateConfig_h */
