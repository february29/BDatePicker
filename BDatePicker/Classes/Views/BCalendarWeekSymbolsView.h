//
//  BCalendarWeekHintView.h
//  BYHDatePicker
//
//  Created by bai on 16/5/13.
//  Copyright © 2016年 bai.xianzhi. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef NS_ENUM(NSInteger,BCalendarWeekSymbolsStyle){
    BCalendarWeekSymbolsStyleVeryShort,
    BCalendarWeekSymbolsStyleShort,
    BCalendarWeekSymbolsStyleFull
};

@interface BCalendarWeekSymbolsView :UIView
@property(nonatomic,readwrite)BCalendarWeekSymbolsStyle symbolsStyle;
//-(void)setTextWithStyle:(BCalendarWeekSymbosStyle)style;

@end
