//
//  TableViewModel.m
//  linjinsuo
//
//  Created by mac on 2018/11/1.
//  Copyright © 2018年 admin. All rights reserved.
//

#import "TableViewModel.h"

@implementation TableViewModel

- (instancetype)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (void)headerRefreshRequestWithCallback:(callback)callback
{
    
    NSArray *arr =  @[@"\U0000e60f",@"\U0000e684",@"\U0000e61f",@"\U0000e62c",@"\U0000e652",@"\U0000e612",@"\U0000e602",@"\U0000e7a6",@"\U0000e60a",@"\U0000e652",@"\U0000e61f",@"\U0000e6a7",@"\U0000e684",@"\U0000e62c",@"\U0000e68d",@"\U0000e620",@"\U0000e604",@"\U0000e757",@"\U0000e62e",@"\U0000e62e",@"\U0000e600",@"\U0000e60d",@"\U0000e64b",@"\U0000e60f",@"\U0000e624",@"\U0000e605",@"\U0000e657"];
   NSArray * arrTitles = @[@"0 IconFont的用法",@"1 shareView分享",@"2 音声调节",@"3 相机拍照剪裁",@"4 提示框1",@"5 提示框2",@"6 二维码扫描扫描区域可调",@"7 UIview+tap 图片剪裁切割"];
    callback(arr,arrTitles);
}


@end
