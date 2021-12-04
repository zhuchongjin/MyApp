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
#import "SingleVC.h"
#import "BigImgVVC.h"
#import "MyAlertView.h"
#import "PaiDanVC.h"
#import "SegmentViewController.h"
#import "LHUserDefaultViewController.h"
#import "ContactViewController.h"

#import "XLFormVC.h"
#import "XLImageVC.h"

#import "AutoLayoutOneVC.h"
#import "UIbuttonVC.h"

#import "ZJPickerView.h"
#import "UIColor+ZJ.h"


#import "CheckUpDateVC.h"
#import "RACViewController.h"

#import "PPMakerVC.h"
#import "MenuListVC.h"



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
    cell.textLabel.text = LHStringWithFormat(@"%ld %@",(long)indexPath.row,self.arrTitles[indexPath.row]);
    cell.imageView.transform = CGAffineTransformMakeScale(.6, .6);
    cell.imageView.image = LHIconImageInfoMake(self.arrImgs[indexPath.row], 35, LHRandomColor);
//    cell.separatorInset = UIEdgeInsetsMake(0.3f, 40.0f, 0.0f,0.0f);
    cell.textLabel.numberOfLines = 0;
    return cell;
}

//-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
//
//    return 50;
//}

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
        case 8:
            // UIview+tap
            vc = [[SingleVC alloc]init];
            [self pushVc:vc];
            
            break;
            
        case 9:
            // UIview+tap
            vc = [[BigImgVVC alloc]init];
            [self pushVc:vc];
            
            break;
        case 10:
            // UIview+tap
//            vc = [[PaiDanVC alloc]init];
//            vc.
            
            break;
            
        case 11:
            // UIview+tap
            vc = [[PaiDanVC alloc]init];
            if ([vc isKindOfClass:[UIViewController class]] == NO) return ;
            if (self.navigationController == nil) return ;
            if (vc.hidesBottomBarWhenPushed == NO) {
                vc.hidesBottomBarWhenPushed = YES;
            }
            
            [self.navigationController pushViewController:vc animated:YES];
            break;
        case 12:
            vc = [[SegmentViewController alloc]init];
            [self pushVc:vc];
            break;
            
        case 13:
            vc = [[LHUserDefaultViewController alloc]init];
            [self pushVc:vc];
            break;
            
        case 14:
            
            vc = [[XLFormVC alloc]init];
            if ([vc isKindOfClass:[UIViewController class]] == NO) return ;
            if (self.navigationController == nil) return ;
            if (vc.hidesBottomBarWhenPushed == NO) {
                vc.hidesBottomBarWhenPushed = YES;
            }
            
            [self.navigationController pushViewController:vc animated:YES];
            break;
            
        case 15:
            vc = [[XLImageVC alloc]init];
            [self pushVc:vc];
            break;
            
        case 16:
            vc = [[ContactViewController alloc]init];
            [self pushVc:vc];
            break;
            
        case 17:
            vc = [[AutoLayoutOneVC alloc]init];
            [self pushVc:vc];
            break;
            
        case 18:
            vc = [[UIbuttonVC alloc]init];
            [self pushVc:vc];
            break;
        // 选择器
        case 19:
            [self payTypePickViewArray];
            break;
        case 20:
            
            vc = [[PPMakerVC alloc]init];
            [self pushVc:vc];
            break;
        case 21:
            vc = [MenuListVC new];
            [self pushVc:vc];
            break;
        default:
            break;
    }
}

#pragma make -------- 初始化
- (NSArray *)arrTitles{
    if (!_arrTitles) {
        _arrTitles = @[@" IconFont的用法",@" shareView分享",@" 音声调节",@" 相机拍照剪裁,相册选择照片等",@" 提示框1",@" 提示框2",@" 二维码扫描扫描区域可调",@" UIview+tap 图片剪裁切割",@" 单选按钮实现",@" 图片点击放大缩小",@" 弹出框",@" 分段控制器",@" 分段控制自定义",@" LCUserDefaultsModel 代替简单UserDefault ",@" XLFrom布局",@" 仿今日头条图片浏览工具，支持下滑返回 ",@"获取通讯录联系人信息",@" AutoLayout进阶1",@" UIbutton图文排列上下左右",@"选择器",@"PPMaker快速创建UI链式创建" ,@"指定UI下拉列表"];
    }
    return _arrTitles;
}

- (void)payTypePickViewArray{
    
    NSArray *arr = @[@"支付宝",@"微信",@"银联支付",@"POS机支付"];
    [self initPayTypePickViewWithArray:arr];
}

- (void)initPayTypePickViewWithArray:(NSArray *)dataList{
    
    NSDictionary *propertyDict = @{ZJPickerViewPropertyCanceBtnTitleKey : @"取消",
                                   ZJPickerViewPropertySureBtnTitleKey  : @"确定",
                                   //                                    ZJPickerViewPropertyTipLabelTextKey  : [_selectContentLabel.text substringFromIndex:5], // @"提示内容"
                                   ZJPickerViewPropertyCanceBtnTitleColorKey : [UIColor zj_colorWithHexString:@"#A9A9A9"],
                                   ZJPickerViewPropertySureBtnTitleColorKey : [UIColor zj_colorWithHexString:@"#FF6347"],
                                   ZJPickerViewPropertyTipLabelTextColorKey : [UIColor zj_colorWithHexString:@"#231F20"],
                                   ZJPickerViewPropertyLineViewBackgroundColorKey : [UIColor zj_colorWithHexString:@"#dedede"],
                                   ZJPickerViewPropertyCanceBtnTitleFontKey : [UIFont systemFontOfSize:17.0f],
                                   ZJPickerViewPropertySureBtnTitleFontKey : [UIFont systemFontOfSize:17.0f],
                                   ZJPickerViewPropertyTipLabelTextFontKey : [UIFont systemFontOfSize:17.0f],
                                   ZJPickerViewPropertyPickerViewHeightKey : @250.0f,
                                   ZJPickerViewPropertyOneComponentRowHeightKey : @40.0f,
                                   ZJPickerViewPropertySelectRowTitleAttrKey : @{NSForegroundColorAttributeName : [UIColor zj_colorWithHexString:@"#FF6347"], NSFontAttributeName : [UIFont systemFontOfSize:20.0f]},
                                   ZJPickerViewPropertyUnSelectRowTitleAttrKey : @{NSForegroundColorAttributeName : [UIColor zj_colorWithHexString:@"#A9A9A9"], NSFontAttributeName : [UIFont systemFontOfSize:20.0f]},
                                   ZJPickerViewPropertySelectRowLineBackgroundColorKey : [UIColor zj_colorWithHexString:@"#dedede"],
                                   ZJPickerViewPropertyIsTouchBackgroundHideKey : @YES,
                                   ZJPickerViewPropertyIsShowSelectContentKey : @YES,
                                   ZJPickerViewPropertyIsScrollToSelectedRowKey: @YES,
                                   ZJPickerViewPropertyIsAnimationShowKey : @YES};
    
    [ZJPickerView zj_showWithDataList:dataList propertyDict:propertyDict completion:^(NSString * _Nullable selectContent) {
        
        
        NSInteger index = [dataList indexOfObject:selectContent];
         NSLog(@"%@",selectContent);
         NSLog(@"%ld",(long)index);
  

    }];
    
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
    
    //  高度自适应   也可以混着用
    tableView.estimatedRowHeight = 250;//预估高度
    tableView.rowHeight = UITableViewAutomaticDimension;
    
    [self.view addSubview:tableView];
    self.tableView = tableView;
    
}
- (NSArray *)arrImgs{
    if (!_arrImgs) {
        _arrImgs = @[@"\U0000e60f",@"\U0000e684",@"\U0000e61f",@"\U0000e62c",@"\U0000e652",@"\U0000e612",@"\U0000e602",@"\U0000e7a6",@"\U0000e60a",@"\U0000e652",@"\U0000e61f",@"\U0000e6a7",@"\U0000e684",@"\U0000e62c",@"\U0000e68d",@"\U0000e620",@"\U0000e604",@"\U0000e757",@"\U0000e62e",@"\U0000e62e",@"\U0000e600",@"\U0000e60d",@"\U0000e64b",@"\U0000e60f",@"\U0000e624",@"\U0000e605",@"\U0000e657",@"\U0000e60f",@"\U0000e684",@"\U0000e61f",@"\U0000e62c",@"\U0000e652",@"\U0000e612",@"\U0000e602",@"\U0000e7a6",@"\U0000e60a",@"\U0000e652",@"\U0000e61f",@"\U0000e6a7",@"\U0000e684",@"\U0000e62c",@"\U0000e68d",@"\U0000e620",@"\U0000e604",@"\U0000e757",@"\U0000e62e",@"\U0000e62e",@"\U0000e600",@"\U0000e60d",@"\U0000e64b",@"\U0000e60f",@"\U0000e624",@"\U0000e605",@"\U0000e657",@"\U0000e60f",@"\U0000e684",@"\U0000e61f",@"\U0000e62c",@"\U0000e652",@"\U0000e612",@"\U0000e602",@"\U0000e7a6",@"\U0000e60a",@"\U0000e652",@"\U0000e61f",@"\U0000e6a7",@"\U0000e684",@"\U0000e62c",@"\U0000e68d",@"\U0000e620",@"\U0000e604",@"\U0000e757",@"\U0000e62e",@"\U0000e62e",@"\U0000e600",@"\U0000e60d",@"\U0000e64b",@"\U0000e60f",@"\U0000e624",@"\U0000e605",@"\U0000e657",@"\U0000e60f",@"\U0000e684",@"\U0000e61f",@"\U0000e62c",@"\U0000e652",@"\U0000e612",@"\U0000e602",@"\U0000e7a6",@"\U0000e60a",@"\U0000e652",@"\U0000e61f",@"\U0000e6a7",@"\U0000e684",@"\U0000e62c",@"\U0000e68d",@"\U0000e620",@"\U0000e604",@"\U0000e757",@"\U0000e62e",@"\U0000e62e",@"\U0000e600",@"\U0000e60d",@"\U0000e64b",@"\U0000e60f",@"\U0000e624",@"\U0000e605",@"\U0000e657"];
    }
    return _arrImgs;
}

@end
