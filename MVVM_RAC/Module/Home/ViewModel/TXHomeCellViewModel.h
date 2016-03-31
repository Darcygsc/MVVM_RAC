//
//  TXHomeCellViewModel.h
//  MVVM_RAC
//
//  Created by chaos on 16/3/31.
//  Copyright © 2016年 chaos. All rights reserved.
//

#import "TXBaseViewModel.h"
#import "TXHomeModel.h"

@interface TXHomeCellViewModel : TXBaseViewModel

@property (strong, nonatomic) TXHomeModel *homeModel;

@property (copy, nonatomic, readonly) NSString *titleText;
@property (copy, nonatomic, readonly) NSString *authorText;
@property (copy, nonatomic, readonly) NSString *categoyrText;

- (instancetype)initWithHomeModel:(TXHomeModel *)homeModel;


@end
