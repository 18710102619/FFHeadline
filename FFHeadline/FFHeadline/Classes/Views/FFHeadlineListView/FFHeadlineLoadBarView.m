//
//  FFHeadlineLoadBarView.m
//  FFHeadline
//
//  Created by 张玲玉 on 16/9/27.
//  Copyright © 2016年 bj.zly.com. All rights reserved.
//

#import "FFHeadlineLoadBarView.h"
#import "UIView+WBJobExtension.h"
#import "Masonry.h"

@implementation FFHeadlineLoadBarView

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.backgroundColor=[UIColor orangeColor];
        self.frame=CGRectMake(0, 0, kMainScreen_Width, 25);
        
        UILabel *titleLabel=[[UILabel alloc]init];
        titleLabel.text=@"为您推荐8条内容";
        titleLabel.textColor=[UIColor whiteColor];
        titleLabel.textAlignment=NSTextAlignmentCenter;
        titleLabel.font=[UIFont systemFontOfSize:14];
        [self addSubview:titleLabel];
        [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(150, 20));
            make.center.equalTo(self);
        }];
    }
    return self;
}

@end
