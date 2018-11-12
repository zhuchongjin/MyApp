//
//  LHUserDefaultViewController.m
//  linjinsuo
//
//  Created by mac on 2018/11/12.
//  Copyright © 2018年 admin. All rights reserved.
//

#import "LHUserDefaultViewController.h"
#import "LCUserDefaultsModel.h"

@interface LHUserDefaultViewController ()

@end

@implementation LHUserDefaultViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    
    [self setTitleName:@"LCUserDefaultsModel 代替简单UserDefault "];
    [self setBackLeftButton:@""];
    
    
    
    // 使用此方法  model https://www.jianshu.com/p/681ef055f716
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    // Init
    LCUserDefaultsModel *userDefaultsModel = [LCUserDefaultsModel userDefaultsModel];
    
    NSLog(@"name = %@", userDefaultsModel.name);
    userDefaultsModel.name = @"Near1sssss";
    NSLog(@"gender = %ld", (long)userDefaultsModel.gender);
    userDefaultsModel.gender += 1;
    NSLog(@"age = %ld", userDefaultsModel.age);
    userDefaultsModel.age += 1;
    NSLog(@"floatNumber = %f", userDefaultsModel.floatNumber);
    userDefaultsModel.floatNumber += 1;
    NSLog(@"doubleNumber = %f", userDefaultsModel.doubleNumber);
    userDefaultsModel.doubleNumber += 1;
    
    NSLog(@"isMan = %d", userDefaultsModel.isMan);
    userDefaultsModel.isMan = !userDefaultsModel.isMan;
    
    NSLog(@"isMan = %d", userDefaultsModel.isMan);
    userDefaultsModel.age  = 44447;
    NSLog(@"userDefaultsModel.age = %d", userDefaultsModel.age);

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
