//
//  BCalendarWeekView.m
//  BYHDatePicker
//
//  Created by bai on 16/5/13.
//  Copyright © 2016年 bai.xianzhi. All rights reserved.
//
#define weekDays 7
#import "BCalendarWeekView.h"
#import "BCalendarDayView.h"
#import "BDateHelper.h"
@interface BCalendarWeekView(){
    NSMutableArray *dayViews;
}

@end

@implementation BCalendarWeekView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if(!self){
        return nil;
    }
    
    [self setUp];
    
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if(!self){
        return nil;
    }
    
    [self setUp];
    
    return self;
}

- (void)setUp
{
    
    dayViews = [[NSMutableArray alloc]init];
    
    
}


-(void)setStartDay:(NSDate *)startDay{
    _startDay = startDay;
    for(int i = 0; i < weekDays; ++i){
        BCalendarDayView *dayView = [BCalendarDayView new];
        dayView.manager = self.manager;
        [dayViews addObject:dayView];
        [self addSubview:dayView];
        
    }

    [self setText];
}

-(void)setText{
    
    for(NSInteger i = 0; i < weekDays; ++i){
        
        BCalendarDayView *dayView =  dayViews[i];
        NSDate *date = [[BDateHelper helper]addToDate:_startDay days:i];
        [dayView setDate:date];
    }
    
}

-(void)setShoudCheckAnotherMonth:(BOOL)shoudCheckAnotherMonth{
    _shoudCheckAnotherMonth = shoudCheckAnotherMonth;
    
    if (shoudCheckAnotherMonth) {
        for(NSInteger i = 0; i < weekDays; ++i){
            
            BCalendarDayView *dayView =  dayViews[i];
            NSDate *date = [[BDateHelper helper]addToDate:_startDay days:i];
            if (![[BDateHelper helper]date:date isTheSameMonthThan:_tempDay]) {
                dayView.isFromAnotherMonth=YES;
            }
        }

    }
   
    
}
- (void)layoutSubviews
{
    if(!dayViews){
        return;
    }
    
    CGFloat x = 0;
    CGFloat dayWidth = self.frame.size.width / weekDays;
    CGFloat dayHeight = self.frame.size.height;
    
    for(UIView *dayView in dayViews){
        dayView.frame = CGRectMake(x, 0, dayWidth, dayHeight);
        x += dayWidth;
    }
}

@end
