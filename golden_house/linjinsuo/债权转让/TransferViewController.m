//
//  TransferViewController.m
//  linjinsuo
//
//  Created by admin on 2018/3/7.
//  Copyright © 2018年 admin. All rights reserved.
//

#import "TransferViewController.h"
@interface TransferViewController ()
<UITableViewDelegate,UITableViewDataSource,NoDataViewTouchDelegate>
{
    NoDataView * dataView;
    NSMutableArray* _forumListArray;
    NSInteger _offset;
}
@property (weak, nonatomic) UITableView *tableView;
@end

@implementation TransferViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setTitleName:@"债权转让"];
    [self checkNetWork];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(100, 100, 100, 0)];
    
    label.backgroundColor = LHRedColor;
    
    label.text = @"我会自己去sugvsuvcusfxcysbkdcnsgfucngmryfdwsxjbnedkjfgvwyeer ctub yg适应";
    
    label.numberOfLines = 0;
    
    [label sizeToFit];
    
    [self.view addSubview:label];
    
//    [[HDNetworking sharedHDNetworking]POST:@"" parameters:nil success:^(id  _Nonnull responseObject) {
//
//    } failure:^(NSError * _Nonnull error) {
//
//    }];

}

-(void)checkNetWork
{
    // 创建网络监测者
    if ([[YYReachability reachability] isReachable]) {
        dataView = [[NoDataView alloc] initImageWithFrame:self.view.bounds image:[UIImage imageNamed:@"order_empty"] description:L(@"没有相关数据") canTouch:NO];
        dataView.delegate = self;
        [self.tableView addSubview:dataView];
        [dataView setHidden:YES];
        [self.tableView.mj_header beginRefreshing];
    }
    else
    {
        dataView = [[NoDataView alloc] initNoInternetWithFrame:self.view.bounds description:L(@"no_netowrk") canTouch:NO];
        dataView.delegate = self;
        [dataView setHidden:NO];
        [self.tableView addSubview: dataView];
    }
}
////上拉加载
//-(void)loadMoreData
//{
//    [self nextPage];
//}
//
//
//- (void)nextPage
//{
//    if (pageModel.currentPage >= pageModel.totalPage)
//    {
//        [self.tableView.mj_footer endRefreshingWithNoMoreData];
//        return;
//    }
//    _offset = _offset + 10;
//    [self gotoPage:(_forumListArray.count / 10)+1];
//}
//-(void)gotoPage:(NSUInteger)page

//
//    url =    [self urldecode:postDic];
//    url = [NSString stringWithFormat:@"%@%@",MainUrl,url];
//    [[HDNetworking sharedHDNetworking]  POST:url parameters:@"" success:^(id responseBody){
//
//        ErrorModel * model = [ErrorModel mj_objectWithKeyValues:[responseBody valueForKey:@"Head"]];
//        if ([model.code isEqualToString:@"0000"]) {
//            NSMutableArray *ay = [[responseBody objectForKey:@"Body"]valueForKey:@"data"];
//            if (_offset == 0) {
//                [dataView setHidden:NO];
//                [_forumListArray removeAllObjects];
//            }
//            for (int i = 0; i <ay.count ; i++) {
//                TransfeModel * data = [TransfeModel mj_objectWithKeyValues:ay[i]];
//                [_forumListArray addObject:data];
//                [dataView setHidden:YES];
//            }
//        }else
//        {
//
//        }
//        [self.tableView reloadData];
//        [self.tableView.mj_header endRefreshing];
//        [self.tableView.mj_footer endRefreshing];
//    }failure:^(NSError * _Nonnull error) {
//        [self.tableView.mj_header endRefreshing];
//        [self.tableView.mj_footer endRefreshing];
//    }];
//}
////下拉刷新
//-(void)refreshList
//{
//    _offset = 0;
//    [self gotoPage:0];
//}
//
//
//#pragma mark - tableview
//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
//{
//    return 1;
//}
//
//-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
//{
//
//    return _forumListArray.count;
//}
//
//-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//
//    return 160;
//
//}
//
//- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
//{
//    return 0.01;
//}
//-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
//{
//    return 10;
//}
//
//-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    static NSString *MeViewCellId = @"cellId";
//    TransfeCell *cell = [tableView dequeueReusableCellWithIdentifier:MeViewCellId];
//    if (cell ==nil) {
//        cell = [[TransfeCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:MeViewCellId];
//
//    }
//    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
//    TransfeModel * data = _forumListArray[indexPath.row];
//    cell.Model = data;
//    cell.separatorInset = UIEdgeInsetsMake(0.3f, 10.0f, 0.0f,0.0f);
//    return cell;
//}
//
//-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    [tableView deselectRowAtIndexPath:indexPath animated:YES];
//    TransDetailController * vc = [[TransDetailController alloc]init];
//    vc.model = _forumListArray[indexPath.row];
//    [self pushVc:vc];
//}
//
//- (void)didReceiveMemoryWarning {
//    [super didReceiveMemoryWarning];
//    // Dispose of any resources that can be recreated.
//}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
