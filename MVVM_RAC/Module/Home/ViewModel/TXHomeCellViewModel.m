//
//  TXHomeCellViewModel.m
//  MVVM_RAC
//
//  Created by chaos on 16/3/31.
//  Copyright © 2016年 chaos. All rights reserved.
//

#import "TXHomeCellViewModel.h"

@implementation TXHomeCellViewModel

- (instancetype)initWithHomeModel:(TXHomeModel *)homeModel {
    
    self = [super init];
    
    if (self) {
        self.homeModel = homeModel;
        [self setupData];
    }
    
    return self;
}

// 处理Model中的数据
// 这里的处理不是很复杂，仅仅作为例子
- (void)setupData {
    
    _titleText = self.homeModel.title;
    _authorText = self.homeModel.authorname;
    _categoyrText = [@"分类:" stringByAppendingString:self.homeModel.categoryname];
}


@end
