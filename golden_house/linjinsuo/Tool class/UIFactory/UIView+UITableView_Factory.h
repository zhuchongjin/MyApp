//
//  UIView+UITableView_Factory.h
//  UIFactory
//
//  Created by zhuchongjin on 2018/9/5.
//  Copyright © 2018年 zhuchongjin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (UITableView_Factory)
+ (UITableView *)tableViewFrame:(CGRect)frame style:(UITableViewStyle)style backgroundColor:(UIColor *)backgroundColor separatorStyle:(UITableViewCellSeparatorStyle)separatorStyle dataSource:(id <UITableViewDataSource>)dataSource delegate:(id <UITableViewDelegate>)delegate;

@end
