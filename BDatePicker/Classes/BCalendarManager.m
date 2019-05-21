//
//  BCalenderManager.m
//  BYHDatePicker
//
//  Created by bai on 16/5/12.
//  Copyright © 2016年 bai.xianzhi. All rights reserved.
//

#import "BCalendarManager.h"
#import "BAlertModal.h"
#import "BDateConfig.h"
#import "BCalendarNormalShowView.h"
#import "BCalerdarCollectionShowView.h"

@interface BCalendarManager(){
    BAlertModal *showModle;
    
   // BCalendarNormalShowView *normalView;
}
@end
@implementation BCalendarManager


- (instancetype)init
{
    self = [super init];
    if (self) {
        showModle = [BAlertModal sharedInstance];
        _calendarStyle = BDatePickerStyleNormal;
        
        [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(calendarHasSelectedDay:) name:BcalendarHasSelectDayNotification object:nil];
    }
    return self;
}
-(void)calendarHasSelectedDay:(NSNotification *)notification{
    
    NSDictionary *selectDayDic = [notification userInfo];
    NSLog(@"--calendarHasSelectedDay---%@",selectDayDic);
}


//-(UIView *)normalView{
//    
//    _normalView = [[BCalendarNormalShowView alloc]initWithFrame:CGRectMake(0, 0,BMonthViewW, BMonthViewH)];
//    normalView.manager = self;
//    [normalView setTempDate:[NSDate date]];
//    return normalView;
//}
-(UIView *)bottomView{
    UIView *bottomView = [[UIView alloc]init];
    return bottomView;

}


-(void)showDatePicker{
    [self showDatePicker:BDatePickerStyleNormal];
}
-(void)showDatePicker:(BDatePickerStyle)style{
    
   
    if (style == BDatePickerStyleNormal) {
       
        
        //方案一
        BCalendarNormalShowView *normalView = [[BCalendarNormalShowView alloc]initWithFrame:CGRectMake(0, 0,BMonthViewW, BMonthViewH)];
            normalView.manager = self;
            [normalView setTempDate:[NSDate date]];
        
        [showModle showAlerView:normalView];
        
        
//        //方案二
//        
//        BCalerdarCollectionShowView *collectionShow = [[BCalerdarCollectionShowView alloc]initWithFrame:CGRectMake(0, 0,BMonthViewW, BMonthViewH)];
//        collectionShow.manager = self;
//        [collectionShow setTempDate:[NSDate date]];
//        [showModle showAlerView:collectionShow];
        
        
    }else{
        [showModle showAlerView:[self bottomView]disPlayStyle:BAlertModalViewBottom];
    }

}
-(void)dismiss{
    
}
@end
