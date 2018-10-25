//
//  BaseViewController.m
//  linjinsuo
//
//  Created by admin on 2018/3/6.
//  Copyright © 2018年 admin. All rights reserved.
//

#import "BaseViewController.h"
#import "LoginViewController.h"
@interface BaseViewController ()
{
    BOOL  showLoginYES;
}
@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationController.navigationBarHidden = YES;
    self.image = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, screenTopHeight+screenNavHeight)];
    self.image.userInteractionEnabled = YES;
    self.image.backgroundColor = RGB(7,197,83);
    [self.view addSubview:self.image];
    
    RegisterNotify(LOGOUT, @selector(notifyMethod:));
    // Do any additional setup after loading the view.
    [IQKeyboardManager sharedManager].shouldResignOnTouchOutside = YES;
    [IQKeyboardManager sharedManager].keyboardDistanceFromTextField = 40.0f;
}

-(void)isNetworking
{
    // 创建网络监测者
    if (![[YYReachability reachability] isReachable]) {
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"提示" message:@"网络连接失败，请检查网络后重试" preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
            NSLog(@"The \"Okay/Cancel\" alert's cancel action occured.");
        }];
        [alertController addAction:cancelAction];
        [self presentViewController:alertController animated:YES completion:nil];
    }
}
-(void)notifyMethod:(NSNotification*)notifications
{
    if ([[notifications name] isEqualToString:LOGOUT]) {
        [self showLoginWindow];
    }
    
}
-(NSString *) urldecode:(NSMutableDictionary *) input
{
    NSError *parseError = nil;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:input options:NSJSONWritingPrettyPrinted error:&parseError];
    
    NSString * url =  [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    url = [url stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLPathAllowedCharacterSet]];
    return url;
}
-(BOOL)isLogin
{
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    NSDictionary * userinfo = [userDefault objectForKey:@"UserInfo"];
    if (IsNilOrNull(userinfo)) {
        return NO;
    }else
    {
        [self.psddDic setObject:[userinfo valueForKey:@"linKingTokenPid"] forKey:@"pid"];
        [self.psddDic setObject:[userinfo valueForKey:@"linKingTokenSid"] forKey:@"sid"];
        return YES;
    }
}

//#pragma mark - 滑动开始触发事件

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self isNetworking];
    [self isLogin];
    self.navigationController.navigationBarHidden = YES;
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
    
}
#pragma mark - 设置顶部分割线
-(void)setTopLabel
{
    UILabel * label = [[UILabel alloc]initWithFrame:CGRectMake(0,topHeight-0.5, viewWidth, 0.3)];
    label.backgroundColor = LHBackgroundColor;
    [self.view addSubview:label];
}
#pragma mark - 设置左图标
-(void)setLeftImage
{
    UIImageView * image1 = [[UIImageView alloc]initWithFrame:CGRectMake(5, screenTopHeight+10, 20, 20)];
    image1.image = [UIImage imageNamed:@"baizuojiantou"];
    //image.backgroundColor  = [UIColor colorWithRed:0xff/255.0 green:0x62/255.0 blue:0x11/255.0 alpha:1];
    [self.image addSubview:image1];
}
#pragma mark - 设置右上角图文按钮
-(void)setRightImage:(NSString *)aret image:(NSString * )imagel
{
    self.massageButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [self.massageButton setFrame:CGRectMake(viewWidth-84, screenTopHeight+10, 80, screenNavHeight-20)];
    [self.massageButton addTarget:self action:@selector(RightTextClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.massageButton setTitle:aret forState:UIControlStateNormal];
    self.massageButton.titleLabel.font = UIFontMake(15);
    self.massageButton.titleLabel.textAlignment = NSTextAlignmentRight;
    [self.massageButton setImage:[UIImage imageNamed:imagel] forState:UIControlStateNormal];
    self.massageButton.tintColor =ThemeTextColor;
    [self.massageButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.image addSubview:self.massageButton];
    
}
#pragma mark - 设置右上角图片按钮
- (void)setRightButton:(NSString *)imageName
{
    UIButton *leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
    leftButton.frame = CGRectMake(SCREEN_WIDTH-50, screenTopHeight, 40,40);
    UIImageView * imageview = [[UIImageView alloc]initWithFrame:CGRectMake(15, 10, 20, 20)];
    imageview.image = [UIImage imageNamed:imageName];
    //    [leftButton setImage:[[UIImage imageNamed:imageName] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate] forState:UIControlStateNormal];
    [leftButton addSubview:imageview];
    [self.image addSubview:leftButton];
    leftButton.adjustsImageWhenHighlighted = NO;
    [leftButton addTarget:self action:@selector(Rightbuttonclick:) forControlEvents:UIControlEventTouchUpInside];
}
#pragma mark - 右图标按钮点击方法
-(void)Rightbuttonclick:(UIButton *)sender
{
    
}
#pragma mark - 右图文按钮点击方法
- (void)RightTextClick:(UIButton *)sender
{
    
}
#pragma mark - 设置顶部标题
- (void)setTitleName:(NSString *)title
{
    self.label = [[UILabel alloc]initWithFrame:CGRectMake(40, screenTopHeight, viewWidth-80, screenNavHeight)];
    self.label.text = title;
    self.label.textColor = [UIColor whiteColor];
    self.label.font = LHTitleFont(18);
    self.label.textAlignment = NSTextAlignmentCenter;
    
    [self.image addSubview:self.label];
}
#pragma mark - 设置左上角返回功能按钮
- (void)setBackLeftButton:(NSString *)imageName
{
    self.BackleftButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.BackleftButton.frame = CGRectMake(10, screenTopHeight+2, 60,40);
    UIImageView * imageview = [[UIImageView alloc]initWithFrame:CGRectMake(0, 10, 20, 20)];
    UIImage *image = [UIImage imageNamed:@"arrow_back"];
    image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    imageview.image = image;
    [self.BackleftButton addSubview:imageview];
    self.BackleftButton.tintColor = LHWhiteColor;
    [self.image addSubview:self.BackleftButton];
    self.BackleftButton.adjustsImageWhenHighlighted = NO;
    [self.BackleftButton addTarget:self action:@selector(backClick:) forControlEvents:UIControlEventTouchUpInside];
}
#pragma mark - 设置左上角定制功能按钮
- (void)setLeftButton:(NSString *)imageName title:(NSString *)name;
{
    UIButton *leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
    leftButton.frame = CGRectMake(10, screenTopHeight+2, 40,40);
    UIImageView * imageview = [[UIImageView alloc]initWithFrame:CGRectMake(0, 10, 20, 20)];
    
    UIImage *image =[UIImage imageNamed:imageName];
    image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    imageview.tintColor = LHWhiteColor;
    imageview.image = image;
    [leftButton addSubview:imageview];
    [self.image addSubview:leftButton];
    leftButton.tintColor = LHWhiteColor;
    [leftButton setTitle:name forState:UIControlStateNormal];
    leftButton.titleLabel.textAlignment = NSTextAlignmentRight;
    leftButton.titleLabel.font = UIFontMake(16);
    leftButton.tintColor = [UIColor whiteColor];
    leftButton.adjustsImageWhenHighlighted = NO;
    [leftButton addTarget:self action:@selector(LeftClick:) forControlEvents:UIControlEventTouchUpInside];
}
#pragma mark - 设置左上角定制功能按钮点击方法
- (void)LeftClick:(UIButton *)sender
{
    
}
#pragma mark - 设置左上角定制功能按钮返回功能点击方法
- (void)backClick:(UIButton *)sender
{
    if (self.presentingViewController) {
        [self dismissViewControllerAnimated:YES completion:nil];
    } else {
        [self.navigationController popViewControllerAnimated:YES];
    }
    
}

-(void)showLoginWindow
{
    LoginViewController *vc = [[LoginViewController alloc] init];
    UIViewController *viewController = [UIApplication sharedApplication].keyWindow.rootViewController;
    if ([viewController.presentedViewController isKindOfClass:[UINavigationController class]]) {
        UINavigationController *navigation = (id)viewController.presentedViewController;
        if ([navigation.topViewController isKindOfClass:[LoginViewController class]]) {
            return;
        }
    }    
    UINavigationController *navi = [[UINavigationController alloc] initWithRootViewController:vc];
    
    [self presentViewController:navi animated:YES completion:^{
        
    }];
}
- (void)presentVc:(UIViewController *)vc {
    if ([vc isKindOfClass:[UIViewController class]] == NO) return ;
    [self presentVc:vc completion:nil];
}
- (void)presentVc:(UIViewController *)vc completion:(void (^)(void))completion {
    if ([vc isKindOfClass:[UIViewController class]] == NO) return ;
    [self presentViewController:vc animated:YES completion:completion];
}
- (void)pop {
    if (self.navigationController == nil) return ;
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)popdelay {
    dispatch_time_t delayTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC));
    dispatch_after(delayTime, dispatch_get_main_queue(), ^{
        if (self.navigationController == nil) return ;
        [self.navigationController popViewControllerAnimated:YES];
    });
}

- (void)popdelayToVc:(UIViewController *)vc{
    
    dispatch_time_t delayTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC));
    dispatch_after(delayTime, dispatch_get_main_queue(), ^{

        if ([vc isKindOfClass:[UIViewController class]] == NO) return ;
        if (self.navigationController == nil) return ;
//        [self.navigationController popToViewController:vc animated:YES];
        [self.navigationController pushViewController:vc animated:NO];
    });
}

- (void)popToRootVc {
    if (self.navigationController == nil) return ;
    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (void)popToVc:(UIViewController *)vc {
    
    if ([vc isKindOfClass:[UIViewController class]] == NO) return ;
    if (self.navigationController == nil) return ;
    [self.navigationController popToViewController:vc animated:YES];
}
- (void)pushVc:(UIViewController *)vc {
    
    if ([vc isKindOfClass:[UIViewController class]] == NO) return ;
    if (self.navigationController == nil) return ;
    if (vc.hidesBottomBarWhenPushed == NO) {
        vc.hidesBottomBarWhenPushed = YES;
    }
    
    [self.navigationController pushViewController:vc animated:YES];
}



- (void)clearAllUserDefaultsData
{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    
    NSDictionary *dic = [userDefaults dictionaryRepresentation];
    for (id  key in dic) {
        [userDefaults removeObjectForKey:key];
    }
    [userDefaults synchronize];
}

- (void)dealloc
{
    RemoveNofify;
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
