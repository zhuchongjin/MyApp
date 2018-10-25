//
//  UILabel+UILabel_Factory.h
//  UIFactory
//
//  Created by zhuchongjin on 2018/9/5.
//  Copyright © 2018年 zhuchongjin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (UILabel_Factory)
+ (UILabel *)labelWithFrame:(CGRect)frame backgroundColor:(UIColor *)backgroundColor borderColor:(UIColor *)borderColor cornerRadius:(float)cornerRadius font:(UIFont *)font textColor:(UIColor *)textColor textAlignment:(NSTextAlignment)textAlignment text:(NSString *)text;

@end
