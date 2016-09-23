//
//  FFNetwork.m
//  FFDribbble
//
//  Created by 张玲玉 on 16/8/31.
//  Copyright © 2016年 bj.zly.com. All rights reserved.
//

#import "FFNetwork.h"
#import "AFNetworking.h"

@implementation FFNetwork

+ (void)get:(NSString *)url
     params:(NSDictionary *)params
    success:(void (^)(id responseObject))success
    failure:(void (^)(id error))failure
{
    AFHTTPRequestOperationManager * manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer.acceptableContentTypes=[NSSet setWithObjects:@"application/x-javascript",nil];
    
    [manager GET:url parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        success(responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        failure(error);
    }];
}

@end
