//
//  AssetsTableViewDelegate.m
//  linjinsuo
//
//  Created by mac on 2018/11/1.
//  Copyright © 2018年 admin. All rights reserved.
//

#import "AssetsTableViewDelegate.h"
#import "GetVC.h"
#import "ECShareView.h"
#import "VolumeChangeVC.h"
#import "CameraVC.h"
#import "LWQRCodeViewController.h"
#import "ViewTapVC.h"
@implementation AssetsTableViewDelegate

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
//            [self pushVc:vc];
            break;
        case 3:
            //相机拍照剪裁
            vc = [[CameraVC alloc]init];
//            [self pushVc:vc];
            break;
        case 4:
            
            [UIView addMJNotifierWithText:@"加载中。。。" dismissAutomatically:YES];
            break;
        case 5:
            [UIView addMJNotifierWithText:@"需要导入UIView+MJAlertView.h" dismissAutomatically:YES];
            break;
        case 6:
            // 二维码扫描扫描区域可调 LWQRCodeViewController
            vc = [[LWQRCodeViewController alloc]init];
//            [self pushVc:vc];
            break;
        case 7:
            // UIview+tap
            vc = [[ViewTapVC alloc]init];
//            [self pushVc:vc];
            
            break;
            
        default:
            break;
       
    }
    
    
    if (vc.hidesBottomBarWhenPushed == NO) {
        vc.hidesBottomBarWhenPushed = YES;
    }
    [[GetVC getCurrentVC].navigationController pushViewController:vc animated:YES];
}

#pragma make --------btnAttion

/**
 分享
 */
- (void)shareView{
    NSLog(@"分享 ");
    
    // pod中的简化模式 sdk
    
//    NSString * shareurl;
//    WS(ws);
//    shareurl =  @"www.baidu.com";
//    ECShareView *share = [ECShareView shareViewWithType:ECShareViewTypeDontShowCopyAndCollect hasRepinFlag:false];
//    [share showInView:self.view];
//    [share setUpItemClickHandle:^(ECShareView *shareView, NSString *title, NSInteger index, NSInteger shareType) {
//
//        if (shareType == 5) {
//            UIPasteboard *pasteboard = [UIPasteboard generalPasteboard];
//            pasteboard.string = shareurl;
//            [self.view showImageHUDText:@"复制成功"];
//        }else
//        {
//            [[ShareManager sharedManager] shareWithSharedType:shareType title:@"app名字" image:@"APPicon" url:shareurl content:@"分享了" controller:ws];
//        }
//    }];
    
    
}
/**
 IconFont的用法
 */
- (void)iconFontUse{
    // http://www.iconfont.cn/manage/index?spm=a313x.7781069.1998910419.db775f1f3&manage_type=myprojects&projectId=884401&keyword=
    // 配合Pch tool中的文件以及
    NSLog(@"IconFont的用法");
}


@end
