//
//  TXBaseViewModel.m
//  MVVM_RAC
//
//  Created by chaos on 16/3/31.
//  Copyright © 2016年 chaos. All rights reserved.
//

#import "TXBaseViewModel.h"

@implementation TXBaseViewModel

// 懒加载
- (AFHTTPSessionManager *)sessionManager
{
    if (!_sessionManager) {
        _sessionManager = [AFHTTPSessionManager manager];
    }
    return _sessionManager;
}

// 在对象销毁时，别忘了取消已经在队列中的请求
- (void)dealloc
{
    [self.sessionManager invalidateSessionCancelingTasks:YES];
}


@end
