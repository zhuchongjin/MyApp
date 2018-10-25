//
//  UIView+UIView_Factory.m
//  UIFactory
//
//  Created by zhuchongjin on 2018/9/5.
//  Copyright © 2018年 zhuchongjin. All rights reserved.
//

#import "UIView+UIView_Factory.h"

@implementation UIView (UIView_Factory)
+ (UIView *)viewWithFrame:(CGRect)frame backgroundColor:(UIColor *)backgroundColor borderColor:(UIColor *)borderColor cornerRadius:(float)cornerRadius{
    UIView *view = [[UIView alloc] initWithFrame:frame];

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

    return view;
}


@end
