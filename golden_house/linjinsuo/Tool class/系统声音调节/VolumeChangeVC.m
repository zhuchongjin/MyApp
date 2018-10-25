//
//  VolumeChangeVC.m
//  linjinsuo
//
//  Created by mac on 2018/10/25.
//  Copyright © 2018年 admin. All rights reserved.
//

#import "VolumeChangeVC.h"
#import <MediaPlayer/MediaPlayer.h>
#import <UserNotifications/UserNotifications.h>
@interface VolumeChangeVC ()
@property(nonatomic,strong)UISlider *slider;
@property (nonatomic,strong)UIView *viewVolume;
@property (nonatomic,strong)UIView *viewNotice;
@property (nonatomic,copy)YZHBlock2 returnBlock;
@property (nonatomic,strong)UISwitch *mySwitch;
@end

@implementation VolumeChangeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setTitleName:@"声音调节"];

    [self setBackLeftButton:@""];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(volumeChange:) name:@"AVSystemController_SystemVolumeDidChangeNotification" object:nil];
    
    [self.view addSubview:self.viewNotice];
    
    [self.view addSubview:self.viewVolume];
    [self.viewVolume addSubview:self.slider];
    self.slider.value = [VolumeChangeVC getSystemVolumValue];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
    WS(ws);
    [self openMessageNotificationServiceWithBlock:^(int yzhObject) {
        
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
            NSLog(@"+++++++++%d",yzhObject)
            if (yzhObject == 1) {
                [ws.mySwitch setOn:YES animated:YES];
                
            }else{
                [ws.mySwitch setOn:NO animated:YES];
                
            }
        });
       
    }];
}


- (void)openMessageNotificationServiceWithBlock:(YZHBlock2)returnBlock
{
#if __IPHONE_OS_VERSION_MAX_ALLOWED >= __IPHONE_10_0
    if (@available(iOS 10.0, *)) {
        [[UNUserNotificationCenter currentNotificationCenter] getNotificationSettingsWithCompletionHandler:^(UNNotificationSettings *settings) {
            if (returnBlock) {
                returnBlock(settings.authorizationStatus == UNAuthorizationStatusAuthorized);
            }
        }];
    } else {
        // Fallback on earlier versions
    }
#elif __IPHONE_OS_VERSION_MAX_ALLOWED >= __IPHONE_8_0
    returnBlock([[UIApplication sharedApplication] isRegisteredForRemoteNotifications]);
#else
    UIRemoteNotificationType type = [[UIApplication sharedApplication] enabledRemoteNotificationTypes];
    if (returnBlock) {
        returnBlock(type != UIRemoteNotificationTypeNone);
    }
#endif
}


- (void) switchChange:(UISwitch*)sender {
    
    if([sender isOn]){
        
        NSLog(@"turn on");
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:UIApplicationOpenSettingsURLString]];
        
        
    }else{
        
        NSLog(@"turned off");
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:UIApplicationOpenSettingsURLString]];
        
    }
    
}




-(void)sliderValueChanged:(UISlider *)slider
{
    //     NSLog(@"slider value%f",slider.value);
    [VolumeChangeVC setSysVolumWith:slider.value];
    //     self.stepper.value = sender.value;
}


/** 改变铃声 的 通知
 
 "AVSystemController_AudioCategoryNotificationParameter" = Ringtone;    // 铃声改变
 "AVSystemController_AudioVolumeChangeReasonNotificationParameter" = ExplicitVolumeChange; // 改变原因
 "AVSystemController_AudioVolumeNotificationParameter" = "0.0625";  // 当前值
 "AVSystemController_UserVolumeAboveEUVolumeLimitNotificationParameter" = 0; 最小值
 
 
 改变音量的通知
 "AVSystemController_AudioCategoryNotificationParameter" = "Audio/Video"; // 音量改变
 "AVSystemController_AudioVolumeChangeReasonNotificationParameter" = ExplicitVolumeChange; // 改变原因
 "AVSystemController_AudioVolumeNotificationParameter" = "0.3";  // 当前值
 "AVSystemController_UserVolumeAboveEUVolumeLimitNotificationParameter" = 0; 最小值
 */
-(void)volumeChange:(NSNotification*)notifi{
    NSString * style = [notifi.userInfo objectForKey:@"AVSystemController_AudioCategoryNotificationParameter"];
    CGFloat value = [[notifi.userInfo objectForKey:@"AVSystemController_AudioVolumeNotificationParameter"] doubleValue];
    if ([style isEqualToString:@"Ringtone"]) {
        NSLog(@"铃声改变");
    }else if ([style isEqualToString:@"Audio/Video"]){
        NSLog(@"音量改变 当前值:%f",value);
        //          self.stepper.value = value;
        self.slider.value = value;
    }
}


#pragma mark - 音量控制
/*
 *获取系统音量滑块
 */
+(UISlider*)getSystemVolumSlider{
    static UISlider * volumeViewSlider = nil;
    if (volumeViewSlider == nil) {
        MPVolumeView *volumeView = [[MPVolumeView alloc] initWithFrame:CGRectMake(100, 50, 200, 4)];
        volumeView.backgroundColor = LHRandomColor;
        for (UIView* newView in volumeView.subviews) {
            if ([newView.class.description isEqualToString:@"MPVolumeSlider"]){
                volumeViewSlider = (UISlider*)newView;
                break;
            }
        }
    }
    
    return volumeViewSlider;
}


/*
 *获取系统音量大小
 */
+(CGFloat)getSystemVolumValue{
    return [[self getSystemVolumSlider] value];
}
/*
 *设置系统音量大小
 */
+(void)setSysVolumWith:(double)value{
    [self getSystemVolumSlider].value = value;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIView *)viewNotice{
    if (!_viewNotice) {
        _viewNotice = [UIView viewWithFrame:CGRectMake(0, topHeight, SCREEN_WIDTH-topHeight, 50) backgroundColor:LHWhiteColor borderColor:nil cornerRadius:0];
        
        UILabel *lab = [UILabel labelWithFrame:CGRectMake(0, 0, 100, 50) backgroundColor:LHWhiteColor
                                   borderColor:nil cornerRadius:0 font:LHTitleFont12 textColor:LHRandomColor textAlignment:NSTextAlignmentCenter text:@"新消息通知"];
        [_viewNotice addSubview:lab];
        
        _mySwitch = [[UISwitch alloc]initWithFrame:CGRectMake(SCREEN_WIDTH - 80, 10,80 , 80)];
        _mySwitch.onTintColor = ThemeTextColor;
        _mySwitch.thumbTintColor= ThemeBorderColor;
        _mySwitch.tintColor= ThemesColor;
        [_mySwitch addTarget:self action:@selector(switchChange:)forControlEvents:UIControlEventValueChanged];
        [_viewNotice addSubview:_mySwitch];
    }
    return _viewNotice;
}
- (UIView *)viewVolume{
    if (!_viewVolume) {
        _viewVolume = [UIView viewWithFrame:CGRectMake(0, 60+_viewNotice.bottom, SCREEN_WIDTH, 50) backgroundColor:LHWhiteColor borderColor:nil cornerRadius:0];
    }
    
    return _viewVolume;
}


- (UISlider *)slider{
    
    if (!_slider) {
        
        UILabel *lab = [UILabel labelWithFrame:CGRectMake(0, 0, 80, 50) backgroundColor:LHWhiteColor
                                   borderColor:nil cornerRadius:0 font:LHTitleFont12 textColor:ThemeTextColor textAlignment:NSTextAlignmentCenter text:@"通知声音"];
        [_viewVolume addSubview:lab];
        _slider = [[UISlider alloc]initWithFrame:CGRectMake(lab.right, 0, SCREEN_WIDTH - 20 - lab.width, 50)];
        _slider.backgroundColor =LHWhiteColor;
        _slider.minimumValue = 0.00;
        _slider.maximumValue = 1.00;
        //          _slider.value = 0.60;
        [_slider setContinuous:YES];
        _slider.minimumTrackTintColor = ThemesColor;
        _slider.maximumTrackTintColor = ThemeBorderColor;
        _slider.thumbTintColor = ThemesColor;
        [_slider addTarget:self action:@selector(sliderValueChanged:) forControlEvents:UIControlEventValueChanged];
    }
    return _slider;
}






@end
