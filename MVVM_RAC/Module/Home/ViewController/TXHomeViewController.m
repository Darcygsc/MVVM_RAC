//
//  TXHomeViewController.m
//  MVVM_RAC
//
//  Created by chaos on 16/3/31.
//  Copyright © 2016年 chaos. All rights reserved.
//

#import "TXHomeViewController.h"
#import "TXHomeViewModel.h"
#import "TXHomeCell.h"

@interface TXHomeViewController () <UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (strong, nonatomic) TXHomeViewModel *viewModel;

@end

@implementation TXHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self sendRequest];
}

// 发起请求
- (void)sendRequest {
    
    @weakify(self);
    [self.viewModel.requestSignal subscribeNext:^(NSArray *articles) {
        
        @strongify(self);
        // 请求完成后，刷新表格
        [self.tableView reloadData];
    } error:^(NSError *error) {
        
        // 如果请求失败，则根据error做出相应提示
    }];
}

#pragma mark - UITableViewDataSource

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TXHomeCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    cell.viewModel = self.viewModel.dataSource[indexPath.row];
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return self.viewModel.dataSource.count;
}

#pragma mark - Lazy Load

- (TXHomeViewModel *)viewModel {
    
    if (!_viewModel) {
        _viewModel = [TXHomeViewModel new];
    }
    return _viewModel;
}

@end
