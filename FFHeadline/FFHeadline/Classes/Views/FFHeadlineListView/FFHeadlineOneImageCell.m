//
//  FFHeadlineOneImageCell.m
//  FFHeadline
//
//  Created by 张玲玉 on 16/9/23.
//  Copyright © 2016年 bj.zly.com. All rights reserved.
//

#import "FFHeadlineOneImageCell.h"

#define kHeight 120

@interface FFHeadlineOneImageCell ()

@property(nonatomic,strong)UIImageView *icon;

@end

@implementation FFHeadlineOneImageCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        double x=self.icon.x+_icon.width+kFFHeadlineBaseCell_Gap;
        self.title.x=x;
        self.title.width=kMainScreen_Width-x-kFFHeadlineBaseCell_Gap;
        self.title.numberOfLines=2;
        [self.baodian mas_updateConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(@(x));
        }];
    }
    return self;
}

- (UIImageView *)icon
{
    if (_icon==nil) {
        double h=kHeight-kFFHeadlineBaseCell_Top*2,w=h*4/3;
        _icon=[[UIImageView alloc] init];
        _icon.backgroundColor=[UIColor orangeColor];
        _icon.frame=CGRectMake(kFFHeadlineBaseCell_Gap, kFFHeadlineBaseCell_Top, w, h);
        [self addSubview:_icon];
    }
    return _icon;
}

- (void)setModel:(FFHeadlineModel *)model
{
    [super setModel:model];
    
    self.cellHeight=kHeight;
    [self.icon sd_setImageWithURL:model.picUrlList[0] placeholderImage:nil];
    [self setTitleAttributedText:model.title];
}

@end
