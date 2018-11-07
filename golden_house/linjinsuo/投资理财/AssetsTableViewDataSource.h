//
//  AssetsTableViewDataSource.h
//  linjinsuo
//
//  Created by mac on 2018/11/1.
//  Copyright © 2018年 admin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface AssetsTableViewDataSource : NSObject<UITableViewDataSource>
@property (nonatomic,copy)NSArray *titles;
@property (nonatomic,copy)NSArray *images;
@end
