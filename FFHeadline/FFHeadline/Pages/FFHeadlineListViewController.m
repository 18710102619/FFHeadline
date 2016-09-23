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

#import "FFNoImageCell.h"
#import "FFOneImageCell.h"
#import "FFThreeImageCell.h"

@interface FFHeadlineListViewController ()

@property(nonatomic,strong)NSMutableArray *modelArray;

@end

@implementation FFHeadlineListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.modelArray=[NSMutableArray array];
    [FFNetwork get:@"http://news.58.com/pulldownlist/api/2/6/1" params:nil success:^(id responseObject) {
        NSDictionary *dic=responseObject;
        NSArray *data=dic[@"data"];
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
        static NSString *identifer=@"FFNoImageCell";
        FFNoImageCell *cell=[tableView dequeueReusableCellWithIdentifier:identifer];
        if (cell==nil) {
            cell=[[FFNoImageCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifer];
        }
        return cell;
    }
    else if (model.picNum==1||model.picNum==2) {
        static NSString *identifer=@"FFOneImageCell";
        FFOneImageCell *cell=[tableView dequeueReusableCellWithIdentifier:identifer];
        if (cell==nil) {
            cell=[[FFOneImageCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifer];
        }
        return cell;
    }
    else {
        static NSString *identifer=@"FFThreeImageCell";
        FFThreeImageCell *cell=[tableView dequeueReusableCellWithIdentifier:identifer];
        if (cell==nil) {
            cell=[[FFThreeImageCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifer];
        }
        return cell;
    }
}

#pragma - mark UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}

@end
