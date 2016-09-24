//
//  FFBaseImageCell.h
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

#define kTop 30
#define kGap 15
#define kLineSpacing 6

@interface FFBaseImageCell : UITableViewCell

@property(nonatomic,strong)UILabel *title;

- (void)setTitleAttributedText:(NSString *)title;

@end
