//
//  MineViewController.m
//  linjinsuo
//
//  Created by admin on 2018/3/7.
//  Copyright © 2018年 admin. All rights reserved.
//

#import "MineViewController.h"
#import "LoginViewController.h"



#import "NewWebViewController.h"
#import "ECShareView.h"


@interface MineViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) UITableView *tableView;
@property (copy, nonatomic) NSArray *titles;
@property (copy, nonatomic) NSArray *images;
@property (strong, nonatomic) NSString *pid;
@property (strong, nonatomic) NSString *sid;
@property(strong,nonatomic)NSDictionary * statusDic;
@property(strong,nonatomic)NSDictionary * userInfoDic;
@property(strong,nonatomic)NSDictionary * meonyDic;
@end

@implementation MineViewController
//- (NSArray *)titles
//{
//    if (!_titles) {
//
//        _titles = @[@"交易记录",@"认购记录",@"兑付记录",@"债权转让",@"邀请好友",@"关于我们"]; //,@"收货地址",@"消息中心"
//    }
//    return _titles;
//}
//
//- (NSArray *)images
//{
//    if (!_images) {
//        _images =  @[@"s1",@"s2",@"s3",@"s4",@"s5",@"s7"];//,@"ic_me_address",@"ic_me_message"
//    }
//    return _images;
//}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setTitleName:@"wode"];
}
//-(void)viewWillAppear:(BOOL)animated
//{
//
//    self.image.hidden = YES;
//    [self createTabview];
//
//    if (self.isLogin == YES) {
//        NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
//        NSDictionary * userinfo = [userDefault objectForKey:@"UserInfo"];
//        self.pid = [userinfo valueForKey:@"linKingTokenPid"];
//        self.sid = [userinfo valueForKey:@"linKingTokenSid"];
//        [self.headerView setLogOut:@""];
//        [self getUserInfo];
//        [self getUsermoney];
//    }else
//    {
//        [self.headerView setLogOut:@""];
//
//        [self.tableView reloadData];
//    }
//}
//-(void)didhelpcenter
//{
//    NewWebViewController* webView = [[NewWebViewController alloc]init];
//    webView.htmlUrl =HelpUrl;
//    webView.Showname = @"帮助中心";
//    webView.isPush = YES;
//    [self pushVc:webView];
//}
//-(void)getUserStatus
//{
//    NSString * url;
//
//    NSMutableDictionary * postDic = [[NSMutableDictionary alloc]initWithCapacity:3];
//    [self.psddDic setObject:@"getUserAccountStatus" forKey:@"serviceCode"];
//    [self.psddDic setObject:self.pid forKey:@"pid"];
//    [self.psddDic setObject:self.sid forKey:@"sid"];
//    [postDic setObject:self.psddDic forKey:@"Head"];
//    [postDic setObject:self.BodyDic forKey:@"Body"];
//    url =    [self urldecode:postDic];
//
//    url = [NSString stringWithFormat:@"%@%@",MainUrl,url];
//    [[HDNetworking sharedHDNetworking]  POST:url parameters:@"" success:^(id responseBody){
//        ErrorModel * model = [ErrorModel mj_objectWithKeyValues:[responseBody valueForKey:@"Head"]];
//        if ([model.code isEqualToString:@"0000"]) {
//            self.statusDic = responseBody[@"Body"][@"data"][0];
//            if ([[self.statusDic valueForKey:@"isAuth"] isEqualToString:@"00"]) {
//                [self.headerView setLogOut:@"1"];
//
//            }else{
//                [self.headerView setMoenyDic:self.meonyDic];
//
//            }
//        }else
//        {
//            [self.view showImageHUDText:model.msg];
//        }
//    }failure:^(NSError * _Nonnull error) {
//
//    }];
//}
//-(void)getUsermoney
//{
//    NSString * url;
//
//    NSMutableDictionary * postDic = [[NSMutableDictionary alloc]initWithCapacity:3];
//    [self.psddDic setObject:@"getUserAssets" forKey:@"serviceCode"];
//    [self.psddDic setObject:self.pid forKey:@"pid"];
//    [self.psddDic setObject:self.sid forKey:@"sid"];
//    [postDic setObject:self.psddDic forKey:@"Head"];
//    [postDic setObject:self.BodyDic forKey:@"Body"];
//    url =    [self urldecode:postDic];
//
//    url = [NSString stringWithFormat:@"%@%@",MainUrl,url];
//    [[HDNetworking sharedHDNetworking]  POST:url parameters:@"" success:^(id responseBody){
//        ErrorModel * model = [ErrorModel mj_objectWithKeyValues:[responseBody valueForKey:@"Head"]];
//        if ([model.code isEqualToString:@"0000"]) {
//            self.meonyDic = responseBody[@"Body"][@"data"][0];
//            [self getUserStatus];
//        }else
//        {
//            [self.view showImageHUDText:model.msg];
//        }
//    }failure:^(NSError * _Nonnull error) {
//
//    }];
//}
//-(void)getUserInfo
//{
//    NSString * url;
//
//    NSMutableDictionary * postDic = [[NSMutableDictionary alloc]initWithCapacity:3];
//    [self.psddDic setObject:@"getUserInfo" forKey:@"serviceCode"];
//    [self.psddDic setObject:self.pid forKey:@"pid"];
//    [self.psddDic setObject:self.sid forKey:@"sid"];
//    [postDic setObject:self.psddDic forKey:@"Head"];
//    [postDic setObject:self.BodyDic forKey:@"Body"];
//    url =    [self urldecode:postDic];
//
//    url = [NSString stringWithFormat:@"%@%@",MainUrl,url];
//    [[HDNetworking sharedHDNetworking]  POST:url parameters:@"" success:^(id responseBody){
//        ErrorModel * model = [ErrorModel mj_objectWithKeyValues:[responseBody valueForKey:@"Head"]];
//        if ([model.code isEqualToString:@"0000"]) {
//             self.userInfoDic = responseBody[@"Body"][@"data"][0];
//            [self.headerView.userButton setTitle:[self.userInfoDic valueForKey:@"nickName"] forState:UIControlStateNormal];
//        }else
//        {
//            [self.view showImageHUDText:model.msg];
//        }
//    }failure:^(NSError * _Nonnull error) {
//
//    }];
//
//}
//-(void)createTabview
//{
//    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-SafeAreaBottomHeight-topHeight) style:UITableViewStyleGrouped];
//    tableView.dataSource = self;
//    tableView.delegate = self;
//    if (@available(iOS 11.0, *)) {
//        tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
//    } else {
//        // Fallback on earlier versions
//    }
//    tableView.backgroundColor = LHBackgroundColor;
//    tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
//    [tableView setSeparatorInset:UIEdgeInsetsMake(0,15,0,15)];
//    if (DeviceSystemVersion.doubleValue >= 11.0) {
//        tableView.estimatedRowHeight = 0;
//        tableView.estimatedSectionHeaderHeight = 0;
//        tableView.estimatedSectionFooterHeight = 0;
//    }
//    [self.tableView setSeparatorColor:LHBackgroundColor];
//    tableView.contentInset = UIEdgeInsetsMake(0, 0, 85+SafeAreaBottomHeight, 0);
//    tableView.scrollIndicatorInsets = UIEdgeInsetsMake(topHeight, 0, 85+SafeAreaBottomHeight, 0);
//    tableView.tableFooterView = [[UIView alloc]initWithFrame:CGRectZero];
//    [self.view addSubview:tableView];
//    self.tableView = tableView;
//
//    MineHeadView *headerView = [[MineHeadView alloc] init];
//    headerView.height = ceilf(SCREEN_HEIGHT/3);
//    headerView.delegate = self;
//    self.tableView.tableHeaderView = headerView;
//    self.headerView = headerView;
//    [self.headerView.button addTarget:self action:@selector(showUserView) forControlEvents:UIControlEventTouchUpInside];
//    [self.headerView.userButton addTarget:self action:@selector(userDetail) forControlEvents:UIControlEventTouchUpInside];
//    [self.headerView.btnImageIcon addTarget:self action:@selector(userDetail) forControlEvents:UIControlEventTouchUpInside];
//}
//- (void)didRecharge
//{
//    if ([self isLogin]) {
//        if ([self.userInfoDic[@"isAuth"] isEqualToString:@"01"]) {
//            RechargeController * vc = [[RechargeController alloc]init];
//            [self pushVc:vc];
//        }else
//        {
//           [self alertVC];
//        }
//
//    }else
//    {
//        [self showLoginWindow];
//    }
//
//}
//- (void)didwithdraw
//{
//    if ([self isLogin]) {
//        if ([self.userInfoDic[@"isAuth"] isEqualToString:@"01"]) {
//            WithdrawController * vc = [[WithdrawController alloc]init];
//            [self pushVc:vc];
//        }else
//        {
//           [self alertVC];
//        }
//
//    }else
//    {
//        [self showLoginWindow];
//    }
//}
//- (void)alertVC{
//
//    WS(ws);
//
//    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@""message:@"您还没有进行身份验证"preferredStyle:UIAlertControllerStyleAlert];
//    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"去认证" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
//        [ws pushVcToCertification];
//
//    }];
//
//    [okAction setValue:[UIColor redColor] forKey:@"_titleTextColor"];
//
//    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
//        NSLog(@"Cancel ");
//    }];
//
//    [alertController addAction:okAction];
//
//    // A
//    [alertController addAction:cancelAction];
//
//    [self presentViewController:alertController animated:YES completion:nil];
//
//}
//
//
////实名认证
//-(void)pushVcToCertification{
//    ChooseAccountTypeVC *vc = [[ChooseAccountTypeVC alloc]init];
//
//    [self pushVc:vc];
//
//}
//-(void)userDetail
//{
//    if (self.isLogin == YES) {
//        UserDetailViewController * vc = [[UserDetailViewController alloc]init];
//        vc.userInfoDic = self.userInfoDic;
//        vc.userStatus = self.statusDic;
//        [self pushVc:vc];
//    }else
//    {
//        [self showLoginWindow];
//    }
//}
//-(void)showUserView
//{
//    LoginViewController *vc = [[LoginViewController alloc] init];
//
//    UINavigationController *navi = [[UINavigationController alloc] initWithRootViewController:vc];
//
//    [self presentViewController:navi animated:YES completion:^{
//
//    }];
//
//
//}
//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
//{
//    //return self.titles.count+ 1;
//    return 1;
//
//}
//
//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
//{
//    return self.titles.count;
//}
//
//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//
//    static NSString *MeViewCellId = @"cellId";
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:MeViewCellId];
//    if (cell ==nil) {
//        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:MeViewCellId];
//        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
//        cell.textLabel.font = [UIFont systemFontOfSize:15];
//        cell.textLabel.textColor = ThemeTextColor;
//    }
//    cell.imageView.image = [UIImage imageNamed:self.images[indexPath.row]];
//    cell.textLabel.text = self.titles[indexPath.row];
//    cell.separatorInset = UIEdgeInsetsMake(0.3f, 50.0f, 0.0f,0.0f);
//    return cell;
//}
//
//-(void)didImgupdated
//{
//    LoginViewController * vc = [[LoginViewController alloc]init];
//    [self pushVc:vc];
//}
//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//
//    return 44;
//}
//
//- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
//{
//
//    return 10;
//}
//
//- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
//{
//    return 0.5;
//}
//-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    [tableView deselectRowAtIndexPath:indexPath animated:YES];
//    switch (indexPath.row) {
//        case 0:
//        {
//            if ([self isLogin]) {
//                if ([self.userInfoDic[@"isAuth"] isEqualToString:@"01"]) {
//                    TransaViewController * vc = [[TransaViewController alloc]init];
//                    [self pushVc:vc];
//                }else
//                {
//                    [self alertVC];
//                }
//            }else
//            {
//                [self showLoginWindow];
//            }
//
//        }
//            break;
//        case 1:
//        {
//            if ([self isLogin]) {
//                if ([self.userInfoDic[@"isAuth"] isEqualToString:@"01"]) {
//                    InvesListViewController * vc = [[InvesListViewController alloc]init];
//                    [self pushVc:vc];
//                }else
//                {
//                    [self alertVC];
//                }
//            }else
//            {
//                [self showLoginWindow];
//            }
//
//        }
//            break;
//        case 2:
//        {
//            if ([self isLogin]) {
//                if ([self.userInfoDic[@"isAuth"] isEqualToString:@"01"]) {
//                    ProfitViewController * vc = [[ProfitViewController alloc]init];
//                    [self pushVc:vc];
//                }else
//                {
//                    [self alertVC];
//                }
//            }else
//            {
//                [self showLoginWindow];
//            }
//        }
//            break;
//        case 3:
//        {
//            if ([self isLogin]) {
//                if ([self.userInfoDic[@"isAuth"] isEqualToString:@"01"]) {
//                    CreadSententController * vc = [[CreadSententController alloc]init];
//                    [self pushVc:vc];
//                }else
//                {
//                    [self alertVC];
//                }
//            }else
//            {
//                [self showLoginWindow];
//            }
//
//        }
//            break;
//        case 4:
//        {
//            [self doShare];
//        }
//            break;
//        case 5:
//        {
//            NewWebViewController* webView = [[NewWebViewController alloc]init];
//            webView.htmlUrl =AboutUrl;
//            webView.isPush = YES;
//            webView.Showname = @"关于我们";
//            [self pushVc:webView];
//        }
//            break;
//        default:
//            break;
//    }
//}
//-(void)doShare
//{
//    NSString * shareurl;
//    NSLog(@"%@",self.userInfoDic);
//    JMWeakSelf
//    if (!IsNilOrNull(self.userInfoDic)) {
//         NSString * tuiguang = [self.userInfoDic valueForKey:@"myRecommendCode"];
//         shareurl = [NSString stringWithFormat:@"http://weixin.linjinsuo.com/login/register?recommendCode=%@",tuiguang];
//    }else
//    {
//        shareurl =  @"http://weixin.linjinsuo.com/login/register?recommendCode=";
//    }
//
//
//    ECShareView *share = [ECShareView shareViewWithType:ECShareViewTypeDontShowCopyAndCollect hasRepinFlag:false];
//    [share showInView:self.view];
//    [share setUpItemClickHandle:^(ECShareView *shareView, NSString *title, NSInteger index, NSInteger shareType) {
//
//        if (shareType == 6) {
//            UIPasteboard *pasteboard = [UIPasteboard generalPasteboard];
//            pasteboard.string = @"http://weixin.linjinsuo.com";
//            [self.view showImageHUDText:@"复制成功"];
//        }else
//        {
//             [[ShareManager sharedManager] shareWithSharedType:shareType title:@"来自临金所APP的分享" image:@"" url:shareurl content:@"我正在使用临金所APP，快来和我一起使用吧" controller:weakSelf];
//        }
//    }];
//}
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
