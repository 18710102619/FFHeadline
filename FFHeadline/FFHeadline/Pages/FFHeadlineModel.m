//
//  FFHeadlineModel.m
//  FFHeadline
//
//  Created by 张玲玉 on 16/9/23.
//  Copyright © 2016年 bj.zly.com. All rights reserved.
//

#import "FFHeadlineModel.h"

@implementation FFHeadlineModel

+ (id)modelWithDic:(NSDictionary *)dict
{
    return [[self alloc] initWithDic:dict];
}

- (id)initWithDic:(NSDictionary *)dict
{
    self = [super init];
    if (self) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

/**
 * 防止没有dict中key对应的属性导致的崩溃
 */
- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    if ([key isEqualToString:@"id"]) {
        self.ID = value;
    }
}

@end
