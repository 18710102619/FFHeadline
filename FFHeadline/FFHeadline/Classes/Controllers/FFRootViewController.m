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
    self.titleArray=@[@"1 三星Galaxy Note7:您到底是手雷还是",@"2 中国最火城市今起限购 还有些城市",
                      @"3 三星Galaxy Note7:您到底是手雷还是",@"4 中国最火城市今起限购 还有些城市",
                      @"5 三星Galaxy Note7:您到底是手雷还是",@"6 中国最火城市今起限购 还有些城市",
                      @"7 三星Galaxy Note7:您到底是手雷还是",@"8 中国最火城市今起限购 还有些城市",
                      @"9 三星Galaxy Note7:您到底是手雷还是",@"10 中国最火城市今起限购 还有些城市",
                      @"11 三星Galaxy Note7:您到底是手雷还是",@"12 中国最火城市今起限购 还有些城市",
                      @"13 三星Galaxy Note7:您到底是手雷还是",@"14 中国最火城市今起限购 还有些城市",
                      @"15 三星Galaxy Note7:您到底是手雷还是",@"16 中国最火城市今起限购 还有些城市",
                      @"17 三星Galaxy Note7:您到底是手雷还是",@"18 中国最火城市今起限购 还有些城市",
                      @"19 三星Galaxy Note7:您到底是手雷还是",@"20 中国最火城市今起限购 还有些城市"];
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
