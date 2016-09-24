//
//  FFThreeImageCell.m
//  FFHeadline
//
//  Created by 张玲玉 on 16/9/23.
//  Copyright © 2016年 bj.zly.com. All rights reserved.
//

#import "FFThreeImageCell.h"

@implementation FFThreeImageCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
       
    }
    return self;
}

- (void)setModel:(FFHeadlineModel *)model
{
    _model=model;
    
    [self setTitleAttributedText:model.title];
    
    double gap=5,w=(kMainScreen_Width-2*kGap-2*gap)/3.0f,y=self.title.y+self.title.height+kGap;
 
    for (int i=0; i<3; i++) {
        UIImageView *icon=[[UIImageView alloc] init];
        icon.backgroundColor=[UIColor orangeColor];
        icon.frame=CGRectMake(kGap+(w+gap)*i, y, w, w*3/4);
        [icon sd_setImageWithURL:model.picUrlList[i] placeholderImage:nil];
        [self addSubview:icon];
    }
}

@end
