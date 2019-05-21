//
//  BCalendarNormalView.h
//  BYHDatePicker
//
//  Created by bai on 16/5/17.
//  Copyright © 2016年 bai.xianzhi. All rights reserved.
//


///功能待完善

#import <UIKit/UIKit.h>
#import "BCalendarManager.h"


@interface BCalendarNormalShowView : UIView

@property(nonatomic,retain,readwrite) BCalendarManager *manager;
@property(nonatomic,retain,readwrite)NSDate *tempDate;

@end
