//
//  PaiDanVC.m
//  linjinsuo
//
//  Created by mac on 2018/11/12.
//  Copyright © 2018年 admin. All rights reserved.
//

#import "PaiDanVC.h"
#import "PanDanListVC.h"

@interface PaiDanVC ()

@end

@implementation PaiDanVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.titleArray = @[@"11111",@"23343",@"8989",@"97979"];
    self.titles = @[@"1",@"2",@"3",@"4"];
    
    NSLog(@"%@",NSStringFromClass([self class]));
    
    self.menuViewStyle = WMMenuViewStyleLine;
    self.titleSizeSelected = 16;
    self.titleSizeNormal = 14;
    //
    self.progressViewIsNaughty = YES;
    self.progressWidth = 30;
    self.progressHeight = 2;
    self.titleColorNormal = ThemeTextColor;
    self.titleColorSelected = ThemesColor;
    //    self.preloadPolicy = WMPageControllerPreloadPolicyNever;
    //         self.menuBGColor = [UIColor whiteColor];
    self.showOnNavigationBar = NO;
    
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationController.navigationBar.barTintColor = [UIColor whiteColor];
}

//1、返回分页数量，可以再这里设置标题栏各种样式
- (NSInteger)numbersOfChildControllersInPageController:(WMPageController *)pageController {
    
    return 4;
}

//3、把标题与分页对应起来
- (NSString *)pageController:(WMPageController *)pageController titleAtIndex:(NSInteger)index {
    return _titleArray[index];
    
}

- (UIViewController *)pageController:(WMPageController *)pageController viewControllerAtIndex:(NSInteger)index {
    
    PanDanListVC * vc  = [[PanDanListVC alloc]init];
    vc.index = _indexArray[index];
    return vc;
    
}

- (CGFloat)menuView:(WMMenuView *)menu widthForItemAtIndex:(NSInteger)index {
    CGFloat width = [super menuView:menu widthForItemAtIndex:index];
    return width ;
}

- (CGRect)pageController:(WMPageController *)pageController preferredFrameForMenuView:(WMMenuView *)menuView {
    
    menuView.backgroundColor = [UIColor clearColor];
    //    CGFloat leftMargin = self.showOnNavigationBar ? 0 : 0;
    CGFloat originY = self.showOnNavigationBar ? 0 : CGRectGetMaxY(self.navigationController.navigationBar.frame);
    return CGRectMake(0, topHeight, self.view.frame.size.width, 44);
}

- (CGRect)pageController:(WMPageController *)pageController preferredFrameForContentView:(WMScrollView *)contentView {
    
    CGFloat originY = CGRectGetMaxY([self pageController:pageController preferredFrameForMenuView:self.menuView]);
    return CGRectMake(0, originY, self.view.frame.size.width, self.view.frame.size.height - originY);
    
}

- (CGFloat)getWidthWithTitle:(NSString *)title font:(UIFont *)font {
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 1000, 0)];
    label.text = title;
    label.font = font;
    [label sizeToFit];
    return label.frame.size.width;
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
