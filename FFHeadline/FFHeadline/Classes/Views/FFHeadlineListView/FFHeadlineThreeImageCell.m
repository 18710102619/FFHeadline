//
//  FFHeadlineThreeImageCell.m
//  FFHeadline
//
//  Created by 张玲玉 on 16/9/23.
//  Copyright © 2016年 bj.zly.com. All rights reserved.
//

#import "FFHeadlineThreeImageCell.h"

@interface FFHeadlineThreeImageCell ()

@property(nonatomic,strong)NSMutableArray *iconArray;

@end

@implementation FFHeadlineThreeImageCell

- (NSMutableArray *)iconArray
{
    if (_iconArray==nil) {
        _iconArray=[NSMutableArray array];
        for (int i=0; i<3; i++) {
            UIImageView *icon=[[UIImageView alloc] init];
            [self addSubview:icon];
            [_iconArray addObject:icon];
        }
    }
    return _iconArray;
}

- (void)setModel:(FFHeadlineModel *)model
{
    [super setModel:model];
    
    double gap=5,w=(kMainScreen_Width-2*kFFHeadlineBaseCell_Gap-2*gap)/3.0f;
    double y=self.title.y+self.title.height+kFFHeadlineBaseCell_Gap,h=w*3/4;
 
    for (int i=0; i<3; i++) {
        UIImageView *icon=self.iconArray[i];
        icon.frame=CGRectMake(kFFHeadlineBaseCell_Gap+(w+gap)*i, y, w, h);
        [icon sd_setImageWithURL:model.picUrlList[i] placeholderImage:nil];
    }

    self.cellHeight=kFFHeadlineBaseCell_Bottom+y+h;
}

@end
