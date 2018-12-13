//
//  MVVMViewModel.h
//  002-MVVM
//
//  Created by Cooci on 2018/4/1.
//  Copyright © 2018年 Cooci. All rights reserved.
//

#import "BaseViewModel.h"

@interface MVVMViewModel : BaseViewModel
@property (nonatomic, copy) NSString *contentKey;

- (void)loadData;

@end
