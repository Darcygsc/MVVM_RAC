//
//  TXHomeViewModel.h
//  MVVM_RAC
//
//  Created by chaos on 16/3/31.
//  Copyright © 2016年 chaos. All rights reserved.
//

#import "TXBaseViewModel.h"
#import <ReactiveCocoa.h>
#import "TXHomeModel.h"

@interface TXHomeViewModel : TXBaseViewModel

@property (strong, nonatomic) RACSignal *requestSignal; ///< 网络请求信号量

@property (assign, nonatomic) NSInteger currentPage; ///< 当前页码
@property (strong, nonatomic) NSArray *dataSource; ///< tableView的数据源


@end
