//
//  BCalendarWeekHintView.m
//  BYHDatePicker
//
//  Created by bai on 16/5/13.
//  Copyright © 2016年 bai.xianzhi. All rights reserved.
//

#import "BCalendarWeekSymbolsView.h"
#import "BDateHelper.h"
#import "BDateConfig.h"
@interface BCalendarWeekSymbolsView(){
    NSMutableArray *weekLables;
}
@end
@implementation BCalendarWeekSymbolsView
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
    
    
    NSMutableArray *dayViews = [NSMutableArray new];
    
    for(int i = 0; i < 7; ++i){
        UILabel *label = [UILabel new];
        [self addSubview:label];
        [dayViews addObject:label];
        
        label.textAlignment = NSTextAlignmentCenter;
        label.textColor = BWeekSymbolsTextColor;
        label.font = BWeekSymbolsFont;
    }
    
    weekLables = dayViews;
   
    self.symbolsStyle = BCalendarWeekSymbolsStyleShort;
   
}



-(void)setSymbolsStyle:(BCalendarWeekSymbolsStyle)symbolsStyle{
    _symbolsStyle = symbolsStyle;
    [self setTextWithStyle:symbolsStyle];
}


-(void)setTextWithStyle:(BCalendarWeekSymbolsStyle)style{
    
    
    NSDateFormatter *dateFormatter = [NSDateFormatter new];
    
    dateFormatter.timeZone = [[BDateHelper helper] calendar].timeZone;
    dateFormatter.locale = [[BDateHelper helper] calendar].locale;
   
    
    NSMutableArray *days;
    switch (style) {
        case BCalendarWeekSymbolsStyleFull:
        {
            days = [[dateFormatter standaloneWeekdaySymbols] mutableCopy];
              break;
        }
        case BCalendarWeekSymbolsStyleShort:
        {
            days = [[dateFormatter shortStandaloneWeekdaySymbols] mutableCopy];
            break;
        }
        case BCalendarWeekSymbolsStyleVeryShort:
        {
            days = [[dateFormatter veryShortStandaloneWeekdaySymbols] mutableCopy];
            break;
        }
            
        default:
            break;
    }
    
    for(NSInteger i = 0; i < days.count; ++i){
        NSString *day = days[i];
        [days replaceObjectAtIndex:i withObject:[day uppercaseString]];
        
        UILabel *label =  weekLables[i];
        label.text = days[i];

    }

}

- (void)layoutSubviews
{
    if(!weekLables){
        return;
    }
    
    CGFloat x = 0;
    CGFloat dayWidth = self.frame.size.width / 7;
    CGFloat dayHeight = self.frame.size.height;
    
    for(UIView *dayView in weekLables){
        dayView.frame = CGRectMake(x, 0, dayWidth, dayHeight);
        x += dayWidth;
    }
}


@end
