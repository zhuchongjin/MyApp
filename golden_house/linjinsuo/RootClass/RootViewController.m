//
//  RootViewController.m
//  linjinsuo
//
//  Created by admin on 2018/3/7.
//  Copyright © 2018年 admin. All rights reserved.
//

#import "RootViewController.h"
#import "AssetsListViewController.h"
#import "HomeViewController.h"
#import "TransferViewController.h"
#import "MineViewController.h"
@interface RootViewController ()<UITabBarDelegate,UITabBarControllerDelegate>
@property (strong, nonatomic) NSMutableArray * controllerArray;
@property (nonatomic, strong) UITabBarItem *lastItem;
@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createTab];
    // Do any additional setup after loading the view.
}
-(void)createTab
{
    NSDictionary * dict1 = @{NSFontAttributeName:[UIFont systemFontOfSize:12]};
    NSDictionary * dict = @{NSFontAttributeName:[UIFont systemFontOfSize:12],NSForegroundColorAttributeName:ThemesColor};
    // 设置高亮状态的字体及颜色
    
    HomeViewController * first = [[HomeViewController alloc]init];
    first.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"控件" image:[[UIImage imageNamed:@"ic_tabbar_home_normal"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[[UIImage imageNamed:@"ic_tabbar_home_pressed"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    [first.tabBarItem setTitleTextAttributes:dict forState:UIControlStateSelected];
    [first.tabBarItem setTitleTextAttributes:dict1 forState:UIControlStateNormal];
    UINavigationController * nav1 = [[UINavigationController alloc]initWithRootViewController:first];
    
    AssetsListViewController* message = [[AssetsListViewController alloc]init];
    message.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"投资理财" image:[[UIImage imageNamed:@"ic_tabbar_bbs_normal"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[[UIImage imageNamed:@"ic_tabbar_bbs_pressed"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    [message.tabBarItem setTitleTextAttributes:dict forState:UIControlStateSelected];
    [message.tabBarItem setTitleTextAttributes:dict1 forState:UIControlStateNormal];
    UINavigationController * nav2 = [[UINavigationController alloc]initWithRootViewController:message];
    
    TransferViewController * publish = [[TransferViewController alloc]init];
    publish.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"债权转让" image:[[UIImage imageNamed:@"faxian_n"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[[UIImage imageNamed:@"faxian_p"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    [publish.tabBarItem setTitleTextAttributes:dict forState:UIControlStateSelected];
    [publish.tabBarItem setTitleTextAttributes:dict1 forState:UIControlStateNormal];
    UINavigationController * nav3 = [[UINavigationController alloc]initWithRootViewController:publish];
    
    MineViewController * home = [[MineViewController alloc]init];
    home.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"我的" image:[[UIImage imageNamed:@"ic_tabbar_profile_normal"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[[UIImage imageNamed:@"ic_tabbar_profile_pressed"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    [home.tabBarItem setTitleTextAttributes:dict forState:UIControlStateSelected];
    [home.tabBarItem setTitleTextAttributes:dict1 forState:UIControlStateNormal];
    UINavigationController * nav4 = [[UINavigationController alloc]initWithRootViewController:home];
    self.viewControllers = @[nav1,nav2,nav3,nav4];
}
- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController NS_AVAILABLE_IOS(3_0){
   
    return YES;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
