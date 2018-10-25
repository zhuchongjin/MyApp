//
//  UIView+UIView_Factory.h
//  UIFactory
//
//  Created by zhuchongjin on 2018/9/5.
//  Copyright © 2018年 zhuchongjin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (UIView_Factory)
+ (UIView *)viewWithFrame:(CGRect)frame backgroundColor:(UIColor *)backgroundColor borderColor:(UIColor *)borderColor cornerRadius:(float)cornerRadius;

@end
