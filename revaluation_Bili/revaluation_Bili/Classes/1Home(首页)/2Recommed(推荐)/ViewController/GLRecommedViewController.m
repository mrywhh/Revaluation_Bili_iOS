//
//  RecommedViewController.m
//  revaluation_Bili
//
//  Created by mac on 16/5/17.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "GLRecommedViewController.h"
#import "GLRecommedViewModel.h"
#import "GLRecommedItemViewModel.h"
#import "GLRecommedCellViewModel.h"


#import "LBRecommedCell.h"

#import "GLDIYHeader.h"

@interface GLRecommedViewController ()

@property (strong, nonatomic) GLRecommedViewModel * viewModel;

@end

@implementation GLRecommedViewController

static NSString * const recommendCellID = @"recommendCell";
static NSString * const liveCellID = @"liveCell";
static NSString * const bangumi_2CellID = @"bangumi_2Cell";
static NSString * const weblinkCellID = @"weblinkCell";
static NSString * const zhoukanCellID = @"zhoukanCell";
static NSString * const regionCellID = @"regionCell";
static NSString * const bangumi_3CellID = @"bangumi_3Cell";

- (GLRecommedViewModel *)viewModel
{
    if (_viewModel == nil) {
        _viewModel = [[GLRecommedViewModel alloc] init];
    }
    return _viewModel;
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    [self viewModel];
    
    [self setupTableView];
    
    [RACObserve(self.viewModel, cellItemViewModels) subscribeNext:^(id x) {
        [self updateView];
    }];
    
}

- (void)setupTableView
{
    // 去掉Cell的间隔线
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    /** 设置头部刷新 */
    self.tableView.mj_header = [GLDIYHeader headerWithRefreshingBlock:^{
        [self.viewModel first];
    }];
}

/**
 * 更新视图.
 */
- (void)updateView
{
    [self.tableView.mj_header endRefreshing];
    
    [self.tableView reloadData];
}

#pragma mark - talbeView数据源方法

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSInteger count = self.viewModel.cellItemViewModels.count;
    return count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    // 传递VM
    // 设置 Cell...

    GLRecommedItemViewModel *vm = self.viewModel.cellItemViewModels[indexPath.row];
    GLRecommedCellViewModel *cellVM = [[GLRecommedCellViewModel alloc]init];
    cellVM.body = vm.body;
    
    if ([vm.type isEqualToString:@"recommend"]) {
        LBRecommedCell *cell = [self.tableView dequeueReusableCellWithIdentifier:recommendCellID];
        cell.viewModel = cellVM;
        return cell;
    } else if([vm.type isEqualToString:@"live"]){
        return [tableView dequeueReusableCellWithIdentifier:liveCellID];
    } else if([vm.type isEqualToString:@"bangumi_2"]) {
        return [tableView dequeueReusableCellWithIdentifier:bangumi_2CellID];
    } else if([vm.type isEqualToString:@"weblink"]) {
        return [tableView dequeueReusableCellWithIdentifier:weblinkCellID];
    } else if(vm.type == nil) {
        return [tableView dequeueReusableCellWithIdentifier:zhoukanCellID];
    } else if([vm.type isEqualToString:@"region"]) {
         return [tableView dequeueReusableCellWithIdentifier:regionCellID];
    } else if([vm.type isEqualToString:@"bangumi_3"]) {
         return [tableView dequeueReusableCellWithIdentifier:bangumi_3CellID];
    }
    
    UITableViewCell *cell = [UITableViewCell new];
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    GLRecommedItemViewModel *vm=self.viewModel.cellItemViewModels[indexPath.row];
//    NSLog(@"tettt%f",vm.cellHeight);
    return [self.viewModel.cellItemViewModels[indexPath.row] cellHeight];

}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 跳转控制器

}

@end
