//
//  FFHeadlineInfoView.m
//  FFHeadline
//
//  Created by 张玲玉 on 16/9/24.
//  Copyright © 2016年 bj.zly.com. All rights reserved.
//

#import "FFHeadlineHighlightView.h"
#import "Masonry.h"
#import "UIColor+Hex.h"

#define kFont 13

@interface FFHeadlineHighlightView ()

@property(nonatomic,strong)UILabel *zanCount;
@property(nonatomic,strong)UILabel *seeCount;

@end

@implementation FFHeadlineHighlightView

- (instancetype)init
{
    self = [super init];
    if (self) {
        //self.backgroundColor=[UIColor yellowColor];
        
        _zanCount=[[UILabel alloc]init];
        //_zanCount.backgroundColor=[UIColor magentaColor];
        _zanCount.font=[UIFont systemFontOfSize:kFont];
        _zanCount.textColor=[UIColor colorWithHex:0x717171];
        _zanCount.textAlignment=NSTextAlignmentCenter;
        [self addSubview:_zanCount];
        [_zanCount mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(@(0));
            make.size.mas_equalTo(CGSizeMake(15, 15));
            make.centerY.equalTo(self);
        }];
        
        UIImageView *zan=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"headline_dianzan"]];
        //zan.backgroundColor=[UIColor magentaColor];
        [self addSubview:zan];
        [zan mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(_zanCount.mas_left).with.offset(-3);
            make.size.mas_equalTo(CGSizeMake(15, 15));
            make.centerY.equalTo(self);
        }];
        
        _seeCount=[[UILabel alloc]init];
        //_seeCount.backgroundColor=[UIColor magentaColor];
        _seeCount.font=[UIFont systemFontOfSize:kFont];
        _seeCount.textColor=[UIColor colorWithHex:0x717171];
        _seeCount.textAlignment=NSTextAlignmentCenter;
        [self addSubview:_seeCount];
        [_seeCount mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(zan.mas_left).with.offset(-15);
            make.size.mas_equalTo(CGSizeMake(15, 15));
            make.centerY.equalTo(self);
        }];
        
        UIImageView *see=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"headline_chakan"]];
        //see.backgroundColor=[UIColor magentaColor];
        [self addSubview:see];
        [see mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(_seeCount.mas_left).with.offset(-3);
            make.size.mas_equalTo(CGSizeMake(15, 15));
            make.centerY.equalTo(self);
        }];
    }
    return self;
}

- (void)setModel:(FFHeadlineModel *)model
{
    _model=model;
    
    _zanCount.text=[NSString stringWithFormat:@"%i",_model.zanCount];
    _seeCount.text=[NSString stringWithFormat:@"%i",_model.seeCount];
    
    CGSize zanSize=[_zanCount.text boundingRectWithSize:CGSizeMake(10000, 15) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:_zanCount.font} context:nil].size;
    [_zanCount mas_updateConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@(zanSize.width+2));
    }];
    
    CGSize seeSize=[_seeCount.text boundingRectWithSize:CGSizeMake(10000, 15) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:_zanCount.font} context:nil].size;
    [_seeCount mas_updateConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@(seeSize.width+3));
    }];
}

@end
