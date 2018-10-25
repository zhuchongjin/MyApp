//
//  Util.h
//  linjinsuo
//
//  Created by zcj on 2018/4/4.
//  Copyright © 2018年 admin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Util : NSObject

/**
 验证码
 @param imageV <#imageV description#>
 */
+ (void)getAuthCodePictureWith:(UIImageView *)imageV;

+ (NSString *)getSid;
+ (NSString *)getPid;
+ (NSString *)replaceStringWithAsterisk:(NSString *)originalStr startLocation:(NSInteger)startLocation lenght:(NSInteger)lenght;

+ (UILabel *)labelWithFrame:(CGRect)frame backgroundColor:(UIColor *)backgroundColor  cornerRadius:(float)cornerRadius font:(UIFont *)font textColor:(UIColor *)textColor textAlignment:(NSTextAlignment)textAlignment text:(NSString *)text;

+ (UIButton *)buttonWithFrame:(CGRect)frame title:(NSString *)title titleColor:(UIColor *)titleColor backgroundColor:(UIColor *)backgroundColor  titleFont:(UIFont *)titleFont cornerRadius:(float)cornerRadius Target:(id)target action:(SEL)action;

+ (UIView *)viewWithFrame:(CGRect)frame backgroundColor:(UIColor *)backgroundColor  cornerRadius:(float)cornerRadius;

+ (UIImageView *)imageViewWithFrame:(CGRect)frame backgroundColor:(UIColor *)backgroundColor borderColor:(UIColor *)borderColor cornerRadius:(float)cornerRadius image:(UIImage *)image contentMode:(NSNumber *)contentMode;

+ (UITableView *)tableViewFrame:(CGRect)frame style:(UITableViewStyle)style backgroundColor:(UIColor *)backgroundColor separatorStyle:(UITableViewCellSeparatorStyle)separatorStyle dataSource:(id <UITableViewDataSource>)dataSource delegate:(id <UITableViewDelegate>)delegate;

+ (UITextField *)textFieldWithFrame:(CGRect)frame placeholder:(NSString *)placeholder backgroundColor:(UIColor *)backgroundColor borderColor:(UIColor *)borderColor cornerRadius:(float)cornerRadius font:(UIFont *)font textColor:(UIColor *)textColor textAlignment:(NSTextAlignment)textAlignment text:(NSString *)text delegate:(id<UITextFieldDelegate>)delegate;

@end
