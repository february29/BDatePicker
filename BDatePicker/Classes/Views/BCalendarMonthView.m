//
//  BCalendarMonthView.m
//  BYHDatePicker
//
//  Created by bai on 16/5/16.
//  Copyright © 2016年 bai.xianzhi. All rights reserved.
//

#import "BCalendarMonthView.h"
#import "BCalendarWeekSymbolsView.h"
#import "BCalendarWeekView.h"
#import "BDateConfig.h"
#import "BDateHelper.h"
@interface BCalendarMonthView(){
    NSMutableArray *weeksArray;
    UILabel *titleLable ;
    BCalendarWeekSymbolsView *weekSymbolsView;
}

@end


@implementation BCalendarMonthView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
    
        [self setUp];
    }
    return self;
}
- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [self setUp];
    }
    return self;
}

-(void)setUp{
    weeksArray = [[NSMutableArray alloc]init];
    
    
    titleLable = [[UILabel alloc]init];
    titleLable.textColor = BWeekTilteTextColor;
    titleLable.font = BWeekTitleFont;
    titleLable.textAlignment = NSTextAlignmentCenter;
    [self addSubview:titleLable];
    
    weekSymbolsView =[BCalendarWeekSymbolsView new];
    
    [self addSubview:weekSymbolsView];
}

-(void)setTempDate:(NSDate *)tempDate{
    _tempDate = tempDate;
   
    NSUInteger numberOfWeek = [[BDateHelper helper]numberOfWeeks:tempDate];
    NSDate *firstDayOfMonth = [[BDateHelper helper]firstWeekDayOfMonth:tempDate];
    for (int  i = 0; i<numberOfWeek; i++) {
        BCalendarWeekView *weekView = [BCalendarWeekView new];
        weekView.manager = self.manager;
        weekView.startDay = [[BDateHelper helper]addToDate:firstDayOfMonth weeks:i];
        weekView.tempDay = tempDate;
        [weeksArray addObject:weekView];
        [self addSubview:weekView];
        
        if (i==0||i==numberOfWeek-1) {
            weekView.shoudCheckAnotherMonth = YES;
        }
    }
    
    
    titleLable.text = [[BDateHelper helper].monthFormatter stringFromDate:tempDate];
    
   // [self layoutIfNeeded];
}

-(void)layoutSubviews{
    if (weeksArray.count<=0) {
        return;
    }
    
    titleLable.frame = CGRectMake(0, 0, self.bounds.size.width, BWeekViewTitleH);
    weekSymbolsView.frame = CGRectMake(0, BWeekViewTitleH, self.bounds.size.width, BWeekViewSymbolsH);
    
    float y = BWeekViewSymbolsH+BWeekViewTitleH;
    for (UIView *weekView in weeksArray) {
        weekView.frame = CGRectMake(0, y, self.bounds.size.width,BWeekViewH);
        y+=BWeekViewH;
    }

    CGRect sfFrame = self.frame;
    sfFrame.size.height = weeksArray.count*BWeekViewH + BWeekViewSymbolsH+BWeekViewTitleH;
    self.frame = sfFrame;
    
    
}


@end
