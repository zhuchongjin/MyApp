//
//  ARToastView.h
//  TongChengCTMS
//
//  Created by mac on 02/08/18.
//  Copyright © 2018 刘帅. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^ARToastBlock)(void);

@interface ARToastView : UIView

/**
 *  ToastView Config
 */
+ (void)ar_setAppearanceBackgroundColor:(UIColor *)backgroundColor;
+ (void)ar_setAppearanceCornerRadius:(CGFloat)cornerRadius;
+ (void)ar_setAppearanceMaxWidth:(CGFloat)maxWidth;
+ (void)ar_setAppearanceMaxLines:(NSInteger)maxLines;
+ (void)ar_setAppearanceOffsetBottom:(CGFloat)offsetBottom;
+ (void)ar_setAppearanceTextAligment:(NSTextAlignment)textAlignment;
+ (void)ar_setAppearanceTextColor:(UIColor *)textColor;
+ (void)ar_setAppearanceTextFont:(UIFont *)textFont;
+ (void)ar_setAppearanceTextInsets:(UIEdgeInsets)textInsets;
+ (void)ar_setToastViewShowDuration:(NSTimeInterval)duration;

/**
 *  ToastView Show
 */
+ (void)ar_showToast:(id)toast;
+ (void)ar_showToast:(id)toast duration:(NSTimeInterval)duration;
+ (void)ar_showToast:(id)toast delay:(NSTimeInterval)delay;
+ (void)ar_showToast:(id)toast completion:(ARToastBlock)completion;
+ (void)ar_showToast:(id)toast duration:(NSTimeInterval)duration delay:(NSTimeInterval)delay;
+ (void)ar_showToast:(id)toast duration:(NSTimeInterval)duration completion:(ARToastBlock)completion;
+ (void)ar_showToast:(id)toast delay:(NSTimeInterval)delay completion:(ARToastBlock)completion;
+ (void)ar_showToast:(id)toast duration:(NSTimeInterval)duration delay:(NSTimeInterval)delay completion:(ARToastBlock)completion;

/**
 *  @Deprecated
 *  Please use + (void)ar_setAppearanceTextInsets:(UIEdgeInsets)textInsets;
 */
+ (void)ar_setAppearanceTextPadding:(CGFloat)textPadding __attribute__((deprecated));

/**
 *  @Deprecated
 *  Please use + (void)ar_setAppearanceMaxLines:(CGFloat)maxLines;
 */
+ (void)ar_setAppearanceMaxHeight:(CGFloat)maxHeight __attribute__((deprecated));

@end
