//
//  UITableView+UItableView_TableviewFactory.h
//  TongChengCTMS
//
//  Created by mac on 2018/9/11.
//  Copyright © 2018年 刘帅. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableView (UItableView_TableviewFactory)
+ (UITableView *)tableViewFrame:(CGRect)frame style:(UITableViewStyle)style backgroundColor:(UIColor *)backgroundColor separatorStyle:(UITableViewCellSeparatorStyle)separatorStyle dataSource:(id<UITableViewDataSource>)dataSource delegate:(id<UITableViewDelegate>)delegate;
@end
