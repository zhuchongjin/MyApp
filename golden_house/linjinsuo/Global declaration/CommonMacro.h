//
//  CommonMacro.h
//  临沂
//
//  Created by Rathakrishnan on 2017/11/7.
//  Copyright © 2017 xiaoruiyun.com. All rights reserved.
//

#ifndef CommonMacro_h
#define CommonMacro_h


//show_type
static const NSInteger NOPIC = 0;
static const NSInteger THREEPIC = 1;
static const NSInteger BIGPIC = 2;
static const NSInteger LEFTPIC = 3;
static const NSInteger VieoType = 4;
//type
static const NSString* ARTICLE = @"article";
static const NSString* PANO = @"pano";
static const NSString* FORUM = @"forum";
static const NSString* GOODS = @"goods";
static const NSString* TAD = @"ad";
//tag
static const NSInteger AD = 1;
static const NSInteger TOP = 2;

//for level
static const int LEVEL_1 = 1;// star
static const int LEVEL_2 = 4;// moon
static const int LEVEL_3 = 16;// sun
static const int LEVEL_4 = 64;// crown



#define weakself(self)  __weak __typeof(self) weakSelf = self
#define JMWeakSelf __weak typeof(self) weakSelf = self;
#undef    __INT
#define __INT( __x )            [NSNumber numberWithInteger:(NSInteger)__x]
//注册完成
#define  REGISTE_OK_MESSAGE                         @"REGISTE_OK_MESSAGE"
//修改密码
#define  PASSWORD_CHANGE_MESSAGE                         @"PASSWORD_CHANGE_MESSAGE"
////
#define  FORGOT_PASSWORD_MESSAGE                         @"FORGOT_PASSWORD_MESSAGE"
//登录用户与上次登录不同
#define LOGIN_USER_CHANGE_MESSAGE                   @"LOGIN_USER_CHANGE_MESSAGE"
#define LOGIN_USER_CHANGE_AVATAR                    @"LOGIN_USER_CHANGE_AVATAR"
#define FORUM_POST_OK    @"FORUM_POST_OK"
#define FORUM_OPERATION_SHOW  @"FORUM_OPERATION_SHOW"
#define PAY_SUCESS  @"PAY_SUCESS"
#define PAY_FAILE  @"PAY_FAILE"
#define NICKSUCESS  @"NICK_SUCESS"
#define LOGOUT  @"other_Logout"
#define PUSH_NOTIFY_ONE  @"PUSH_NOTIFY_ONE"
#define PUSH_NOTIFY_TWO  @"PUSH_NOTIFY_TWO"
#define PUSH_NOTIFY_THREE  @"PUSH_NOTIFY_THREE"
#define NONETWOK @"NO_NETWOK"
#define BUYFIXD  @"BUY_FIXD"



#define KEYWINDOW [UIApplication sharedApplication].keyWindow

#define WeakSelf(weakSelf)  __weak __typeof(&*self)weakSelf = self;

#define kIphone6Height 667.0
#define kIphone6Width 375.0


#define NSEaseLocalizedString(key, comment) [[NSBundle bundleWithURL:[[NSBundle mainBundle] URLForResource:@"EaseUIResource" withExtension:@"bundle"]] localizedStringForKey:(key) value:@"" table:nil]

#define DefaultLocationTimeout 10
#define DefaultReGeocodeTimeout 5

#define UIImageNamed(imageName) [[UIImage imageNamed:imageName] imageWithRenderingMode:UIImageRenderingModeAutomatic]
#define NSEaseLocalizedString(key, comment) [[NSBundle bundleWithURL:[[NSBundle mainBundle] URLForResource:@"EaseUIResource" withExtension:@"bundle"]] localizedStringForKey:(key) value:@"" table:nil]

/******* 消息通知 *******/
#define AJNotification   [NSNotificationCenter defaultCenter]

#define RegisterNotify(_name, _selector)                    \
[[NSNotificationCenter defaultCenter] addObserver:self  \
selector:_selector name:_name object:nil];

#define RemoveNofify            \
[[NSNotificationCenter defaultCenter] removeObserver:self];

#define SendNotify(_name, _object)  \
[[NSNotificationCenter defaultCenter] postNotificationName:_name object:_object];




/** 系统和版本号 */
#define sDevice [UIDevice currentDevice]
#define DeviceName sDevice.name                           // 设备名称
#define DeviceModel sDevice.model                         // 设备类型
#define DeviceLocalizedModel sDevice.localizedModel       // 本地化模式
#define DeviceSystemName sDevice.systemName               // 系统名字
#define DeviceSystemVersion sDevice.systemVersion         // 系统版本
#define DeviceOrientation sDevice.orientation             // 设备朝向
#define DeviceUUID sDevice.identifierForVendor.UUIDString // UUID
#define iOS8 ([DeviceSystemVersion floatValue] >= 8.0)   // iOS8以上
#define iPhone ([DeviceModel rangeOfString:@"iPhone"].length > 0)
#define iPod ([DeviceModel rangeOfString:@"iPod"].length > 0)
#define iPad (sDevice.userInterfaceIdiom == UIUserInterfaceIdiomPad)
/******* 设备型号和系统 *******/


//是否为空或是[NSNull null]
#define NotNilAndNull(_ref)  (((_ref) != nil) && (![(_ref) isEqual:[NSNull null]]))
#define IsNilOrNull(_ref)   (((_ref) == nil) || ([(_ref) isEqual:[NSNull null]]))

//字符串是否为空
#define IsStrEmpty(_ref)    (((_ref) == nil) || ([(_ref) isEqual:[NSNull null]]) ||([(_ref)isEqualToString:@""]))
//数组是否为空
#define IsArrEmpty(_ref)    (((_ref) == nil) || ([(_ref) isEqual:[NSNull null]]) ||([(_ref) count] == 0))

// 字符串拼接
#define LHStringWithFormat(format,...)[NSString stringWithFormat:format,##__VA_ARGS__]


// 设置颜色值
#define titleRatio [UIScreen mainScreen].bounds.size.width/320.0  //文字的比例(Iphone6(1.17) Iphone6Plus(1.3))

/**
 *  弱指针
 */
#define Width_Scale        [UIScreen mainScreen].bounds.size.width/375.0f
#define WeakSelf(weakSelf)  __weak __typeof(&*self)weakSelf = self;

/***********         字体       **************/
#define LHTitleFont(x) [UIFont systemFontOfSize:((SCREEN_WIDTH*((x)/kIphone6Width)))]
#define LHTitleFont15 [UIFont systemFontOfSize:((SCREEN_WIDTH*((15)/kIphone6Width)))]
#define LHTitleFont14 [UIFont systemFontOfSize:((SCREEN_WIDTH*((14)/kIphone6Width)))]
#define LHTitleFont13 [UIFont systemFontOfSize:((SCREEN_WIDTH*((13)/kIphone6Width)))]
#define LHTitleFont12 [UIFont systemFontOfSize:((SCREEN_WIDTH*((12)/kIphone6Width)))]

#define UIFontMake(size) [UIFont systemFontOfSize:size]
#define UIFontBoldMake(size) [UIFont boldSystemFontOfSize:size]
/***  粗体 */
#define kBoldFont(size) [UIFont boldSystemFontOfSize:size]
#endif
#if !__has_feature(objc_arc)



/*safe release*/
#undef TT_RELEASE_SAFELY
#define TT_RELEASE_SAFELY(__REF) \
{\
if (nil != (__REF)) \
{\
CFRelease(__REF); \
__REF = nil;\
}\
}

//view安全释放
#undef TTVIEW_RELEASE_SAFELY
#define TTVIEW_RELEASE_SAFELY(__REF) \
{\
if (nil != (__REF))\
{\
[__REF removeFromSuperview];\
CFRelease(__REF);\
__REF = nil;\
}\
}

//释放定时器
#undef TT_INVALIDATE_TIMER
#define TT_INVALIDATE_TIMER(__TIMER) \
{\
[__TIMER invalidate];\
[__TIMER release];\
__TIMER = nil;\
}

#else

/*safe release*/
#undef TT_RELEASE_SAFELY
#define TT_RELEASE_SAFELY(__REF) \
{\
if (nil != (__REF)) \
{\
__REF = nil;\
}\
}

//view安全释放
#define TTVIEW_RELEASE_SAFELY(__REF) \
{\
if (nil != (__REF))\
{\
[__REF removeFromSuperview];\
__REF = nil;\
}\
}

//释放定时器
#define TT_INVALIDATE_TIMER(__TIMER) \
{\
[__TIMER invalidate];\
__TIMER = nil;\
}


typedef void(^YZHBlock)(id yzhObject);
typedef void(^YZHBlock1)(id yzhObject , NSString * string);
typedef void(^YZHBlock2)(int yzhObject);



#endif

 /* CommonMacro_h */
