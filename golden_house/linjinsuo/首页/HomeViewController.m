//
//  HomeViewController.m
//  linjinsuo
//
//  Created by admin on 2018/3/7.
//  Copyright © 2018年 admin. All rights reserved.
//

#import "HomeViewController.h"
#import "ECShareView.h"

#import "VolumeChangeVC.h"
#import "CameraVC.h"
#import "LWQRCodeViewController.h"
#import "ViewTapVC.h"

@interface HomeViewController ()<UITableViewDelegate,UITableViewDataSource,NoDataViewTouchDelegate>
{

}

@property (strong, nonatomic) UITableView *tableView;
@property (nonatomic,copy)NSArray *arrImgs;
@property (nonatomic,copy)NSArray *arrTitles;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setTitleName:@"控件"];

    [self createTableView];
}



- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return self.arrTitles.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *MeViewCellId = @"cellId";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:MeViewCellId];
    if (cell ==nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:MeViewCellId];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.contentMode = UITableViewCellAccessoryNone;
        
    }
    cell.textLabel.text = self.arrTitles[indexPath.row];
    cell.imageView.transform = CGAffineTransformMakeScale(.6, .6);
    cell.imageView.image = LHIconImageInfoMake(self.arrImgs[indexPath.row], 35, LHRandomColor);
//    cell.separatorInset = UIEdgeInsetsMake(0.3f, 40.0f, 0.0f,0.0f);
    
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 50;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UIViewController *vc;
    switch (indexPath.row) {
        case 0:
            //IconFont的用法
            [self iconFontUse];
            break;
        case 1:
            //分享
            [self shareView];
            break;
        case 2:
            //音声调节
            vc = [[VolumeChangeVC alloc]init];
            [self pushVc:vc];
            break;
        case 3:
            //相机拍照剪裁
            vc = [[CameraVC alloc]init];
            [self pushVc:vc];
            break;
        case 4:
  
            [self.view showImageHUDText:@"加载。。。。"];
            break;
        case 5:
            [UIView addMJNotifierWithText:@"需要导入UIView+MJAlertView.h" dismissAutomatically:YES];
            break;
        case 6:
            // 二维码扫描扫描区域可调 LWQRCodeViewController
            vc = [[LWQRCodeViewController alloc]init];
            [self pushVc:vc];
            break;
        case 7:
            // UIview+tap
            vc = [[ViewTapVC alloc]init];
            [self pushVc:vc];

            break;
            
        default:
            break;
    }
}

#pragma make -------- 初始化
- (NSArray *)arrTitles{
    if (!_arrTitles) {
        _arrTitles = @[@"0 IconFont的用法",@"1 shareView分享",@"2 音声调节",@"3 相机拍照剪裁",@"4 提示框1",@"5 提示框2",@"6 二维码扫描扫描区域可调",@"7 UIview+tap 图片剪裁切割"];
    }
    return _arrTitles;
}
- (NSArray *)arrImgs{
    if (!_arrImgs) {
        _arrImgs = @[@"\U0000e60f",@"\U0000e684",@"\U0000e61f",@"\U0000e62c",@"\U0000e652",@"\U0000e612",@"\U0000e602",@"\U0000e7a6",@"\U0000e60a",@"\U0000e652",@"\U0000e61f",@"\U0000e6a7",@"\U0000e684",@"\U0000e62c",@"\U0000e68d",@"\U0000e620",@"\U0000e604",@"\U0000e757",@"\U0000e62e",@"\U0000e62e",@"\U0000e600",@"\U0000e60d",@"\U0000e64b",@"\U0000e60f",@"\U0000e624",@"\U0000e605",@"\U0000e657"];
    }
    return _arrImgs;
}




#pragma make --------btnAttion

/**
 分享
 */
- (void)shareView{
    NSLog(@"分享 ");
    
    // pod中的简化模式 sdk
    
    NSString * shareurl;
    WS(ws);
    shareurl =  @"www.baidu.com";
    ECShareView *share = [ECShareView shareViewWithType:ECShareViewTypeDontShowCopyAndCollect hasRepinFlag:false];
    [share showInView:self.view];
    [share setUpItemClickHandle:^(ECShareView *shareView, NSString *title, NSInteger index, NSInteger shareType) {
        
        if (shareType == 5) {
            UIPasteboard *pasteboard = [UIPasteboard generalPasteboard];
            pasteboard.string = shareurl;
            [self.view showImageHUDText:@"复制成功"];
        }else
        {
            [[ShareManager sharedManager] shareWithSharedType:shareType title:@"app名字" image:@"APPicon" url:shareurl content:@"分享了" controller:ws];
        }
    }];
    
    
}
/**
 IconFont的用法
 */
- (void)iconFontUse{
   // http://www.iconfont.cn/manage/index?spm=a313x.7781069.1998910419.db775f1f3&manage_type=myprojects&projectId=884401&keyword=
    // 配合Pch tool中的文件以及
    NSLog(@"IconFont的用法");
}



- (void)createTableView{
    
    
    //    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-49) style:UITableViewStyleGrouped];
    //    self.tableView.separatorInset = UIEdgeInsetsMake(0, 0, 0, 0);
    //    self.tableView.estimatedRowHeight = 0;
    //    self.tableView.estimatedSectionHeaderHeight = 0;
    //    self.tableView.estimatedSectionFooterHeight = 0;
    //    [self.view addSubview:self.tableView];
    //    self.tableView.delegate = self;
    //    self.tableView.dataSource = self;
    //    self.tableView.backgroundColor = LHRandomColor;
    //
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, topHeight, SCREEN_WIDTH, SCREEN_HEIGHT-SafeAreaBottomHeight-topHeight) style:UITableViewStylePlain];
    tableView.dataSource = self;
    tableView.delegate = self;
    //        if (@available(iOS 11.0, *)) {
    //            tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    //        } else {
    //            // Fallback on earlier versions
    //        }
    
    
    tableView.backgroundColor = LHBackgroundColor;
    tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    [tableView setSeparatorInset:UIEdgeInsetsMake(0,15,0,15)];
    if (DeviceSystemVersion.doubleValue >= 11.0) {
        tableView.estimatedRowHeight = 0;
        tableView.estimatedSectionHeaderHeight = 0;
        tableView.estimatedSectionFooterHeight = 0;
    }
    [self.tableView setSeparatorColor:LHBackgroundColor];
    tableView.contentInset = UIEdgeInsetsMake(0, 0, 85+SafeAreaBottomHeight, 0);
    tableView.scrollIndicatorInsets = UIEdgeInsetsMake(topHeight, 0, 85+SafeAreaBottomHeight, 0);
    tableView.tableFooterView = [[UIView alloc]initWithFrame:CGRectZero];
    [self.view addSubview:tableView];
    self.tableView = tableView;
    
}

@end
