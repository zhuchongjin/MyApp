//
//  UIImageView+UIImageView_Factory.h
//  UIFactory
//
//  Created by zhuchongjin on 2018/9/5.
//  Copyright © 2018年 zhuchongjin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (UIImageView_Factory)
+ (UIImageView *)imageViewWithFrame:(CGRect)frame backgroundColor:(UIColor *)backgroundColor borderColor:(UIColor *)borderColor cornerRadius:(float)cornerRadius image:(UIImage *)image contentMode:(NSNumber *)contentMode;

@end
