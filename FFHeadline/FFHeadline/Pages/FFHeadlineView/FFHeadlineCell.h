//
//  FFHeadlineCell.h
//  FFHeadline
//
//  Created by 张玲玉 on 16/9/19.
//  Copyright © 2016年 bj.zly.com. All rights reserved.
//

#import <UIKit/UIKit.h>

#define kFFHeadlineCell_Height 50
#define kMainScreen_Width [[UIScreen mainScreen] bounds].size.width

@interface FFHeadlineCell : UITableViewCell

@property(nonatomic,strong)NSArray *titleArray;

@end
