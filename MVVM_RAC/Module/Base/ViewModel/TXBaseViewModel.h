//
//  TXBaseViewModel.h
//  MVVM_RAC
//
//  Created by chaos on 16/3/31.
//  Copyright © 2016年 chaos. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking.h>

@interface TXBaseViewModel : NSObject

@property (strong, nonatomic ) AFHTTPSessionManager *sessionManager;

@end
