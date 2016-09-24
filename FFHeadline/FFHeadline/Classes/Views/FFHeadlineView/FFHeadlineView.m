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

#define kGap 15

@implementation FFHeadlineView

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.title=[[UILabel alloc]init];
        self.title.backgroundColor=[UIColor orangeColor];
        [self addSubview:self.title];
        [self.title mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(@(15));
            make.right.equalTo(@(-15));
            make.top.equalTo(@(7));
            make.height.equalTo(@(15));
        }];
        
        self.subtitle=[[UILabel alloc]init];
        self.subtitle.backgroundColor=[UIColor orangeColor];
        [self addSubview:self.subtitle];
        [self.subtitle mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(@(15));
            make.right.equalTo(@(-15));
            make.bottom.equalTo(@(-7));
            make.height.equalTo(@(15));
        }];
    }
    return self;
}

@end
