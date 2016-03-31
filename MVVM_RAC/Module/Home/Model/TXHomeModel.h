//
//  TXHomeModel.h
//  MVVM_RAC
//
//  Created by chaos on 16/3/31.
//  Copyright © 2016年 chaos. All rights reserved.
//

#import "TXBaseModel.h"

@interface TXHomeModel : TXBaseModel

@property (copy, nonatomic) NSString *articleId;
@property (copy, nonatomic) NSString *title;
@property (copy, nonatomic) NSString *authorname;
@property (copy, nonatomic) NSString *categoryname;


@end
