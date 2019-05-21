//
//  bViewController.m
//  BDatePicker
//
//  Created by february29 on 05/21/2019.
//  Copyright (c) 2019 february29. All rights reserved.
//

#import "bViewController.h"
#import "BCalendarWeekSymbolsView.h"
#import "BCalendarWeekView.h"
#import "BCalendarMonthView.h"
#import "BCalendarManager.h"
#import "BDateHelper.h"

@interface bViewController ()<BCalendarDelegate>

@end

@implementation bViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //    NSLog(@"今天:%@",[NSDate date]);
    //    NSLog(@"当月有%lu天",(unsigned long)[[NSDate date]BYH_NumberOfDaysInCurrentMonth]);
    //    [[NSDate date]BYH_Weekly];
    //    NSLog(@"当月第一天日期:%@",[[NSDate date]BYH_FirstDayOfCurrentMonth]);
    //    NSLog(@"今天是星期:%d",[[NSDate date]BYH_Weekly]);
    
    
    //    BCalendarWeekSymbolsView *week = [[BCalendarWeekSymbolsView alloc]initWithFrame:CGRectMake(0, 100, self.view.frame.size.width, 20)];
    //    [week setSymbolsStyle:BCalendarWeekSymbolsStyleShort];
    //    [self.view addSubview:week];
    //
    //    BCalendarWeekView *week2 = [[BCalendarWeekView alloc]initWithFrame:CGRectMake(0, 120, self.view.frame.size.width, 20)];
    //    [week2 setStartDay:[NSDate date]];
    //    [self.view addSubview:week2];
    //
    
    //    BCalendarMonthView *monthView = [[BCalendarMonthView alloc]initWithFrame:CGRectMake(0, 100, self.view.frame.size.width, 10)];
    //    monthView.tempDate = [NSDate date];
    //
    //    [self.view addSubview:monthView];
    
    
    
    //    NSLog(@"%@",[NSDate date]);
    //    NSLog(@"%@",[[BDateHelper helper]firstDayOfMonth:[NSDate date]]);
    //    NSDateFormatter *formater = [NSDateFormatter new];
    //    formater.dateFormat = @"yyyy-MM-dd hh:mm:ss";
    //
    //    NSLog(@"%@",[formater stringFromDate:[NSDate date]]);
    
    
    UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(100, 100, 100, 40)];
    [button setBackgroundColor:[UIColor greenColor]];
    [button addTarget:self action:@selector(show) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    
    
}
-(void)show{
    BCalendarManager *manager = [[BCalendarManager alloc]init];
    manager.delegate = self;
    [manager showDatePicker];
}

-(void)manager:(id)manager didSelectedDayView:(id)dayView date:(NSDate *)date{
    NSLog(@"----%@",date);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

@end
