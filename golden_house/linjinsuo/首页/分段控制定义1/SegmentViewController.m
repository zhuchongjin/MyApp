//
//  SegmentViewController.m
//  linjinsuo
//
//  Created by mac on 2018/11/12.
//  Copyright © 2018年 admin. All rights reserved.
//

#import "SegmentViewController.h"
/**
 第1步:将 YJSegmentedControl 文件拖入工程
 第2步:引入头文件 YJSegmentedControl.h
 */
#import "YJSegmentedControl.h"

@interface SegmentViewController () <YJSegmentedControlDelegate>

@end

@implementation SegmentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setTitleName:@"分段控制自定义-不可左右滑动"];

    [self setBackLeftButton:@""];
     [self createUISegmentedControl];
}



- (void)createUISegmentedControl{
    // **********************  样式1 *******************************
    //  第3步  创建需要的选择器
    NSArray * btnDataSource = @[@"未付款", @"已付款", @"待收货"];
    
    //  第4部  调用创建
    YJSegmentedControl * segment = [YJSegmentedControl segmentedControlFrame:CGRectMake(0,topHeight, self.view.bounds.size.width, 44) titleDataSource:btnDataSource backgroundColor:[UIColor colorWithRed:253.0f/255 green:239.0f/255 blue:230.0f/255 alpha:1.0f] titleColor:[UIColor grayColor] titleFont:[UIFont fontWithName:@".Helvetica Neue Interface" size:16.0f] selectColor:[UIColor orangeColor] buttonDownColor:[UIColor redColor] Delegate:self];
    // 第5步 添加到试图上
    [self.view addSubview:segment];
    
    
    /************************* 样式2 ***************************
     *  样式2
     */
    NSArray * btnDataSource2 = @[@"未付款", @"已付款", @"待发货", @"待收货"];
    YJSegmentedControl * segment2 = [YJSegmentedControl segmentedControlFrame:CGRectMake(0, CGRectGetMaxY(segment.frame) + 100, self.view.bounds.size.width, 44) titleDataSource:btnDataSource2 backgroundColor:[UIColor lightGrayColor] titleColor:[UIColor whiteColor] titleFont:[UIFont fontWithName:@".Helvetica Neue Interface" size:16.0f] selectColor:[UIColor redColor] buttonDownColor:[UIColor orangeColor] Delegate:self];
    [self.view addSubview:segment2];
    
    /************************* 样式3 ***************************
     *  样式2
     */
    NSArray * btnDataSource3 = @[@"未付款", @"已付款", @"待发货", @"待收货", @"退款"];
    YJSegmentedControl * segment3 = [YJSegmentedControl segmentedControlFrame:CGRectMake(0, CGRectGetMaxY(segment2.frame) + 100, self.view.bounds.size.width, 44) titleDataSource:btnDataSource3 backgroundColor:[UIColor whiteColor] titleColor:[UIColor grayColor] titleFont:[UIFont fontWithName:@".Helvetica Neue Interface" size:16.0f] selectColor:[UIColor orangeColor] buttonDownColor:[UIColor redColor] Delegate:self];
    [self.view addSubview:segment3];
    
    
    
}

#pragma mark -- 遵守代理 实现代理方法
- (void)segumentSelectionChange:(NSInteger)selection{
    if (selection == 0) {
        NSLog(@"新动态");
    }else if (selection == 1){
        NSLog(@"朋友圈");
    }else{
        NSLog(@"iOS教程");
    }
    
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
