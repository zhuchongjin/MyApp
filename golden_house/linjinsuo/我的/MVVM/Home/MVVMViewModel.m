//
//  MVVMViewModel.m
//  002-MVVM
//
//  Created by Cooci on 2018/4/1.
//  Copyright © 2018年 Cooci. All rights reserved.
//

#import "MVVMViewModel.h"
#import <ReactiveObjC.h>

@implementation MVVMViewModel

// 数据 -- 逻辑 vm 
- (instancetype)init{
    if (self==[super init]) {

        // 响应式编程
        [RACObserve(self, contentKey) subscribeNext:^(id  _Nullable x) {
            // 数据变化 model <---> UI
            NSArray *array = @[@"转账",@"信用卡",@"充值中心",@"蚂蚁借呗",@"电影票",@"滴滴出行",@"城市服务",@"蚂蚁森林"];
            NSMutableArray *mArray = [NSMutableArray arrayWithArray:array];
            
            @synchronized (mArray) {
                [mArray removeObject:x];
                if (self.successBlock) {
                    self.successBlock(mArray);
                }
            }
        }];

    }
    return self;
}

- (void)loadData{
    // 异步
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        sleep(1);
        NSArray *array = @[@"转账",@"信用卡",@"充值中心",@"蚂蚁借呗",@"电影票",@"滴滴出行",@"城市服务",@"蚂蚁森林"];
        dispatch_async(dispatch_get_main_queue(), ^{
            if (self.successBlock) {
                self.successBlock(array);
            }
        });
    });
    
}

@end
