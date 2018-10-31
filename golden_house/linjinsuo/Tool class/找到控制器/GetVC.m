//
//  GetVC.m
//  TongChengCTMS
//
//  Created by mac on 2018/10/30.
//  Copyright © 2018年 刘帅. All rights reserved.
//

#import "GetVC.h"

@implementation GetVC
+ (UIViewController *)getCurrentVC
{
     UIViewController *rootViewController = [UIApplication sharedApplication].keyWindow.rootViewController;
     
     UIViewController *currentVC = [GetVC getCurrentVCFrom:rootViewController];
     
     return currentVC;
}

+ (UIViewController *)getCurrentVCFrom:(UIViewController *)rootVC
{
     UIViewController *currentVC;
     
     if ([rootVC presentedViewController]) {
          // 视图是被presented出来的
          
          rootVC = [rootVC presentedViewController];
     }
     
     if ([rootVC isKindOfClass:[UITabBarController class]]) {
          // 根视图为UITabBarController
          
          currentVC = [self getCurrentVCFrom:[(UITabBarController *)rootVC selectedViewController]];
          
     } else if ([rootVC isKindOfClass:[UINavigationController class]]){
          // 根视图为UINavigationController
          
          currentVC = [self getCurrentVCFrom:[(UINavigationController *)rootVC visibleViewController]];
          
     } else {
          // 根视图为非导航类
          
          currentVC = rootVC;
     }
     
     return currentVC;
}
@end
