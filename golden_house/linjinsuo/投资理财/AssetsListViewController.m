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
//    _forumListArray = [NSMutableArray arrayWithCapacity:0];
    [self setTitleName:@"投资理财"];
//    [self createTableView];
    // Do any additional setup after loading the view.
    
    
 
    
//
//    UIButton*btn = [UIButton buttonWithType:UIButtonTypeCustom];
//
//    btn.frame=CGRectMake(50,300,60,30);
//
//    btn.titleLabel.font=[UIFont fontWithName:@"iconfont" size: 15];
//
//    [btn setImage:kIC_Img(@"\U0000e6ea",30, [UIColor blackColor])forState:UIControlStateNormal];
//
//    [self.view addSubview:btn];
   
}
//-(void)viewWillAppear:(BOOL)animated
//{
//     [self.tableView.mj_header beginRefreshing];
//}
//-(void)createTableView
//{
//    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, topHeight, SCREEN_WIDTH, SCREEN_HEIGHT-SafeAreaBottomHeight-topHeight) style:UITableViewStyleGrouped];
//    tableView.dataSource = self;
//    tableView.delegate = self;
//    tableView.backgroundColor =LHBackgroundColor;
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
//-(void)checkNetWork
//{
//    // 创建网络监测者
//    if ([[YYReachability reachability] isReachable]) {
//        dataView = [[NoDataView alloc] initImageWithFrame:self.view.bounds image:[UIImage imageNamed:@"order_empty"] description:L(@"没有相关数据") canTouch:NO];
//        dataView.delegate = self;
//    }
//    else
//    {
//        dataView = [[NoDataView alloc] initNoInternetWithFrame:self.view.bounds description:L(@"no_netowrk") canTouch:NO];
//        dataView.delegate = self;
//        [dataView setHidden:NO];
//        [self.tableView addSubview: dataView];
//    }
//}
////上拉加载
//-(void)loadMoreData
//{
//    [self nextPage];
//}
//
//
//- (void)nextPage
//{
//    if (dataModel.page.currentPage >= dataModel.page.totalPage)
//    {
//        [self.tableView.mj_footer endRefreshingWithNoMoreData];
//        return;
//    }
//    _offset = _offset + 5;
//    [self gotoPage:(_forumListArray.count / 5)+1];
//}
//-(void)gotoPage:(NSUInteger)page
//{
//    NSString * url;
//
//    NSMutableDictionary * pageDic = [[NSMutableDictionary alloc]initWithCapacity:3];
//
//    NSNumber *  count= __INT(page);
//    [pageDic setObject:count.stringValue forKey:@"currentPage"];
//    [pageDic setObject:@"5" forKey:@"showCount"];
//    NSMutableDictionary * bodyDataDic = [[NSMutableDictionary alloc]initWithCapacity:3];
//    [bodyDataDic setObject:pageDic forKey:@"page"];
//
//    NSMutableDictionary * postDic = [[NSMutableDictionary alloc]initWithCapacity:3];
//    [self.psddDic setObject:@"getAllBidPageList" forKey:@"serviceCode"];
//    [postDic setObject:self.psddDic forKey:@"Head"];
//    [postDic setObject:bodyDataDic forKey:@"Body"];
//    url =    [self urldecode:postDic];
//    url = [NSString stringWithFormat:@"%@%@",MainUrl,url];
//
//    [[HDNetworking sharedHDNetworking]  POST:url parameters:@"" success:^(id responseBody){
////        NSLog(@"%@",responseBody);
//        ErrorModel * model = [ErrorModel mj_objectWithKeyValues:[responseBody valueForKey:@"Head"]];
//        if ([model.code isEqualToString:@"0000"]) {
//            dataModel = [HomeViewModel mj_objectWithKeyValues:[responseBody valueForKey:@"Body"]];
//            NSMutableArray *ay = [[responseBody objectForKey:@"Body"]valueForKey:@"data"];
//            if (_offset == 0) {
//                [_forumListArray removeAllObjects];
//            }
//            for (int i = 0; i <ay.count ; i++) {
//                ListData * data = [ListData mj_objectWithKeyValues:ay[i]];
//                [_forumListArray addObject:data];
//            }
//        }else
//        {
//            [self.view showImageHUDText:model.msg];
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
//    HomeViewCell *cell = [tableView dequeueReusableCellWithIdentifier:MeViewCellId];
//    if (cell ==nil) {
//        cell = [[HomeViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:MeViewCellId];
//
//    }
//    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
//    ListData * data = _forumListArray[indexPath.row];
//    cell.Model = data;
//    cell.separatorInset = UIEdgeInsetsMake(0.3f, 10.0f, 0.0f,0.0f);
//    return cell;
//}
//
//-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    [tableView deselectRowAtIndexPath:indexPath animated:YES];
//    ListData * data = _forumListArray[indexPath.row];
//    AssetDetailController * vc = [[AssetDetailController alloc]init];
//    vc.model = data;
//    [self pushVc:vc];
//}
//
//- (void)didReceiveMemoryWarning {
//    [super didReceiveMemoryWarning];
//    // Dispose of any resources that can be recreated.
//}
//
///*
//#pragma mark - Navigation
//
//// In a storyboard-based application, you will often want to do a little preparation before navigation
//- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
//    // Get the new view controller using [segue destinationViewController].
//    // Pass the selected object to the new view controller.
//}
//*/

@end
