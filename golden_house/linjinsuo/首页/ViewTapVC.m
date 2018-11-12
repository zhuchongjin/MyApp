//
//  ViewTapVC.m
//  linjinsuo
//
//  Created by mac on 2018/10/25.
//  Copyright © 2018年 admin. All rights reserved.
//

#import "ViewTapVC.h"
#import "UIImage+HDExtension.h"  // 图片处理


@interface ViewTapVC ()
@property (nonatomic,strong)UILabel *lab;
@property (nonatomic,strong)UIImageView *imgV;

@end

@implementation ViewTapVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setTitleName:@"UIvie+Tap"];
    [self setBackLeftButton:@""];
    
    
    
 
    
    // UIView+tap 实例
    [self.view addSubview:self.lab];
    [self.lab setTapActionWithBlock:^{
       
        [UIView addMJNotifierWithText:@"label tap 事件" dismissAutomatically:YES];

    }];
    
    // UIIimageView 剪裁实例 更多见文件    AppIcon
    [self.view addSubview:self.imgV];
    self.imgV.image = [UIImage hd_captureCircleImageWithImage:[UIImage imageNamed:@"AppIcon"] andBorderWith:0.5 andBorderColor:LHRedColor];
    
//    self.imgV.userInteractionEnabled = YES;
    [self.imgV setTapActionWithBlock:^{
        [UIView addMJNotifierWithText:@"UIimageView 裁剪点击 事件" dismissAutomatically:YES];

    }];
    
}

// 导入 UIView + TAp 使用
- (UILabel *)lab{
    
    if (!_lab) {
        _lab = [UILabel labelWithFrame:CGRectMake(100, 200, 200, 50) backgroundColor:LHGrayColor borderColor:nil cornerRadius:0 font:LHTitleFont15 textColor:LHBlackColor textAlignment:NSTextAlignmentCenter text:@"label点击事件"];
    }
    return _lab;
}
- (UIImageView *)imgV{
    
    if (!_imgV) {
        _imgV = [UIImageView imageViewWithFrame:CGRectMake(100, 300, 100, 100) backgroundColor:LHGrayColor borderColor:LHRedColor cornerRadius:0 image:[UIImage imageNamed:@""] contentMode:@(1)];
    }
    return _imgV;
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
