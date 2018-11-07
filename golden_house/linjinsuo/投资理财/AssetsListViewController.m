//
//  AssetsListViewController.m
//  linjinsuo
//
//  Created by admin on 2018/3/7.
//  Copyright © 2018年 admin. All rights reserved.
//

#import "AssetsListViewController.h"
#import "AssetsTableViewDelegate.h"
#import "AssetsTableViewDataSource.h"
#import "TableViewModel.h"
@interface AssetsListViewController ()<NoDataViewTouchDelegate>
{
    AssetsTableViewDataSource *tableViewDataSource;
    AssetsTableViewDelegate *tableViewDelegate;
}

@property (strong, nonatomic) UITableView *tableView;




@end

@implementation AssetsListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setTitleName:@"MVVM模式尝试简单展示模式"];
    [self.view addSubview:self.tableView];
    TableViewModel *model = [[TableViewModel alloc]init];
    [model headerRefreshRequestWithCallback:^(NSArray *titleArr, NSArray *imageArr) {
        tableViewDataSource.images = titleArr;
        tableViewDataSource.titles = imageArr;
        
        [self.tableView reloadData];
        
    }];
}


- (UITableView *)tableView{
    if (!_tableView) {
        
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, topHeight, SCREEN_WIDTH, SCREEN_HEIGHT-SafeAreaBottomHeight-topHeight) style:UITableViewStylePlain];
        
        tableViewDelegate = [[AssetsTableViewDelegate alloc]init];
        tableViewDataSource = [[AssetsTableViewDataSource alloc]init];
       
        _tableView.dataSource = tableViewDataSource;
        _tableView.delegate = tableViewDelegate;
        
        _tableView.backgroundColor = LHBackgroundColor;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
        [_tableView setSeparatorInset:UIEdgeInsetsMake(0,15,0,15)];
        if (DeviceSystemVersion.doubleValue >= 11.0) {
            _tableView.estimatedRowHeight = 0;
            _tableView.estimatedSectionHeaderHeight = 0;
            _tableView.estimatedSectionFooterHeight = 0;
        }
        [_tableView setSeparatorColor:LHBackgroundColor];
        _tableView.contentInset = UIEdgeInsetsMake(0, 0, 85+SafeAreaBottomHeight, 0);
        _tableView.scrollIndicatorInsets = UIEdgeInsetsMake(topHeight, 0, 85+SafeAreaBottomHeight, 0);
        _tableView.tableFooterView = [[UIView alloc]initWithFrame:CGRectZero];
       
    }
    
    return _tableView;
}
@end
