//
//  FFHeadlineLoadNewView.m
//  FFHeadline
//
//  Created by 张玲玉 on 16/9/27.
//  Copyright © 2016年 bj.zly.com. All rights reserved.
//

#import "FFHeadlineLoadNewView.h"
#import "UIView+WBJobExtension.h"
#import "Masonry.h"

@implementation FFHeadlineLoadNewView

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.backgroundColor=[UIColor whiteColor];
        self.frame=CGRectMake(0, 0, kMainScreen_Width, 70);
        
        UIWebView *webView = [[UIWebView alloc] init];
        webView.userInteractionEnabled = NO;
        [self addSubview:webView];
        [webView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(58, 62));
            make.bottom.equalTo(@(0));
            make.centerX.equalTo(self);
        }];
        
        [webView loadData:[NSData dataWithContentsOfFile: [[NSBundle mainBundle] pathForResource:@"headline_dropload1" ofType:@"gif"]] MIMEType:@"image/gif" textEncodingName:nil baseURL:nil];
    }
    return self;
}

@end
