//
//  FFHeadlineThreeImageCell.m
//  FFHeadline
//
//  Created by 张玲玉 on 16/9/23.
//  Copyright © 2016年 bj.zly.com. All rights reserved.
//

#import "FFHeadlineThreeImageCell.h"

@implementation FFHeadlineThreeImageCell

- (void)setModel:(FFHeadlineModel *)model
{
    [super setModel:model];
    
    double gap=5,w=(kMainScreen_Width-2*kFFHeadlineBaseCell_Gap-2*gap)/3.0f;
    double y=self.title.y+self.title.height+kFFHeadlineBaseCell_Gap,h=w*3/4;
 
    for (int i=0; i<3; i++) {
        UIImageView *icon=[[UIImageView alloc] init];
        icon.backgroundColor=[UIColor orangeColor];
        icon.frame=CGRectMake(kFFHeadlineBaseCell_Gap+(w+gap)*i, y, w, h);
        [icon sd_setImageWithURL:model.picUrlList[i] placeholderImage:nil];
        [self addSubview:icon];
    }

    self.cellHeight=kFFHeadlineBaseCell_Bottom+y+h;
}

@end
