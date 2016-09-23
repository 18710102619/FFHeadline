//
//  FFHeadlineModel.h
//  FFHeadline
//
//  Created by 张玲玉 on 16/9/23.
//  Copyright © 2016年 bj.zly.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FFHeadlineModel : NSObject

@property(nonatomic,copy)NSString *ID;
/// 图片个数
@property(nonatomic,assign)int picNum;
/// 图片URL数组
@property(nonatomic,strong)NSArray *picUrlList;
/// 标题
@property(nonatomic,copy)NSString *title;
/// 详情页URL
@property(nonatomic,copy)NSString *url;
/// 查看量
@property(nonatomic,assign)int seeCount;
/// 点赞量
@property(nonatomic,assign)int hitCount;

+ (id)modelWithDic:(NSDictionary *)dic;

@end
