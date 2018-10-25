//
//  BaseViewController.h
//  linjinsuo
//
//  Created by admin on 2018/3/6.
//  Copyright © 2018年 admin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseViewController : UIViewController
@property(strong,nonatomic)   UIImageView * image;
@property(strong,nonatomic)   UILabel * label;
@property(strong,nonatomic)   UIButton *BackleftButton;
@property(strong,nonatomic)   UIButton * massageButton;
@property(strong,nonatomic) NSMutableDictionary * psddDic;
@property(strong,nonatomic) NSMutableDictionary * BodyDic;
@property(strong,nonatomic) NSMutableDictionary * param;
#pragma mark - 设置顶部标题
- (void)setTitleName:(NSString *)title;
#pragma mark - 设置左上角返回功能按钮
- (void)setBackLeftButton:(NSString *)imageName;
#pragma mark - 设置左上角定制功能按钮
- (void)setLeftButton:(NSString *)imageName title:(NSString *)name;
#pragma mark - 设置左图标
- (void)setLeftImage;
#pragma mark - 设置右上角图文按钮
-(void)setRightImage:(NSString *)text image:(NSString * )imageName;
-(void)setTopLabel;
#pragma mark - 设置右上角图片按钮
- (void)setRightButton:(NSString *)imageName;
#pragma mark - 右图标按钮点击方法
-(void)Rightbuttonclick:(UIButton *)sender;
#pragma mark - 右图文按钮点击方法
- (void)RightTextClick:(UIButton *)sender;
#pragma mark - 设置左上角定制功能按钮点击方法
- (void)LeftClick:(UIButton *)sender;
#pragma mark - 返回上一页
- (void)pop;
#pragma mark - 延时返回上一页
- (void)popdelay;
#pragma mark ----- 延时返回指定页面
- (void)popdelayToVc:(UIViewController *)vc;
#pragma mark - 返回父类页面
- (void)popToRootVc;
#pragma mark - 返回某一特定页面
- (void)popToVc:(UIViewController *)vc;
//- (void)keyBoardHide;


-(void)showLoginWindow;
- (void)pushVc:(UIViewController *)vc;
-(NSString *)urldecode:(NSMutableDictionary *) input;
-(BOOL)isLogin;

// clear users
- (void)clearAllUserDefaultsData;


@end
