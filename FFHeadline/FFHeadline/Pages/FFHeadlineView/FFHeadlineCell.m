//
//  FFHeadlineCell.m
//  FFHeadline
//
//  Created by 张玲玉 on 16/9/19.
//  Copyright © 2016年 bj.zly.com. All rights reserved.
//

#import "FFHeadlineCell.h"
#import "FFHeadlineView.h"
#import "Masonry.h"
#import "UIView+WBJobExtension.h"

#define kGap 15

@interface FFHeadlineCell ()<UIScrollViewDelegate>

@property(nonatomic,strong)UIImageView *icon;
@property(nonatomic,strong)FFHeadlineView *curView;
@property(nonatomic,strong)FFHeadlineView *nextView;
@property(nonatomic,strong)FFHeadlineView *tempView;

@property(nonatomic,strong)NSTimer *timer;
@property(nonatomic,assign)int index;

@end

@implementation FFHeadlineCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.layer.masksToBounds=YES;
        
        _icon=[[UIImageView alloc]init];
        _icon.backgroundColor=[UIColor orangeColor];
        [self addSubview:_icon];
        [_icon mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(35, 35));
            make.left.equalTo(@(kGap));
            make.centerY.equalTo(self);
        }];
        
        double x=kGap+35;
        _curView=[[FFHeadlineView alloc]init];
        _curView.frame=CGRectMake(x, 0, kMainScreen_Width-x, kFFHeadlineCell_Height);
        [self addSubview:_curView];
        _nextView=[[FFHeadlineView alloc]init];
        _nextView.frame=CGRectMake(x, kFFHeadlineCell_Height, kMainScreen_Width-x, kFFHeadlineCell_Height);
        [self addSubview:_nextView];
    }
    return self;
}

- (void)setTitleArray:(NSArray *)titleArray
{
    _titleArray=titleArray;
    
    _index=0;
    _curView.title.text=self.titleArray[_index*2];
    _curView.subtitle.text=self.titleArray[_index*2+1];
    
    [self startTiming];
}

- (void)startTiming
{
    if (_timer==nil) {
        _timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(scrolling) userInfo:nil repeats:YES];
    }
}

- (void)stopTiming
{
    [_timer invalidate];
    _timer = nil;
}

- (void)scrolling
{
    _index++;
    if (_index*2+1>self.titleArray.count) {
        _index=0;
    }
    _nextView.title.text=self.titleArray[_index*2];
    _nextView.subtitle.text=self.titleArray[_index*2+1];
    
    [UIView animateWithDuration:0.5 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        _curView.y=-kFFHeadlineCell_Height;
        _nextView.y=0;
    } completion:^(BOOL finished) {
        _tempView=_curView;
        _curView=_nextView;
        _nextView=_tempView;
        _nextView.y=kFFHeadlineCell_Height;
    }];
}

@end
