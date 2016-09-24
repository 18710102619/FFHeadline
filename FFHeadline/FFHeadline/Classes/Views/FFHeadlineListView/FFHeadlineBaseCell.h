//
//  FFHeadlineBaseCell.h
//  FFHeadline
//
//  Created by 张玲玉 on 16/9/24.
//  Copyright © 2016年 bj.zly.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIImageView+WebCache.h"
#import "UIView+WBJobExtension.h"
#import "UIColor+Hex.h"
#import "Masonry.h"
#import "FFHeadlineHighlightView.h"

#define kTop 30
#define kGap 15
#define kBottom 20
#define kLineSpacing 6

@interface FFHeadlineBaseCell : UITableViewCell

@property(nonatomic,strong)UILabel *title;
@property(nonatomic,strong)UIImageView *baodian;
@property(nonatomic,strong)FFHeadlineHighlightView *highlight;

@property(nonatomic,assign)double cellHeight;

- (void)setTitleAttributedText:(NSString *)title;

@end
