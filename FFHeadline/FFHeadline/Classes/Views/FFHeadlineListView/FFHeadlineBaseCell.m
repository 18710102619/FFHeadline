//
//  FFHeadlineBaseCell.m
//  FFHeadline
//
//  Created by 张玲玉 on 16/9/24.
//  Copyright © 2016年 bj.zly.com. All rights reserved.
//

#import "FFHeadlineBaseCell.h"
#import "FFHeadlineHighlightView.h"

#define kLineSpacing 6

@implementation FFHeadlineBaseCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor=[UIColor whiteColor];
        
        _title=[[UILabel alloc]initWithFrame:CGRectMake(kFFHeadlineBaseCell_Gap, kFFHeadlineBaseCell_Top, kMainScreen_Width-2*kFFHeadlineBaseCell_Gap, 100)];
        _title.font=[UIFont systemFontOfSize:18];
        _title.numberOfLines=0;
        [self addSubview:_title];
        
        _baodian=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"headline_baodian"]];
        [self addSubview:_baodian];
        [_baodian mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(26, 15));
            make.left.equalTo(@(kFFHeadlineBaseCell_Gap));
            make.bottom.equalTo(@(-20));
        }];
        
        _highlight=[[FFHeadlineHighlightView alloc]init];
        [self addSubview:_highlight];
        [_highlight mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(_baodian.mas_right).with.offset(20);
            make.height.equalTo(@(15));
            make.right.equalTo(@(-kFFHeadlineBaseCell_Gap));
            make.bottom.equalTo(@(-20));
        }];
        
        double h=0.7;
        UIView *line=[[UIView alloc]init];
        line.backgroundColor=[UIColor colorWithHex:0xe8e8e8];
        [self addSubview:line];
        [line mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(@(kFFHeadlineBaseCell_Gap));
            make.right.equalTo(@(-kFFHeadlineBaseCell_Gap));
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

    NSDictionary *dic=@{NSFontAttributeName:_title.font,NSParagraphStyleAttributeName:style};
    CGSize size=[title boundingRectWithSize:CGSizeMake(_title.width, 10000) options:NSStringDrawingUsesLineFragmentOrigin attributes:dic context:nil].size;
    
    _title.attributedText=str;
    _title.height=size.height;
    
    double h=self.title.height;
    if(h<28) {
        self.title.height=h-kLineSpacing;
    }
}

- (void)setModel:(FFHeadlineModel *)model
{
    _model=model;
    
    self.highlight.model=model;
    [self setTitleAttributedText:model.title];
    
    self.cellHeight=self.title.x+self.title.height+7+kFFHeadlineBaseCell_Bottom;
}

@end
