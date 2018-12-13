//
//  AppDelegate.m
//  linjinsuo
//
//  Created by admin on 2018/3/6.
//  Copyright © 2018年 admin. All rights reserved.
//

#import "AppDelegate.h"
#import "RootViewController.h"
#import "JMGuidViewController.h"
#import <Bugly/Bugly.h>
#import "TBCityIconFont.h"
@interface AppDelegate ()<BuglyDelegate>

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    [TBCityIconFont setFontName:@"iconfont"];    //iconFont
    
    
    // bug 崩溃统计分析
    
    BuglyConfig *config = [[BuglyConfig alloc] init];
    config.unexpectedTerminatingDetectionEnable = YES; //非正常退出事件记录开关，默认关闭
    config.reportLogLevel = BuglyLogLevelWarn; //报告级别
    config.deviceIdentifier = [UIDevice currentDevice].identifierForVendor.UUIDString; //设备标识
    config.blockMonitorEnable = YES; //开启卡顿监控
    config.blockMonitorTimeout = 2.5; //卡顿监控判断间隔，单位为秒
    config.delegate = self;
    
    [Bugly startWithAppId:@"c0971417b4"];
    
    [self umengShare];
    if ([self isFirstOpen]) {

        JMGuidViewController *gdView = [[JMGuidViewController alloc] init];
        self.window.rootViewController = gdView;
        [self.window makeKeyAndVisible];
    }
    else{
        RootViewController *tabBarCtrl = [[RootViewController alloc]init];
        self.window.rootViewController = tabBarCtrl;
        [self.window makeKeyAndVisible];
    }
//    [self checkUpdate];
    
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(comeHome:) name:@"UIApplicationDidEnterBackgroundNotification" object:nil];
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(applicationWillTerminate:) name:@"UIApplicationDidEnterBackgroundNotification" object:nil];

    // Override point for customization after application launch.
    return YES;
}

//#pragma mark - BuglyDelegate
//此方法返回的数据，可在bugly平台中异常上报，具体异常信息的跟踪数据附件信息中的crash_attach.log中查看
-(NSString *)attachmentForException:(NSException *)exception{

    //    [Bugly reportException:exception];
    return [NSString stringWithFormat:@"exceptionInfo:\nname:%@\nreason:%@",exception.name,exception.reason];
}



- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    //版本检测
//    [self checkUpdate];
}


-(NSString *) urldecode:(NSMutableDictionary *) input
{
    NSError *parseError = nil;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:input options:NSJSONWritingPrettyPrinted error:&parseError];
    
    NSString * url =  [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    url = [url stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLPathAllowedCharacterSet]];
    return url;
}

- (BOOL)isFirstOpen {
    
    BOOL coachMarksShown = [[NSUserDefaults standardUserDefaults] boolForKey:@"isFirstShown"];
    if (coachMarksShown == NO) {
        // Don't show again
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"isFirstShown"];
        [[NSUserDefaults standardUserDefaults] synchronize];
        return YES;
    }
    else
    {
        return NO;
    }
    
}

- (void)comeHome:(UIApplication *)application {
    NSLog(@"进入后台");
}


-(void)umengShare
{
    /* 打开日志 */
    [[UMSocialManager defaultManager] openLog:NO];
    // 打开图片水印
    //[UMSocialGlobal shareInstance].isUsingWaterMark = YES;
    [UMSocialGlobal shareInstance].isClearCacheWhenGetUserInfo = NO;
    /* 设置友盟appkey */
    [[UMSocialManager defaultManager] setUmSocialAppkey:umengKey];
    
    [self configUSharePlatforms];
    
}
- (void)configUSharePlatforms
{
    /* 设置微信的appKey和appSecret */
    [[UMSocialManager defaultManager] setPlaform:UMSocialPlatformType_WechatSession appKey:kWeixinAppKey appSecret:kWeixinAppSecret redirectURL:@"http://mobile.umeng.com/social"];
    
    [[UMSocialManager defaultManager] setPlaform:UMSocialPlatformType_QQ appKey:kQQKey/*设置QQ平台的appID*/  appSecret:nil redirectURL:@"http://mobile.umeng.com/social"];
    
    /* 设置新浪的appKey和appSecret */
    NSString * callback = @"https://api.weibo.com/oauth2/default.html";
    [[UMSocialManager defaultManager] setPlaform:UMSocialPlatformType_Sina appKey:kWeiboKey  appSecret:@"5aa91b9fe85e09e604760ca60c517db8" redirectURL:callback];
    
    
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}



- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

//
//- (void)applicationWillTerminate:(UIApplication *)application {
//    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
//}


@end
