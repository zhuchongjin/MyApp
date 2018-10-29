//
//  AssetsListViewController.m
//  linjinsuo
//
//  Created by admin on 2018/3/7.
//  Copyright © 2018年 admin. All rights reserved.
//

#import "AssetsListViewController.h"
#import "TBCityIconFont.h"
#import "UIImage+TBCityIconFont.h"
@interface AssetsListViewController ()<UITableViewDelegate,UITableViewDataSource,NoDataViewTouchDelegate>
{
    NoDataView * dataView;
    NSMutableArray* _forumListArray;
    NSInteger _offset;
}
@property (weak, nonatomic) UITableView *tableView;
@property (nonatomic, retain) NSNumber * has_next;

@end

@implementation AssetsListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setTitleName:@"投资理财"];
   
}


@end
