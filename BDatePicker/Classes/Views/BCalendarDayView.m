//
//  BCalendarDayView.m
//  BYHDatePicker
//
//  Created by bai on 16/5/13.
//  Copyright © 2016年 bai.xianzhi. All rights reserved.
//


#import "BCalendarDayView.h"
#import "BDateHelper.h"

@interface BCalendarDayView(){
    NSDateFormatter *formatter;
}
@end
@implementation BCalendarDayView
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

-(void)setUp{
    self.clipsToBounds = YES;
    
    
    {
        _circleView = [UIView new];
        [self addSubview:_circleView];
        
        _circleView.backgroundColor = BDayCirlcleColor;
        _circleView.hidden = YES;
        
        _circleView.layer.rasterizationScale = [UIScreen mainScreen].scale;
        _circleView.layer.shouldRasterize = YES;
        
    }


    {
        _textLabel = [UILabel new];
        [self addSubview:_textLabel];
        
        _textLabel.textColor = BDayTextColor;
        _textLabel.textAlignment = NSTextAlignmentCenter;
        _textLabel.font = BDayTextFont;
    }
    
    {
        UITapGestureRecognizer *gesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didTouch)];
        
        self.userInteractionEnabled = YES;
        [self addGestureRecognizer:gesture];
    }

    
}

-(void)layoutSubviews{
    _textLabel.frame = self.bounds;
   
    CGFloat sizeCircle = MIN(self.frame.size.width, self.frame.size.height);
    _circleView.frame = CGRectMake(0, 0, sizeCircle, sizeCircle);
    _circleView.center = CGPointMake(self.bounds.size.width/2,self.bounds.size.height/2) ;
    _circleView.layer.cornerRadius = sizeCircle/2;
    
}

- (void)didTouch
{
    
    [[NSNotificationCenter defaultCenter]postNotificationName:BcalendarHasSelectDayNotification object:nil userInfo:@{@"dayView":self,@"date":self.date}];
    
    if (self.manager&&[self.manager.delegate respondsToSelector:@selector(manager: didSelectedDayView: date:)]) {
        [self.manager.delegate manager:self.manager didSelectedDayView:self date:self.date];
    }
   
    _circleView.hidden = NO;
    _circleView.transform = CGAffineTransformScale(CGAffineTransformIdentity, 0.1, 0.1);
    [UIView transitionWithView:_circleView
                      duration:.3
                       options:0
                    animations:^{
                        _circleView.transform = CGAffineTransformIdentity;
                    } completion:nil];
   
    
}

-(void)setDate:(NSDate *)date{
    _date = date;
    if ([[BDateHelper helper] date:date isTheSameDayThan:[NSDate date]]) {
        _circleView.hidden = NO;
        _circleView.backgroundColor = [UIColor redColor];
    }
   _textLabel.text =  [[BDateHelper helper].dayFormatter stringFromDate:_date];
}


-(void)setIsFromAnotherMonth:(BOOL)isFromAnotherMonth{
    _isFromAnotherMonth = isFromAnotherMonth;
    _textLabel.textColor = BDayAnotherMonthTextColor;
}
@end
