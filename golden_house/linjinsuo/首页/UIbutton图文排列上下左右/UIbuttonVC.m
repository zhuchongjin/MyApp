//
//  UIbuttonVC.m
//  linjinsuo
//
//  Created by mac on 2019/3/4.
//  Copyright © 2019年 admin. All rights reserved.
//

#import "UIbuttonVC.h"
#import "MMButton.h"

@interface UIbuttonVC ()
@property (nonatomic,strong)  MMButton*btn1;
@property (nonatomic,strong)  MMButton*btn2;
@property (nonatomic,strong)  MMButton*btn3;
@property (nonatomic,strong)  MMButton*btn4;



@end

@implementation UIbuttonVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //UIbutton图文排列上下左右
    
    [self setTitleName:@"UIbutton图文排列上下左右"];
    [self setBackLeftButton:@""];
    
    
    [self.view addSubview:self.btn1];
    [self.view addSubview:self.btn2];
    [self.view addSubview:self.btn3];
    [self.view addSubview:self.btn4];
    
    

}

- (MMButton *)btn1
{
    if (!_btn1)
    {
        _btn1 = [MMButton buttonWithType:UIButtonTypeCustom];
        [_btn1 setBackgroundColor:[UIColor lightGrayColor]];
        [_btn1 setImage:[UIImage imageNamed:@"ic_tabbar_home_pressed"] forState:UIControlStateNormal];
        [_btn1 setTitle:@"快来按我" forState:UIControlStateNormal];
        _btn1.frame = CGRectMake(0, 10, 100,100);
        _btn1.center = self.view.center;
        [_btn1 addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
        [_btn1 setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [_btn1.titleLabel setFont:[UIFont systemFontOfSize:16]];
        _btn1.imageAlignment = MMImageAlignmentTop;
        _btn1.spaceBetweenTitleAndImage = 4;
        
    }
    return _btn1;
}

- (MMButton *)btn2
{
    if (!_btn2)
    {
        _btn2 = [MMButton buttonWithType:UIButtonTypeCustom];
        [_btn2 setBackgroundColor:[UIColor lightGrayColor]];
        [_btn2 setImage:[UIImage imageNamed:@"com"] forState:UIControlStateNormal];
        [_btn2 setTitle:@"快来按我" forState:UIControlStateNormal];
        _btn2.frame = CGRectMake(0, topHeight, 200,200);
        
        [_btn2 addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
        [_btn2 setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [_btn2.titleLabel setFont:[UIFont systemFontOfSize:16]];
        _btn2.imageAlignment = MMImageAlignmentTop;
        _btn2.spaceBetweenTitleAndImage = 4;
        
    }
    return _btn2;
}

- (void)btnAction:(UIButton *)sender{
    
    
    
    [UIView addMJNotifierWithText:@"" dismissAutomatically:YES];
//    [CJAlert showStringDismissWithDelay:@"weweddw"];

    
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
