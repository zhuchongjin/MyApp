//
//  Color.h
//  临沂
//
//  Created by Rathakrishnan on 2017/11/7.
//  Copyright © 2017 xiaoruiyun.com. All rights reserved.
//

#ifndef Color_h
#define Color_h




//主题色0xe10000
#define TargetColor        [UIColor colorWithRed:0x48/255.0f green:0x64/255.0f blue:0x95/255.0f alpha:1.0f]

#define searchBarBC [UIColor colorWithRed:238/255.0f green:238/255.0f blue:238/255.0f alpha:1.0f]      // TabBar选中颜色
#define DarkBtnColor RGB(82,96,107)
#define kCommonHighLightRedColor HEX_RGB(0xFF6600)
//主题色0xe10000
#define ThemesColor        RGB(7,197,83)
//背景色
#define LHBackgroundColor  [UIColor colorWithRed:234/255.0f green:237/255.0f blue:240/255.0f alpha:1.0f]

#define ThemeBorderColor  RGB(234,237,240) //[UIColor colorWithRed:247/255.0f green:247/255.0f blue:247/255.0f alpha:1.0f] //HEX_RGBA(0xe2e2e2,0.6f)
#define TextDarkG RGB(93, 100, 110)
#define ThemeTextColor HEX_RGB(0x1d1d1d)
#define ThemeLightTextColor HEX_RGB(0x999999)
#define ThemeTextNormalColor HEX_RGB(0x333333)

#define WhiteThemeTintColor HEX_RGB(0xFF404245)
#define TextColor HEX_RGB(0xFF404245)
#define TextLight HEX_RGB(0xFFA2A6AD)
#define TextGray RGB(85, 85, 85)

#define UIColorMake(r, g, b) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1]

//#define UIColorGray1 UIColorMake(53, 60, 70)
//#define UIColorGray2 UIColorMake(73, 80, 90)
//#define UIColorGray3 UIColorMake(93, 100, 110)
//#define UIColorGray4 UIColorMake(113, 120, 130)
//#define UIColorGray5 UIColorMake(133, 140, 150)
//#define UIColorGray6 UIColorMake(153, 160, 170)
//#define UIColorGray7 UIColorMake(173, 180, 190)
//#define UIColorGray8 UIColorMake(196, 200, 208)
//#define UIColorGray9 UIColorMake(216, 220, 228)


// 基础颜色
#define LHClearColor [UIColor clearColor]
#define LHWhiteColor [UIColor whiteColor]
#define LHBlackColor [UIColor blackColor]
#define LHGrayColor [UIColor grayColor]
#define LHlightGrayColor [UIColor lightGrayColor]
#define LHBlueColor [UIColor blueColor]
#define LHRedColor [UIColor redColor]
// 自定义颜色
#define LHColor(r,g,b) [UIColor colorWithRed:(r)/255. green:(g)/255. blue:(b)/255. alpha:1.]
// 随机色
#define LHRandomColor LHColor(arc4random_uniform(256), arc4random_uniform(256), arc4random_uniform(256))


#endif /* Color_h */
