//
//  TableViewModel.h
//  linjinsuo
//
//  Created by mac on 2018/11/1.
//  Copyright © 2018年 admin. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef void (^callback) (NSArray *titleArr,NSArray *imageArr);
@interface TableViewModel : NSObject
//tableView头部刷新的网络请求
- (void)headerRefreshRequestWithCallback:(callback)callback;
//tableView底部刷新的网络请求
//- (void)footerRefreshRequestWithCallback:(callback)callback;

@end
