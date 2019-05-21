//
//  BCalendarMonthView.h
//  BYHDatePicker
//
//  Created by bai on 16/5/16.
//  Copyright © 2016年 bai.xianzhi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BCalendarManager.h"

@interface BCalendarMonthView : UIView
@property(nonatomic,retain,readwrite)BCalendarManager *manager;
@property(nonatomic,retain,readwrite)NSDate *tempDate;
@end
