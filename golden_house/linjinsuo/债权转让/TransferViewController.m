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
//    _forumListArray = [NSMutableArray arrayWithCapacity:0];
    [self setTitleName:@"债权转让"];
//    [self createTableView];
//    RegisterNotify(BUYFIXD,  @selector(notifyMethod:));
    // Do any additional setup after loading the view.
    
    [self checkNetWork];
    
    
    
//
//    UILabel * label = [[UILabel alloc] initWithFrame:self.view.bounds];
//    UIFont *iconfont = [UIFont fontWithName:@"iconfont" size: 36];
//    label.font = iconfont;
//    //e6c7
//    label.text = @"\U0000e6c6 \U0000e6c7";//\U00003439
//    label.textColor = [UIColor redColor];
//    [self.view addSubview: label];
//
}
//
//-(void)notifyMethod:(NSNotification*)notifications
//{
//    if ([[notifications name] isEqualToString:BUYFIXD]) {
//        [self.tableView.mj_header beginRefreshing];
//    }
//
//}
//
//-(void)createTableView
//{
//    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, topHeight, SCREEN_WIDTH, SCREEN_HEIGHT-SafeAreaBottomHeight-topHeight) style:UITableViewStyleGrouped];
//    tableView.dataSource = self;
//    tableView.delegate = self;
//    tableView.backgroundColor =LHWhiteColor;
//    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
//    [tableView setSeparatorInset:UIEdgeInsetsMake(0,0,0,0)];
//    if (DeviceSystemVersion.doubleValue >= 11.0) {
//        tableView.estimatedRowHeight = 0;
//        tableView.estimatedSectionHeaderHeight = 0;
//        tableView.estimatedSectionFooterHeight = 0;
//    }
//    [self.tableView setSeparatorColor:LHBackgroundColor];
//    tableView.contentInset = UIEdgeInsetsMake(0, 0, 45+SafeAreaBottomHeight, 0);
//    tableView.scrollIndicatorInsets = UIEdgeInsetsMake(0, 0, 45+SafeAreaBottomHeight, 0);
//    tableView.tableFooterView = [[UIView alloc]initWithFrame:CGRectZero];
//    [self.view addSubview:tableView];
//    self.tableView = tableView;
//
//    MJRefreshNormalHeader *header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(refreshList)];
//    [header setTitle:@"释放更新" forState:MJRefreshStatePulling];
//    [header setTitle:@"正在更新" forState:MJRefreshStateRefreshing];
//    [header setTitle:@"下拉刷新" forState:MJRefreshStateIdle];
//    header.stateLabel.font = [UIFont systemFontOfSize:13];
//    header.stateLabel.textColor = ThemeTextColor;
//    header.lastUpdatedTimeLabel.hidden = YES;
//
//    tableView.mj_header = header;
//
//    MJChiBaoZiFooter *footer = [MJChiBaoZiFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreData)];
//    self.tableView.mj_footer = footer;
//    [self.tableView.mj_footer resetNoMoreData];
//
//    [footer setTitle:@"" forState:MJRefreshStateIdle];
//    [footer setTitle:@"没有更多了~" forState:MJRefreshStateNoMoreData];
//    [footer setTitle:@"加载中..." forState:MJRefreshStateRefreshing];
//    footer.stateLabel.textColor = RGB(90, 90, 90);
//    footer.stateLabel.font = LHTitleFont13;
//    footer.backgroundColor = UIColorClear;
//    [self checkNetWork];
//}
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
//{
//    NSString * url;
//
//    NSMutableDictionary * postDic = [[NSMutableDictionary alloc]initWithCapacity:3];
//    NSNumber *  count= __INT(page);
//    [self.param setObject:count.stringValue forKey:@"currentPage"];
//    [self.param setObject:@"10" forKey:@"showCount"];
//    NSMutableDictionary * padss = [[NSMutableDictionary alloc]initWithCapacity:3];
//
//    [self.BodyDic setObject:padss forKey:@"param"];
//    [self.BodyDic setObject:self.param forKey:@"page"];
//    [self.psddDic setObject:@"getCanDebtPageList" forKey:@"serviceCode"];
//    [postDic setObject:self.psddDic forKey:@"Head"];
//    [postDic setObject:self.BodyDic forKey:@"Body"];
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
