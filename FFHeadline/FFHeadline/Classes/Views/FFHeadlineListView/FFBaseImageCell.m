//
//  FFBaseImageCell.m
//  FFHeadline
//
//  Created by 张玲玉 on 16/9/24.
//  Copyright © 2016年 bj.zly.com. All rights reserved.
//

#import "FFBaseImageCell.h"

@implementation FFBaseImageCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor=[UIColor whiteColor];
        
        _title=[[UILabel alloc]initWithFrame:CGRectMake(kGap, kTop, kMainScreen_Width-2*kGap, 20)];
        //_title.backgroundColor=[UIColor magentaColor];
        _title.font=[UIFont systemFontOfSize:18];
        _title.textColor=[UIColor colorWithHex:0x999999];
        _title.numberOfLines=0;
        [self addSubview:_title];
        
        UIView *line=[[UIView alloc]init];
        line.backgroundColor=[UIColor colorWithHex:0xe8e8e8];
        [self addSubview:line];
        [line mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(@(kGap));
            make.right.equalTo(@(-kGap));
            make.bottom.equalTo(@(-1));
            make.height.equalTo(@(1));
        }];
    }
    return self;
}

- (void)setTitleAttributedText:(NSString *)title
{
    NSMutableAttributedString *str=[[NSMutableAttributedString alloc] initWithString:title];
    NSMutableParagraphStyle *style=[[NSMutableParagraphStyle alloc] init];
    [style setLineSpacing:kLineSpacing];
    [str addAttribute:NSParagraphStyleAttributeName value:style range:NSMakeRange(0, [title length])];
    
    _title.attributedText = str;
    [_title sizeToFit];
    
    double h=self.title.height;
    if(h<28) {
        self.title.height=h-kLineSpacing;
    }
}

@end
