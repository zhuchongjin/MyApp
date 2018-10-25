//
//  UIView+UITableView_Factory.m
//  UIFactory
//
//  Created by zhuchongjin on 2018/9/5.
//  Copyright © 2018年 zhuchongjin. All rights reserved.
//

#import "UIView+UITableView_Factory.h"

@implementation UIView (UITableView_Factory)
+ (UITableView *)tableViewFrame:(CGRect)frame style:(UITableViewStyle)style backgroundColor:(UIColor *)backgroundColor separatorStyle:(UITableViewCellSeparatorStyle)separatorStyle dataSource:(id<UITableViewDataSource>)dataSource delegate:(id<UITableViewDelegate>)delegate{
    UITableView *view = [[UITableView alloc] initWithFrame:frame style:style];

    if (backgroundColor) {
        view.backgroundColor = backgroundColor;
    }

    view.separatorStyle = separatorStyle;

    if (dataSource) {
        view.dataSource = dataSource;
    }

    if (delegate) {
        view.delegate = delegate;
    }

    return view;
}
@end
