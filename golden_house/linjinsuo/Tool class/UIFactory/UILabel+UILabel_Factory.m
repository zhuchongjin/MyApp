//
//  UILabel+UILabel_Factory.m
//  UIFactory
//
//  Created by zhuchongjin on 2018/9/5.
//  Copyright © 2018年 zhuchongjin. All rights reserved.
//

#import "UILabel+UILabel_Factory.h"

@implementation UILabel (UILabel_Factory)
+ (UILabel *)labelWithFrame:(CGRect)frame backgroundColor:(UIColor *)backgroundColor borderColor:(UIColor *)borderColor cornerRadius:(float)cornerRadius font:(UIFont *)font textColor:(UIColor *)textColor textAlignment:(NSTextAlignment)textAlignment text:(NSString *)text{
    UILabel *view = [[UILabel alloc] initWithFrame:frame];

    if (backgroundColor) {
        view.backgroundColor = backgroundColor;
    }

    if (borderColor) {
        view.layer.borderColor = (__bridge CGColorRef _Nullable)(borderColor);
    }

    if (cornerRadius > 0) {
        view.layer.cornerRadius = cornerRadius;
        view.layer.masksToBounds = YES;
    }

    if (font) {
        view.font = font;
    }

    if (textColor) {
        view.textColor = textColor;
    }

    view.textAlignment = textAlignment;

    if (text) {
        view.text = text;
    }

    return view;
}

@end
