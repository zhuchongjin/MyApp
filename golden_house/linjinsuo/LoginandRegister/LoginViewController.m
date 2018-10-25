//
//  LoginViewController.m
//  linjinsuo
//
//  Created by admin on 2018/3/7.
//  Copyright © 2018年 admin. All rights reserved.
//

#import "LoginViewController.h"
//#import "RegisterViewController.h"
//#import "ForgetPwdViewController.h"
//#import "AFNetworking.h"
//#import "UIImageView+AFnetworking.h"
//#import "UIImageView+WebCache.h"
//#import "SmsCodeController.h"
@interface LoginViewController ()<UITableViewDelegate,UITextFieldDelegate>
{

//    UIView           *contentView;
//    UILabel         *_titleLabel;
//    UIView          *sContentView;
//    BOOL  isremerb;
//    UIButton * openbutton;
//    //记住密码
//    UIButton *remebi;
//    //登录
//    UIButton *loginButton;
//    //忘记密码
//    UIButton *forgetButton;
//    //短信登录
//    UIButton *mailButton;
//    CGFloat gtW ;
//    UIButton * registertion;
//    CGFloat gtW1;
//    UIImageView *imageV;
//    UIImageView *passwordImageView1;


}
//@property (nonatomic, strong) UITableView *tableView;
//@property (nonatomic ,strong)UIView *backView;
//@property (nonatomic ,strong)UITextField *userNameTextFiled;
//@property (nonatomic ,strong)UITextField *passwordTextFiled;
//
//@property (nonatomic, strong)UITextField *authCodeTextField;  //验证码


//@property (nonatomic, strong)UIImageView *imageV;


@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setTitleName:@"登录"];
    [self setBackLeftButton:@""];
//    [self initTableView];
//    [self createTextFileds];
//    [self createButtons];
    // Do any additional setup after loading the view.

}
//-(void)viewWillAppear:(BOOL)animated
//{
//    remebi.selected = NO;
//}
//-(void)LeftClick:(UIButton *)sender
//{
//    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
//}
//-(void)initTableView
//{
//    contentView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
//
//    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, topHeight, SCREEN_WIDTH, SCREEN_HEIGHT)];
//    self.tableView.contentInset = UIEdgeInsetsMake(0, 0, topHeight, 0);
//
//    if (DeviceSystemVersion.doubleValue >= 11.0) {
//        self.tableView.estimatedRowHeight = 0;
//        self.tableView.estimatedSectionHeaderHeight = 0;
//        self.tableView.estimatedSectionFooterHeight = 0;
//    }
//    self.tableView.clipsToBounds = YES;
//    self.tableView.delegate = self;
//    self.tableView.showsVerticalScrollIndicator = NO;
//    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
//    self.tableView.backgroundColor = [UIColor clearColor];
//    [self.tableView addSubview: contentView];
//
//    self.tableView.contentSize = contentView.frame.size;
//
//    [self.view addSubview:self.tableView];
//
//}
//-(void)createTextFileds
//{
//
//    float cellHeight = 40;
//    float abroadLeftWith = 60;
//    _backView = [[UIView alloc]initWithFrame:CGRectMake(0, 10, SCREEN_WIDTH, 200)]; //200
//    _backView.backgroundColor = [UIColor whiteColor];
//    [contentView addSubview:_backView];
//
//    UIImageView * logoImage = [[UIImageView alloc]initWithFrame:CGRectMake(30, 40, SCREEN_WIDTH-60, 60)];
//    logoImage.image = [UIImage imageNamed:@"logo"];
//    [_backView addSubview:logoImage];
//
//    _userNameTextFiled = [[UITextField alloc]initWithFrame:CGRectMake(abroadLeftWith, 110, SCREEN_WIDTH-80, cellHeight)];
//    _userNameTextFiled.delegate = self;
//    _userNameTextFiled.placeholder = L(@"手机号码");
//    _userNameTextFiled.font = [UIFont systemFontOfSize:14];
//    _userNameTextFiled.keyboardType = UIKeyboardTypeNumberPad;
//    _userNameTextFiled.clearButtonMode = UITextFieldViewModeWhileEditing;
//    _userNameTextFiled.returnKeyType = UIReturnKeyNext;
//    [_backView addSubview:_userNameTextFiled];
//
//    _passwordTextFiled = [[UITextField alloc]initWithFrame:CGRectMake(abroadLeftWith, 160, SCREEN_WIDTH-135, cellHeight)];
//    _passwordTextFiled.delegate = self;
//    _passwordTextFiled.placeholder =  L(@"密码");
//    _passwordTextFiled.font = [UIFont systemFontOfSize:14];
//    _passwordTextFiled.clearButtonMode = UITextFieldViewModeWhileEditing;
//    _passwordTextFiled.secureTextEntry = YES;
//    _passwordTextFiled.returnKeyType = UIReturnKeyDone;
//
//    [_backView addSubview:_passwordTextFiled];
//
//    openbutton = [UIButton buttonWithType:UIButtonTypeCustom];
//    openbutton.frame = CGRectMake(SCREEN_WIDTH-55, 170, 15, 15);
//    [openbutton setImage:[UIImage imageNamed:@"user_psd_see_close"] forState:UIControlStateNormal];
//    [openbutton setImage:[UIImage imageNamed:@"user_psd_see_open"] forState:UIControlStateSelected];
//    openbutton.selected = NO;
//    [openbutton addTarget:self action:@selector(openClick:) forControlEvents:UIControlEventTouchUpInside];
//    [_backView addSubview:openbutton];
//
//
//    _authCodeTextField = [Util textFieldWithFrame:CGRectMake(abroadLeftWith, 210, _passwordTextFiled.width - 40, cellHeight) placeholder:@"请输入图片验证码" backgroundColor:LHWhiteColor borderColor:nil cornerRadius:0 font:[UIFont systemFontOfSize:14] textColor:ThemeLightTextColor textAlignment:NSTextAlignmentLeft text:@"" delegate:self];
//    //    _authCodeTextField.returnKeyType = UIReturnKeyDone;
//    _authCodeTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
//    _authCodeTextField.hidden = YES;
//
//    [_backView addSubview:_authCodeTextField];
//
//    // 验证码
//
//    imageV = [Util imageViewWithFrame:CGRectMake(_authCodeTextField.right, _authCodeTextField.top + 2.5, 80, 35) backgroundColor:UIColorClear
//                          borderColor:nil cornerRadius:0 image:[UIImage imageNamed:@""] contentMode:@(1)];
//    [Util getAuthCodePictureWith:imageV];
//    imageV.hidden  = YES;
//    [_backView addSubview:imageV];
//
//    UIButton *btn = [Util buttonWithFrame:imageV.frame title:@"" titleColor:nil backgroundColor:UIColorClear titleFont:[UIFont systemFontOfSize:12] cornerRadius:0 Target:self action:@selector(authCodeBtn)];
//    [contentView addSubview:btn];
//
//
//    UIImageView *phoneImageView = [[UIImageView alloc]initWithFrame:CGRectMake(30, 125, 17, 18)];
//    phoneImageView.image = [UIImage imageNamed:@"user_login_user_name"];
//    [_backView addSubview:phoneImageView];
//    UIImageView *passwordImageView = [[UIImageView alloc]initWithFrame:CGRectMake(30, 170, 13, 22)];
//    passwordImageView.image= [UIImage imageNamed:@"user_login_password"];
//    [_backView addSubview:passwordImageView];
//
//    passwordImageView1 = [[UIImageView alloc]initWithFrame:CGRectMake(30, 215, 13, 22)];
//    passwordImageView1.image= [UIImage imageNamed:@"user_login_password"];
//    passwordImageView1.hidden = YES;
//    [_backView addSubview:passwordImageView1];
//
//
//    UIImageView *lineImageView = [[UIImageView alloc]initWithFrame:CGRectMake(25, 150, _backView.frame.size.width - 50, 1)];
//    lineImageView.backgroundColor = [UIColor colorWithRed:180/255.0 green:180/255.0 blue:180/255.0 alpha:0.3];
//    [_backView addSubview:lineImageView];
//
//    UIImageView *lineImageView1 = [[UIImageView alloc]initWithFrame:CGRectMake(25, 200, _backView.frame.size.width - 50, 1)];
//    lineImageView1.backgroundColor = [UIColor colorWithRed:180/255.0 green:180/255.0 blue:180/255.0 alpha:0.3];
//    [_backView addSubview:lineImageView1];
//
//
//}
//-(void)openClick:(UIButton *)sender
//{
//
//    if (sender.selected == YES) {
//        sender.selected = NO;
//        _passwordTextFiled.secureTextEntry = YES;
//    }else
//    {
//        sender.selected = YES;
//        _passwordTextFiled.secureTextEntry = NO;
//    }
//
//}
//
//-(void)createButtons
//{
//    loginButton = [UIButton buttonWithType:UIButtonTypeCustom];
//    loginButton.frame = CGRectMake(25, _backView.bottom+35, SCREEN_WIDTH - 50, 44);
//    [loginButton setTitle:L(@"登录") forState:UIControlStateNormal];
//    loginButton.titleLabel.font = [UIFont systemFontOfSize:19];
//    [loginButton addTarget:self action:@selector(loginButtonClick:) forControlEvents:UIControlEventTouchUpInside];
//    [loginButton setBackgroundColor:ThemesColor];
//    loginButton.clipsToBounds = YES;
//    loginButton.layer.cornerRadius = 2;
//    [contentView addSubview:loginButton];
//
////    remebi = [UIButton buttonWithType:UIButtonTypeCustom];
////    remebi.frame = CGRectMake(25, loginButton.bottom+10,75, 20);
////    [remebi setTitle:L(@"记住密码") forState:UIControlStateNormal];
////    [remebi setImage:[UIImage imageNamed:@"checkbox_reg_normal"] forState:UIControlStateSelected];
////    [remebi setImage:[UIImage imageNamed:@"checkbox_reg_pressed"] forState:UIControlStateNormal];
////    isremerb = YES;
////    [remebi setTitleColor:ThemeLightTextColor forState:UIControlStateNormal];
////    remebi.titleLabel.font = [UIFont systemFontOfSize:13];
////    [remebi addTarget:self action:@selector(remebi:) forControlEvents:UIControlEventTouchUpInside];
////    [contentView addSubview:remebi];
//
////    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
////    NSDictionary * userinfo = [userDefault objectForKey:@"usrNameandPass"];
////    if (!IsNilOrNull(userinfo)) {
////        _userNameTextFiled.text =  [userinfo valueForKey:@"username"];
////        _passwordTextFiled.text =  [userinfo valueForKey:@"password"];
////        remebi.selected = YES;
////    }
////
//
//
//    registertion = [UIButton buttonWithType:UIButtonTypeCustom];
//
//    [registertion setTitle:L(@"忘记密码?") forState:UIControlStateNormal];
//    [registertion setTitleColor:ThemeLightTextColor forState:UIControlStateNormal];
//    [registertion setTitleColor:TargetColor forState:UIControlStateNormal];
//    gtW1 = [registertion.titleLabel getTextWidth]+10;
//    registertion.frame = CGRectMake(SCREEN_WIDTH - gtW1-25, loginButton.bottom+10, gtW1, 30);
//    registertion.titleLabel.font = [UIFont systemFontOfSize:14];
//    [registertion addTarget:self action:@selector(forgotPwdButtonClick:) forControlEvents:UIControlEventTouchUpInside];
//    [contentView addSubview:registertion];
//
//    forgetButton = [UIButton buttonWithType:UIButtonTypeCustom];
//
//    [forgetButton setTitle:L(@"免费注册") forState:UIControlStateNormal];
//    [forgetButton setTitleColor:TargetColor forState:UIControlStateNormal];
//
//    forgetButton.frame = CGRectMake(SCREEN_WIDTH/2, SCREEN_HEIGHT-45, SCREEN_WIDTH/2, 45);
//    [forgetButton addTarget:self action:@selector(RegisterButtonClick:) forControlEvents:UIControlEventTouchUpInside];
//    [self.view addSubview:forgetButton];
//
//    mailButton = [UIButton buttonWithType:UIButtonTypeCustom];
//    [mailButton setTitle:@"短信登录" forState:UIControlStateNormal];
//    [mailButton setTitleColor:TargetColor forState:UIControlStateNormal];
//    mailButton.frame = CGRectMake(0, SCREEN_HEIGHT-45, SCREEN_WIDTH/2, 45);
//    [self.view addSubview:mailButton];
//    [mailButton addTarget:self action:@selector(sureBtnClick) forControlEvents:UIControlEventTouchUpInside];
//
//
//    forgetButton = [UIButton buttonWithType:UIButtonTypeCustom];
//
//    [forgetButton setTitle:L(@"免费注册") forState:UIControlStateNormal];
//    [forgetButton setTitleColor:TargetColor forState:UIControlStateNormal];
//
//    forgetButton.frame = CGRectMake(mailButton.right, mailButton.top, mailButton.width, mailButton.height);
//    [forgetButton addTarget:self action:@selector(RegisterButtonClick:) forControlEvents:UIControlEventTouchUpInside];
//    [self.view addSubview:forgetButton];
//
//
//    UILabel * back2 = [[UILabel alloc]initWithFrame:CGRectMake(0, mailButton.top, SCREEN_WIDTH, 0.5)];
//    back2.backgroundColor = TargetColor;
//    [self.view addSubview:back2];
//
//    UILabel * back1 = [[UILabel alloc]initWithFrame:CGRectMake(SCREEN_WIDTH/2, mailButton.top, 0.5, 45)];
//    back1.backgroundColor = TargetColor;
//    [self.view addSubview:back1];
//
//}
//-(void)sureBtnClick
//{
//    SmsCodeController * vc = [[SmsCodeController alloc]init];
//    [self pushVc:vc];
//}
//// auth code
//- (void)authCodeBtn{
//    [Util getAuthCodePictureWith:imageV];
//
//}
//
//
//
//-(void)remebi:(UIButton *)sender
//{
//    if (sender.selected == NO) {
//        sender.selected = YES;
//        isremerb = NO;
//    }else
//    {
//        sender.selected = NO;
//        isremerb = YES;
//    }
//}
//-(void)RegisterButtonClick:(UIButton *)sender
//{
//    RegisterViewController * vc = [[RegisterViewController alloc]init];
//    [self pushVc:vc];
//}
//-(void)forgotPwdButtonClick:(UIButton *)sender
//{
//    ForgetPwdViewController * vc = [[ForgetPwdViewController alloc]init];
//    [self pushVc:vc];
//
//}
//-(void)loginButtonClick:(UIButton *)sender
//{
//    [self.view endEditing:YES];
//
//    if (![Regular getcheckPhone:_userNameTextFiled.text ]) {
//        [self alertControllerTitle:@"手机号格式不正确"];
//
//    }else if (![Regular getLogInPassWord:_passwordTextFiled.text]){
//
//        [self alertControllerTitle:@"登录密码位数字字母大小写6-20位"];
//
//    }else{
//        [self.view showLoading];
//
//        loginButton.userInteractionEnabled = NO;
//
//        NSString * url;
//        if (isremerb == YES) {
//            NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
//            NSMutableDictionary * remDic = [[NSMutableDictionary alloc]initWithCapacity:0];
//            [remDic setObject:_userNameTextFiled.text forKey:@"username"];
//            [remDic setObject:_passwordTextFiled.text forKey:@"password"];
//            //登陆成功后把用户名存储到UserDefault
//            [userDefaults setObject:remDic forKey:@"usrNameandPass"];
//            [userDefaults synchronize];
//        }else
//        {
//            NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
//            [userDefaults removeObjectForKey:@"usrNameandPass"];
//        }
//
//        NSMutableDictionary * postDic = [[NSMutableDictionary alloc]initWithCapacity:3];
//        [self.psddDic setObject:@"loginAccount" forKey:@"serviceCode"];
//        [postDic setObject:self.psddDic forKey:@"Head"];
//        [self.param setObject:self.authCodeTextField.text forKey:@"imageCode"];
//        [self.param setObject:@"1" forKey:@"imageCodeLib"];
//        [self.param setObject:_passwordTextFiled.text forKey:@"pwd"];
//        [self.param setObject:_userNameTextFiled.text forKey:@"loginId"];
//
//        [self.BodyDic setObject:self.param forKey:@"param"];
//        [postDic setObject:self.BodyDic forKey:@"Body"];
//        url =    [self urldecode:postDic];
//        url = [NSString stringWithFormat:@"%@%@",MainUrl,url];
//        WS(ws);
//        [[HDNetworking sharedHDNetworking]  POST:url parameters:@"" success:^(id responseBody){
//            loginButton.userInteractionEnabled = YES;
//
//            ErrorModel * model = [ErrorModel mj_objectWithKeyValues:[responseBody valueForKey:@"Head"]];
//            if ([model.code isEqualToString:@"0000"]) {
//                NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
//                //登陆成功后把用户名存储到UserDefault
//                [userDefaults setObject:responseBody[@"Body"][@"data"][0] forKey:@"UserInfo"];
//                [userDefaults synchronize];
//
//                [ws.view showImageHUDText:@"登录成功"];
//                [ws.navigationController dismissViewControllerAnimated:YES completion:^{
//
//                }];
//            }else
//            {
////                [ws.view showImageHUDText:[NSString stringWithFormat:@"%@",model.msg]];
//                _backView.frame =  CGRectMake(0, 10, SCREEN_WIDTH, 280);
//                imageV.hidden = NO;
//                _authCodeTextField.hidden = NO;
//                passwordImageView1.hidden = NO;
//                remebi.frame = CGRectMake(25, _backView.bottom+5,75, 20);
//                loginButton.frame = CGRectMake(25, _backView.bottom+35, SCREEN_WIDTH - 50, 44);
//
//                forgetButton.frame = CGRectMake(SCREEN_WIDTH - gtW-25, loginButton.bottom+10, gtW, 30);
//                registertion.frame = CGRectMake(25, loginButton.bottom+10, gtW1, 30);
//                [ws authCodeTextField];
//                [self.view showImageHUDText:[NSString stringWithFormat:@"%@",model.msg]];
//
//            }
//        }failure:^(NSError * _Nonnull error) {
//            [ws authCodeTextField];
//            loginButton.userInteractionEnabled = YES;
//            [self.view showImageHUDText:@"请求失败"];
//
//        }];
//
//    }
//
//}
//- (void)didReceiveMemoryWarning {
//    [super didReceiveMemoryWarning];
//    // Dispose of any resources that can be recreated.
//}
//
///*
// #pragma mark - Navigation
//
// // In a storyboard-based application, you will often want to do a little preparation before navigation
// - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
// // Get the new view controller using [segue destinationViewController].
// // Pass the selected object to the new view controller.
// }
// */
//
//- (void)alertControllerTitle:(NSString *)str{
//
//    UIAlertController *alert = [UIAlertController alertControllerWithTitle:str message:nil preferredStyle:UIAlertControllerStyleAlert];
//    UIAlertAction *action = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleCancel handler:nil];
//    [alert addAction:action];
//    [self presentViewController:alert animated:YES completion:nil];
//
//}
//


@end

