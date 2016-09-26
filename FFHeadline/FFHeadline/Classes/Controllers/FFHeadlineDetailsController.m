//
//  FFHeadlineDetailsController.m
//  FFHeadline
//
//  Created by 张玲玉 on 16/9/24.
//  Copyright © 2016年 bj.zly.com. All rights reserved.
//

#import "FFHeadlineDetailsController.h"
#import "UIView+WBJobExtension.h"

@interface FFHeadlineDetailsController ()<UIWebViewDelegate>

@property(nonatomic,strong)FFHeadlineModel *model;
@property(nonatomic,strong)UIWebView *webView;

@end

@implementation FFHeadlineDetailsController

- (instancetype)initWithModel:(FFHeadlineModel *)model
{
    self = [super init];
    if (self) {
        self.model=model;
        
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    _webView=[[UIWebView alloc]init];
    _webView.frame=self.view.frame;
    _webView.delegate=self;
    [self.view addSubview:_webView];
    
    NSURL *url=[NSURL URLWithString:self.model.url];
    NSURLRequest *request=[[NSURLRequest alloc]initWithURL:url];
    [_webView loadRequest:request];
}

- (void)webViewDidStartLoad:(UIWebView *)webView
{
    
}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    
}

@end
