//
//  TXHomeCell.m
//  MVVM_RAC
//
//  Created by chaos on 16/3/31.
//  Copyright © 2016年 chaos. All rights reserved.
//

#import "TXHomeCell.h"
#import <ReactiveCocoa.h>


@implementation TXHomeCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    [self setupSignal];
}

// 设置信号量，当cell的vm被重新赋值时，更新cell显示的数据
- (void)setupSignal {
    
    @weakify(self);
    [RACObserve(self, viewModel) subscribeNext:^(TXHomeCellViewModel *viewModel) {
        
        // 使用strong修饰self，防止在self在使用中被释放
        @strongify(self);
        
        // vm已经将要显示的文本处理好了，在cell中直接赋值就行
        self.textLabel.text = viewModel.titleText;
        self.detailTextLabel.text = viewModel.authorText;
    }];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
