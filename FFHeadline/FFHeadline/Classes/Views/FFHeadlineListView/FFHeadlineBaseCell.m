//
//  FFHeadlineBaseCell.m
//  FFHeadline
//
//  Created by 张玲玉 on 16/9/24.
//  Copyright © 2016年 bj.zly.com. All rights reserved.
//

#import "FFHeadlineBaseCell.h"
#import "FFHeadlineHighlightView.h"

@implementation FFHeadlineBaseCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor=[UIColor whiteColor];
        self.cellHeight=100;
        
        _title=[[UILabel alloc]initWithFrame:CGRectMake(kGap, kTop, kMainScreen_Width-2*kGap, 20)];
        _title.font=[UIFont systemFontOfSize:18];
        _title.textColor=[UIColor colorWithHex:0x999999];
        _title.numberOfLines=0;
        [self addSubview:_title];
        
        _baodian=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"headline_baodian"]];
        [self addSubview:_baodian];
        [_baodian mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(26, 15));
            make.left.equalTo(@(kGap));
            make.bottom.equalTo(@(-kBottom));
        }];
        
        _highlight=[[FFHeadlineHighlightView alloc]init];
        [self addSubview:_highlight];
        [_highlight mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(_baodian.mas_right).with.offset(20);
            make.height.equalTo(@(15));
            make.right.equalTo(@(-kGap));
            make.bottom.equalTo(@(-kBottom));
            
        }];
        
        double h=0.7;
        UIView *line=[[UIView alloc]init];
        line.backgroundColor=[UIColor colorWithHex:0xe8e8e8];
        [self addSubview:line];
        [line mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(@(kGap));
            make.right.equalTo(@(-kGap));
            make.bottom.equalTo(@(-h));
            make.height.equalTo(@(h));
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