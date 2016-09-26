//
//  FFRootViewController.m
//  FFHeadline
//
//  Created by 张玲玉 on 16/9/23.
//  Copyright © 2016年 bj.zly.com. All rights reserved.
//

#import "FFRootViewController.h"
#import "FFHeadlineCell.h"
#import "FFHeadlineListController.h"

@interface FFRootViewController ()

@property(nonatomic,strong)NSArray *titleArray;

@end

@implementation FFRootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
    self.titleArray=@[@"1",@"2",
                      @"3",@"4",
                      @"5",@"6",
                      @"7",@"8",
                      @"9",@"10",
                      @"11",@"12",
                      @"13",@"14",
                      @"15",@"16",
                      @"17",@"18",
                      @"19",@"20"];
}

#pragma - mark UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifer=@"cell";
    FFHeadlineCell *cell=[tableView dequeueReusableCellWithIdentifier:identifer];
    if (cell==nil) {
        cell=[[FFHeadlineCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifer];
    }
    cell.titleArray=self.titleArray;
    return cell;
}

#pragma - mark UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return kFFHeadlineCell_Height;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    FFHeadlineListController *vc=[[FFHeadlineListController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}

@end
