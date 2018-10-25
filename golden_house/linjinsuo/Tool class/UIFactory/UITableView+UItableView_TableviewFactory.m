//
//  UITableView+UItableView_TableviewFactory.m
//  TongChengCTMS
//
//  Created by mac on 2018/9/11.
//  Copyright © 2018年 刘帅. All rights reserved.
//

#import "UITableView+UItableView_TableviewFactory.h"

@implementation UITableView (UItableView_TableviewFactory)

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
