//
//  UIImageView+UIImageView_Factory.m
//  UIFactory
//
//  Created by zhuchongjin on 2018/9/5.
//  Copyright © 2018年 zhuchongjin. All rights reserved.
//

#import "UIImageView+UIImageView_Factory.h"

@implementation UIImageView (UIImageView_Factory)
+ (UIImageView *)imageViewWithFrame:(CGRect)frame backgroundColor:(UIColor *)backgroundColor borderColor:(UIColor *)borderColor cornerRadius:(float)cornerRadius image:(UIImage *)image contentMode:(NSNumber *)contentMode{
    UIImageView *view = [[UIImageView alloc] initWithFrame:frame];

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

    if (image) {
        [view setImage:image];
    }

    if (contentMode) {
        view.contentMode = [contentMode integerValue];
    }

    return view;
}
@end
