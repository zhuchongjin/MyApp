//
//  UIButton+UIButton_Factory.h
//  UIFactory
//
//  Created by zhuchongjin on 2018/9/5.
//  Copyright © 2018年 zhuchongjin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (UIButton_Factory)
+ (UIButton *)buttonWithFrame:(CGRect)frame title:(NSString *)title titleColor:(UIColor *)titleColor backgroundColor:(UIColor *)backgroundColor borderColor:(UIColor *)borderColor titleFont:(UIFont *)titleFont cornerRadius:(float)cornerRadius Target:(id)target action:(SEL)action;
@end
