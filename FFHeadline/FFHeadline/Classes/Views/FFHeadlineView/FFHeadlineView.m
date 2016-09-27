//
//  FFHeadlineView.m
//  FFHeadline
//
//  Created by 张玲玉 on 16/9/23.
//  Copyright © 2016年 bj.zly.com. All rights reserved.
//

#import "FFHeadlineView.h"
#import "Masonry.h"
#import "UIView+WBJobExtension.h"
#import "UIColor+Hex.h"

@implementation FFHeadlineView

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.backgroundColor=[UIColor yellowColor];
        
        self.title=[[UILabel alloc]init];
        self.title.font=[UIFont systemFontOfSize:13];
        self.title.textColor=[UIColor colorWithHex:0x999999];
        //self.title.backgroundColor=[UIColor orangeColor];
        [self addSubview:self.title];
        [self.title mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(@(15));
            make.right.equalTo(@(-12));
            make.top.equalTo(@(14));
            make.height.equalTo(@(15));
        }];
        
        self.subtitle=[[UILabel alloc]init];
        self.subtitle.font=[UIFont systemFontOfSize:13];
        self.subtitle.textColor=[UIColor colorWithHex:0x999999];
        //self.subtitle.backgroundColor=[UIColor orangeColor];
        [self addSubview:self.subtitle];
        [self.subtitle mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(@(15));
            make.right.equalTo(@(-12));
            make.bottom.equalTo(@(-14));
            make.height.equalTo(@(15));
        }];
    }
    return self;
}

- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];

    CGContextRef point = UIGraphicsGetCurrentContext();
    [[UIColor whiteColor] set];
    CGContextFillRect(point, rect);
    
    CGContextAddEllipseInRect(point, CGRectMake(0, 20, 6, 6));
    CGContextAddEllipseInRect(point, CGRectMake(0, kFFHeadlineView_Height-25, 6, 6));
    [[UIColor orangeColor] set];
    CGContextFillPath(point);
}

@end
