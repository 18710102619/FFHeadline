//
//  FFHeadlineLoadMoreView.m
//  FFHeadline
//
//  Created by 张玲玉 on 16/9/24.
//  Copyright © 2016年 bj.zly.com. All rights reserved.
//

#import "FFHeadlineLoadMoreView.h"
#import "UIView+WBJobExtension.h"
#import "Masonry.h"

@implementation FFHeadlineLoadMoreView

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.backgroundColor=[UIColor whiteColor];
        self.frame=CGRectMake(0, 0, kMainScreen_Width, 50);
        
        UILabel *titleLabel=[[UILabel alloc]init];
        //titleLabel.backgroundColor=[UIColor magentaColor];
        titleLabel.font=[UIFont systemFontOfSize:14];
        titleLabel.textColor=[UIColor grayColor];
        titleLabel.text=@"正在加载...";
        [self addSubview:titleLabel];
        [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(70, 30));
            make.centerX.equalTo(@(20));
            make.centerY.equalTo(self);
        }];
        
        UIActivityIndicatorView *loadingView=[[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
        //loadingView.backgroundColor=[UIColor magentaColor];
        [loadingView startAnimating];
        [self addSubview:loadingView];
        [loadingView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(30, 30));
            make.right.equalTo(titleLabel.mas_left).with.offset(-10);
            make.centerY.equalTo(self);
        }];
    }
    return self;
}


@end
