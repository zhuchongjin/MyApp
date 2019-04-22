//
//  CheckUpDateVC.m
//  linjinsuo
//
//  Created by mac on 2019/4/1.
//  Copyright © 2019年 admin. All rights reserved.
//

#import "CheckUpDateVC.h"
#import <HSUpdateApp.h>

@interface CheckUpDateVC ()

@end

@implementation CheckUpDateVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self setTitleName:@"iOS检测更新"];
    [self setBackLeftButton:@""];
}
- (IBAction)btnAction:(UIButton *)sender {
    
//    //=================根据appid检测====================
//    [HSUpdateApp hs_updateWithAPPID:@"1104867082" withBundleId:nil block:^(NSString *currentVersion, NSString *storeVersion, NSString *openUrl, BOOL isUpdate) {
//        if (isUpdate) {
////            [self showAlertViewTitle:@"APPID检测" subTitle:[NSString stringWithFormat:@"检测到新版本%@,是否更新？",storeVersion] openUrl:openUrl];
//        }else{
//            NSLog(@"当前版本%@,商店版本%@，不需要更新",currentVersion,storeVersion);
//        }
//
//    }];
    
    [HSUpdateApp hs_updateWithAPPID:@"" block:^(NSString *currentVersion, NSString *storeVersion, NSString *openUrl, BOOL isUpdate) {
        
    }];
    
  
    
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
