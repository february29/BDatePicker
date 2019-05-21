//
//  BCalenderManager.h
//  BYHDatePicker
//
//  Created by bai on 16/5/12.
//  Copyright © 2016年 bai.xianzhi. All rights reserved.
//




#import <Foundation/Foundation.h>
//#import "BCalendarNormalShowView.h"


@protocol BCalendarDelegate <NSObject>

-(void)manager:(id)manager didSelectedDayView:(id )dayView date:(NSDate*)date;

@end

typedef NS_ENUM(NSInteger,BDatePickerStyle){
    BDatePickerStyleNormal,
    BDatePickerStyleHorizonal
    
};


@interface BCalendarManager : NSObject


@property(nonatomic,readwrite)BDatePickerStyle calendarStyle;
@property(nonatomic,weak)id<BCalendarDelegate> delegate;
//@property(nonatomic,retain,readonly)BCalendarNormalShowView  *normalView;

-(void)showDatePicker;
-(void)showDatePicker:(BDatePickerStyle)style;
-(void)dismiss;

@end
