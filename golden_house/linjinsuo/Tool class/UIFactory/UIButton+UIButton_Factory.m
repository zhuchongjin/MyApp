//
//  UIButton+UIButton_Factory.m
//  UIFactory
//
//  Created by zhuchongjin on 2018/9/5.
//  Copyright © 2018年 zhuchongjin. All rights reserved.
//

#import "UIButton+UIButton_Factory.h"

@implementation UIButton (UIButton_Factory)
+ (UIButton *)buttonWithFrame:(CGRect)frame title:(NSString *)title titleColor:(UIColor *)titleColor backgroundColor:(UIColor *)backgroundColor borderColor:(UIColor *)borderColor titleFont:(UIFont *)titleFont cornerRadius:(float)cornerRadius Target:(id)target action:(SEL)action{
    UIButton *view = [UIButton buttonWithType:UIButtonTypeCustom];
    
    view.frame = frame;
    
    if (title) {
        [view setTitle:title forState:UIControlStateNormal];
    }
    
    if (titleColor) {
        [view setTitleColor:titleColor forState:UIControlStateNormal];
    }
    
    if (borderColor) {
        //        view.borderColor = borderColor;
        view.layer.borderColor = (__bridge CGColorRef _Nullable)(borderColor);
    }
    
    if (backgroundColor) {
        view.backgroundColor = backgroundColor;
    }
    
    if (titleFont) {
        view.titleLabel.font = titleFont;
    }
    
    if (cornerRadius > 0) {
        view.layer.cornerRadius = cornerRadius;
        view.layer.masksToBounds = YES;
    }
    
    if (target && action) {
        [view addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    }
    
    return view;
}
@end
