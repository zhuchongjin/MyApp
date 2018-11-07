//
//  SingleVC.m
//  linjinsuo
//
//  Created by mac on 2018/11/2.
//  Copyright © 2018年 admin. All rights reserved.
//

#import "SingleVC.h"
#import "RadioButton.h"
#import "GZFRadioCheckBox.h"

@interface SingleVC ()

@end

@implementation SingleVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setTitleName:@"单选按钮"];
    [self setBackLeftButton:@""];
    
    
//
//    NSMutableArray* buttonsArray = [NSMutableArray arrayWithCapacity:3];
//    CGRect btnRect = CGRectMake(50, 320, 100, 30);
//    for (NSString* optionTitle in @[@"Red", @"Green", @"Blue"]) {
//        RadioButton* btn = [[RadioButton alloc] initWithFrame:btnRect];
//        [btn addTarget:self action:@selector(onRadioButtonValueChanged:) forControlEvents:UIControlEventValueChanged];
//        btnRect.origin.x += 110;
//        [btn setTitle:optionTitle forState:UIControlStateNormal];
//        [btn setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
//        btn.titleLabel.font = [UIFont boldSystemFontOfSize:17];
//        [btn setImage:[UIImage imageNamed:@"checkbox_reg_normal"] forState:UIControlStateNormal];
//        [btn setImage:[UIImage imageNamed:@"checkbox_reg_pressed"] forState:UIControlStateSelected];
//        btn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
//        btn.titleEdgeInsets = UIEdgeInsetsMake(0, 6, 0, 0);
//        [self.view addSubview:btn];
//        [buttonsArray addObject:btn];
//    }
//
//    [buttonsArray[0] setGroupButtons:buttonsArray]; // 把按钮放进群组中
//
//    [buttonsArray[0] setSelected:YES]; // 初始化第一个按钮为选中状态
//
    
    
    // 横向显示
    GZFRadioCheckBox *radioCheckBox = [[GZFRadioCheckBox alloc] initWithFrame:CGRectMake(20, 50, 320, 22)];
    radioCheckBox.isHorizontal = YES; //默认
    radioCheckBox.spacing = 50; //默认 10
    radioCheckBox.index = 0; // 默认 0
    radioCheckBox.showTextColor = [UIColor redColor];
    radioCheckBox.showTextFont = [UIFont systemFontOfSize:14];
    // 可选项，需保持和showTextArray 一致
    radioCheckBox.hideTextArray = [NSArray arrayWithObjects:@"1",@"2",@"3",@"4", nil];
    radioCheckBox.showTextArray = [NSArray arrayWithObjects:@"radio1",@"radio2",@"radio3",@"radio4", nil];
    [radioCheckBox radioCheckBoxClick:^(NSUInteger index, NSString *showText, NSString *hideText) {
        
        NSLog(@"index----->%d------>%@------>%@",index,showText,hideText);
    }];
    
    [self.view addSubview:radioCheckBox];
    
    // 纵向显示
    
    GZFRadioCheckBox *radioCheckBox2 = [[GZFRadioCheckBox alloc] initWithFrame:CGRectMake(20, 120, 22, 222)];
    radioCheckBox2.isHorizontal = NO; //默认
    radioCheckBox2.spacing = 20; //默认 10
    radioCheckBox2.index = 1;
    // 可选项，需保持和showTextArray 一致
    radioCheckBox2.hideTextArray = [NSArray arrayWithObjects:@"1",@"2",@"3",@"4", nil];
    radioCheckBox2.showTextArray = [NSArray arrayWithObjects:@"radio11",@"radio22",@"radio33",@"radio44", nil];
    [radioCheckBox2 radioCheckBoxClick:^(NSUInteger index, NSString *showText, NSString *hideText) {
        
        NSLog(@"index----->%d------>%@------>%@",index,showText,hideText);
    }];
    
    [self.view addSubview:radioCheckBox2];
    
    
}

//- (void)onRadioButtonValueChanged:(UIButton *)sender{
//
//    NSLog(@"++++++++%@",[NSString stringWithFormat:@"%@",sender.titleLabel.text]);
//}

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
