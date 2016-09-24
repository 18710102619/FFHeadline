//
//  FFHeadlineListViewControllerTableViewController.m
//  FFHeadline
//
//  Created by 张玲玉 on 16/9/23.
//  Copyright © 2016年 bj.zly.com. All rights reserved.
//

#import "FFHeadlineListViewController.h"
#import "FFNetwork.h"
#import "FFHeadlineModel.h"
#import "FFHeadlineNoImageCell.h"
#import "FFHeadlineOneImageCell.h"
#import "FFHeadlineThreeImageCell.h"
#import "FFHeadlineLoadMoreView.h"

@interface FFHeadlineListViewController ()

@property(nonatomic,strong)NSMutableArray *modelArray;
@property(nonatomic,assign)BOOL isLoading;
@property(nonatomic,assign)int page;

@end

@implementation FFHeadlineListViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.tableView.separatorStyle=UITableViewCellSeparatorStyleNone;
    self.modelArray=[NSMutableArray array];
    
    [self requestData];
}

- (void)requestData
{
    self.isLoading=YES;
    NSString *url=[NSString stringWithFormat:@"http://news.58.com/pulldownlist/api/1/6/%i",self.page];
    [FFNetwork get:url params:nil success:^(id responseObject) {
        self.isLoading=NO;
        NSDictionary *dic=responseObject;
        NSArray *data=dic[@"data"];
        if (data.count>0) {
            self.tableView.tableFooterView=[[FFHeadlineLoadMoreView alloc]init];

        }
        for (NSDictionary *item in data) {
            FFHeadlineModel *model = [FFHeadlineModel modelWithDic:item];
            [self.modelArray addObject:model];
            [self.tableView reloadData];
        }
        
    } failure:^(id error) {
        
    }];
}

#pragma - mark UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.modelArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    FFHeadlineModel *model=self.modelArray[indexPath.row];
    if (model.picNum==0) {
        static NSString *identifer=@"FFHeadlineNoImageCell";
        FFHeadlineNoImageCell *cell=[tableView dequeueReusableCellWithIdentifier:identifer];
        if (cell==nil) {
            cell=[[FFHeadlineNoImageCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifer];
        }
        cell.model=model;
        return cell;
    }
    else if (model.picNum==1||model.picNum==2) {
        static NSString *identifer=@"FFHeadlineOneImageCell";
        FFHeadlineOneImageCell *cell=[tableView dequeueReusableCellWithIdentifier:identifer];
        if (cell==nil) {
            cell=[[FFHeadlineOneImageCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifer];
        }
        cell.model=model;
        return cell;
    }
    else {
        static NSString *identifer=@"FFHeadlineThreeImageCell";
        FFHeadlineThreeImageCell *cell=[tableView dequeueReusableCellWithIdentifier:identifer];
        if (cell==nil) {
            cell=[[FFHeadlineThreeImageCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifer];
        }
        cell.model=model;
        return cell;
    }
}

#pragma - mark UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    FFHeadlineBaseCell *cell=(FFHeadlineBaseCell *)[self tableView:tableView cellForRowAtIndexPath:indexPath];
    return cell.cellHeight;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGPoint offset = scrollView.contentOffset;
    CGSize size = scrollView.contentSize;
    double value=size.height-offset.y;
    if (!self.isLoading && value < kMainScreen_Height-20) {
        self.page++;
        [self requestData];
    }
}

@end
