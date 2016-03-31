//
//  TXHomeViewModel.m
//  MVVM_RAC
//
//  Created by chaos on 16/3/31.
//  Copyright © 2016年 chaos. All rights reserved.
//

#import "TXHomeViewModel.h"
#import <MJExtension.h>
#import "TXHomeCellViewModel.h"

@interface TXHomeViewModel ()

@property (strong, nonatomic) NSMutableArray *homeViewModels; ///< 这个属性主要存储的是文章的vm，上拉加载的时候追加，下拉刷新的时候清空。防止直接修改dataSource
@property (assign, nonatomic) BOOL isRefresh; ///< 是否是刷新(用于处理数据缓存与dataSource)


@end

@implementation TXHomeViewModel



#pragma mark - Request
// 采用懒加载的方式来配置网络请求
- (RACSignal *)requestSignal {
    
    if (!_requestSignal) {
        
        @weakify(self);
        _requestSignal = [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
            
            @strongify(self);
            
            // 配置网络请求参数
            NSDictionary *parameters = @{@"page": @(self.currentPage)};
            
            // 发起请求
            NSURLSessionDataTask *task = [self.sessionManager POST:@"http://www.brighttj.com/api/index.php/api/article/articleList" parameters:parameters success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
                
                // 将请求下来的字典->模型
                NSArray *articleArray = responseObject[@"data"][@"articleList"];
                for (NSDictionary *articleDictionary in articleArray) {
                    TXHomeModel *homeModel = [TXHomeModel objectWithKeyValues:articleDictionary];
                    homeModel.authorname = @"chaos";
                    homeModel.categoryname = @"iOS";
                    
                    // 根据模型，初始化cell的vm
                    TXHomeCellViewModel *cellViewModel = [[TXHomeCellViewModel alloc] initWithHomeModel:homeModel];
                    // 将cell的vm存入数组
                    [self.homeViewModels addObject:cellViewModel];
                }
                // 完成数据处理后，赋值给dataSource
                self.dataSource = [self.homeViewModels copy];
                
                [subscriber sendNext:self.dataSource];
                [subscriber sendCompleted];
            } failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
                
                [subscriber sendError:error];
            }];
            
            // 在信号量作废时，取消网络氢气
            return [RACDisposable disposableWithBlock:^{
                
                [task cancel];
            }];
        }];
    }
    return _requestSignal;
}

- (BOOL)isRefresh {
    
    _isRefresh = self.currentPage == 0;
    
    return _isRefresh;
}

#pragma mark - Getter / Setter
- (NSMutableArray *)homeViewModels
{
    if (!_homeViewModels) {
        _homeViewModels = [NSMutableArray array];
    }
    return _homeViewModels;
}

@end
