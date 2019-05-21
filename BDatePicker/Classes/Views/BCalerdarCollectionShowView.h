//
//  BCalerdarCollectionShowView.h
//  BYHDatePicker
//
//  Created by bai on 16/5/18.
//  Copyright © 2016年 bai.xianzhi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BCalendarManager.h"
@interface BCalerdarCollectionShowView : UIView
@property(nonatomic,retain,readwrite) BCalendarManager *manager;
@property(nonatomic,retain,readwrite)NSDate *tempDate;

@end
