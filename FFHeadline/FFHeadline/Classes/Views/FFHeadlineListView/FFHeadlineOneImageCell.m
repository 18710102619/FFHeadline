//
//  FFHeadlineOneImageCell.m
//  FFHeadline
//
//  Created by 张玲玉 on 16/9/23.
//  Copyright © 2016年 bj.zly.com. All rights reserved.
//

#import "FFHeadlineOneImageCell.h"

@implementation FFHeadlineOneImageCell

- (void)setModel:(FFHeadlineModel *)model
{
    [super setModel:model];
    
    self.cellHeight=120;
    double h=120-kFFHeadlineBaseCell_Top*2,w=h*4/3;
    
    UIImageView *icon=[[UIImageView alloc] init];
    icon.backgroundColor=[UIColor orangeColor];
    icon.frame=CGRectMake(kFFHeadlineBaseCell_Gap, kFFHeadlineBaseCell_Top, w, h);
    [icon sd_setImageWithURL:model.picUrlList[0] placeholderImage:nil];
    [self addSubview:icon];
    
    double x=icon.x+icon.width+kFFHeadlineBaseCell_Gap;
    self.title.x=x;
    self.title.width=kMainScreen_Width-x-kFFHeadlineBaseCell_Gap;
    self.title.numberOfLines=2;
    [self setTitleAttributedText:model.title];
    
    [self.baodian mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@(x));
    }];
}

@end
