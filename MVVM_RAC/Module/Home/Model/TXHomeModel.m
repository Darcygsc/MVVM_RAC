//
//  TXHomeModel.m
//  MVVM_RAC
//
//  Created by chaos on 16/3/31.
//  Copyright © 2016年 chaos. All rights reserved.
//

#import "TXHomeModel.h"

@implementation TXHomeModel

// MJExtension中替换属性名称的方法
+ (NSDictionary *)replacedKeyFromPropertyName {
    
    return @{@"articleId" : @"id"};
}

@end
