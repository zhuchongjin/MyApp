//
//  ARToastView.m
//  TongChengCTMS
//
//  Created by mac on 02/08/18.
//  Copyright © 2018 刘帅. All rights reserved.
//

#import "ARToastView.h"

#define ar_TOAST_VIEW_ANIMATION_DURATION  0.5f
#define ar_TOAST_VIEW_OFFSET_BOTTOM  61.0f
#define ar_TOAST_VIEW_OFFSET_LEFT_RIGHT  8.0f
#define ar_TOAST_VIEW_OFFSET_TOP  76.0f
#define ar_TOAST_VIEW_SHOW_DURATION  2.0f
#define ar_TOAST_VIEW_SHOW_DELAY  0.0f
#define ar_TOAST_VIEW_TAG 1024
#define ar_TOAST_VIEW_TEXT_FONT_SIZE  17.0f

static UIColor *_backgroundColor = nil;
static UIColor *_textColor = nil;
static UIFont *_textFont = nil;
static CGFloat _cornerRadius = 0.0f;
static CGFloat _duration = ar_TOAST_VIEW_SHOW_DURATION;
static CGFloat _maxWidth = 0.0f;
static CGFloat _maxHeight = 0.0f;
static NSInteger _maxLines = 0;
static CGFloat _offsetBottom = ar_TOAST_VIEW_OFFSET_BOTTOM;
static CGFloat _offsetTop = ar_TOAST_VIEW_OFFSET_TOP;
static UIEdgeInsets _textInsets;
static NSTextAlignment _textAligment = NSTextAlignmentCenter;

@interface ARToastView ()

@end

@implementation ARToastView

#pragma mark - ToastView Config

+ (void)ar_setAppearanceBackgroundColor:(UIColor *)backgroundColor {
     _backgroundColor = [backgroundColor copy];
}

+ (void)ar_setAppearanceCornerRadius:(CGFloat)cornerRadius {
     _cornerRadius = cornerRadius;
}

+ (void)ar_setAppearanceMaxWidth:(CGFloat)maxWidth {
     _maxWidth = maxWidth;
}

+ (void)ar_setAppearanceMaxLines:(NSInteger)maxLines {
     _maxLines = maxLines;
}

+ (void)ar_setAppearanceOffsetBottom:(CGFloat)offsetBottom {
     _offsetBottom = offsetBottom;
}

+ (void)ar_setAppearanceTextAligment:(NSTextAlignment)textAlignment {
     _textAligment = textAlignment;
}

+ (void)ar_setAppearanceTextColor:(UIColor *)textColor {
     _textColor = [textColor copy];
}

+ (void)ar_setAppearanceTextFont:(UIFont *)textFont {
     _textFont = [textFont copy];
}

+ (void)ar_setAppearanceTextInsets:(UIEdgeInsets)textInsets {
     _textInsets = textInsets;
}

+ (void)ar_setToastViewShowDuration:(NSTimeInterval)duration {
     _duration = duration;
}

#pragma mark - ToastView Show

+ (void)ar_showToast:(id)toast {
     return [self ar_showToast:toast duration:_duration];
}

+ (void)ar_showToast:(id)toast duration:(NSTimeInterval)duration {
     return [self ar_showToast:toast duration:duration delay:ar_TOAST_VIEW_SHOW_DELAY];
}

+ (void)ar_showToast:(id)toast delay:(NSTimeInterval)delay {
     return [self ar_showToast:toast duration:_duration delay:delay];
}

+ (void)ar_showToast:(id)toast completion:(ARToastBlock)completion {
     return [self ar_showToast:toast duration:_duration completion:completion];
}

+ (void)ar_showToast:(id)toast duration:(NSTimeInterval)duration delay:(NSTimeInterval)delay {
     return [self ar_showToast:toast duration:duration delay:delay completion:nil];
}

+ (void)ar_showToast:(id)toast duration:(NSTimeInterval)duration completion:(ARToastBlock)completion {
     return [self ar_showToast:toast duration:duration delay:ar_TOAST_VIEW_SHOW_DELAY completion:completion];
}

+ (void)ar_showToast:(id)toast delay:(NSTimeInterval)delay completion:(ARToastBlock)completion {
     return [self ar_showToast:toast duration:_duration delay:delay completion:completion];
}

+ (void)ar_showToast:(id)toast duration:(NSTimeInterval)duration delay:(NSTimeInterval)delay completion:(ARToastBlock)completion {
     NSString *toastText = [NSString stringWithFormat:@"%@", toast];
     if (toastText.length < 1) {
          return;
     }
     
     dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delay * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
          UIView *keyWindow = [self _keyWindow];
          if (!keyWindow) {
               return;
          }
          [[keyWindow viewWithTag:ar_TOAST_VIEW_TAG] removeFromSuperview];
          [keyWindow endEditing:YES];
          
          UIView *toastView = [UIView new];
          toastView.translatesAutoresizingMaskIntoConstraints = NO;
          toastView.userInteractionEnabled = NO;
          toastView.backgroundColor = [self _backgroundColor];
          toastView.tag = ar_TOAST_VIEW_TAG;
          toastView.clipsToBounds = YES;
          toastView.alpha = 0.0f;
          
          UILabel *toastLabel = [UILabel new];
          toastLabel.translatesAutoresizingMaskIntoConstraints = NO;
          toastLabel.font = [self _textFont];
          toastLabel.text = toastText;
          toastLabel.textColor = [self _textColor];
          toastLabel.textAlignment = _textAligment;
          toastLabel.numberOfLines = 0;
          
          [self _maxWidth];
          [self _maxHeight];
          
          // One line text's height
          CGFloat toastTextHeight = [@"KS" sizeWithAttributes:@{ NSFontAttributeName:[self _textFont], }].height + 0.5f;
          
          // ToastView's textInsets
          if (UIEdgeInsetsEqualToEdgeInsets(_textInsets, UIEdgeInsetsZero)) {
               _textInsets = UIEdgeInsetsMake(toastTextHeight / 2.0f, toastTextHeight, toastTextHeight / 2.0f, toastTextHeight);
          }
          
          if (_cornerRadius <= 0.0f || _cornerRadius > toastTextHeight / 2.0f) {
               toastView.layer.cornerRadius = (toastTextHeight + _textInsets.top + _textInsets.bottom) / 2.0f;
          } else {
               toastView.layer.cornerRadius = _cornerRadius;
          }
          
          // ToastView's size
          CGSize toastLabelSize = [toastLabel sizeThatFits:CGSizeMake(_maxWidth - (_textInsets.left + _textInsets.right), _maxHeight - (_textInsets.top + _textInsets.bottom))];
          CGFloat toastViewWidth = (toastLabelSize.width + 0.5f) + (_textInsets.left + _textInsets.right);
          CGFloat toastViewHeight = (toastLabelSize.height + 0.5f) + (_textInsets.top + _textInsets.bottom);
          
          if (toastViewWidth > _maxWidth) {
               toastViewWidth = _maxWidth;
          }
          
          if (_maxLines > 0) {
               toastViewHeight = toastTextHeight * _maxLines + _textInsets.top + _textInsets.bottom;
          }
          
          if (toastViewHeight > _maxHeight) {
               toastViewHeight = _maxHeight;
          }
          
          NSDictionary *views = NSDictionaryOfVariableBindings(toastLabel, toastView);
          [toastView addSubview:toastLabel];
          [keyWindow addSubview:toastView];
          
          [toastView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:[NSString stringWithFormat:@"H:|-(%@)-[toastLabel]-(%@)-|", @(_textInsets.left), @(_textInsets.right)]
                                                                            options:0
                                                                            metrics:nil
                                                                              views:views]];
          [toastView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:[NSString stringWithFormat:@"V:|-(%@)-[toastLabel]-(%@)-|", @(_textInsets.top), @(_textInsets.bottom)]
                                                                            options:0
                                                                            metrics:nil
                                                                              views:views]];
          
          [keyWindow addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:[NSString stringWithFormat:@"H:[toastView(%@)]", @(toastViewWidth)]
                                                                            options:0
                                                                            metrics:nil
                                                                              views:views]];
          [keyWindow addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:[NSString stringWithFormat:@"V:|-(>=%@)-[toastView(<=%@)]-(%@)-|", @(_offsetTop), @(toastViewHeight), @(_offsetBottom)]
                                                                            options:0
                                                                            metrics:nil
                                                                              views:views]];
          [keyWindow addConstraint:[NSLayoutConstraint constraintWithItem:toastView
                                                                attribute:NSLayoutAttributeCenterX
                                                                relatedBy:NSLayoutRelationEqual
                                                                   toItem:keyWindow
                                                                attribute:NSLayoutAttributeCenterX
                                                               multiplier:1.0f
                                                                 constant:0.0f]];
          [keyWindow layoutIfNeeded];
          
          [UIView animateWithDuration:ar_TOAST_VIEW_ANIMATION_DURATION animations: ^{
               toastView.alpha = 1.0f;
          }];
          
          dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(duration * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
               [UIView animateWithDuration:ar_TOAST_VIEW_ANIMATION_DURATION animations: ^{
                    toastView.alpha = 0.0f;
               } completion: ^(BOOL finished) {
                    [toastView removeFromSuperview];
                    
                    ARToastBlock block = [completion copy];
                    if (block) {
                         block();
                    }
               }];
          });
     });
}

#pragma mark - Deprecated

+ (void)ar_setAppearanceTextPadding:(CGFloat)textPadding {
     // nothing
}

+ (void)ar_setAppearanceMaxHeight:(CGFloat)maxHeight {
     //     _maxHeight = maxHeight;
}

#pragma mark - Private Methods

+ (UIFont *)_textFont {
     if (_textFont == nil) {
          _textFont = [UIFont systemFontOfSize:ar_TOAST_VIEW_TEXT_FONT_SIZE];
     }
     return _textFont;
}

+ (UIColor *)_textColor {
     if (_textColor == nil) {
          _textColor = [UIColor whiteColor];
     }
     return _textColor;
}

+ (UIColor *)_backgroundColor {
     if (_backgroundColor == nil) {
          _backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.5f];
     }
     return _backgroundColor;
}

+ (CGFloat)_maxHeight {
     if (_maxHeight <= 0) {
          _maxHeight = [self _portraitScreenHeight] - (_offsetBottom + ar_TOAST_VIEW_OFFSET_TOP);
     }
     
     return _maxHeight;
}

+ (CGFloat)_maxWidth {
     if (_maxWidth <= 0) {
          _maxWidth = [self _portraitScreenWidth] - (ar_TOAST_VIEW_OFFSET_LEFT_RIGHT + ar_TOAST_VIEW_OFFSET_LEFT_RIGHT);
     }
     return _maxWidth;
}

+ (CGFloat)_portraitScreenWidth {
     return UIInterfaceOrientationIsPortrait([UIApplication sharedApplication].statusBarOrientation) ? CGRectGetWidth([UIScreen mainScreen].bounds) : CGRectGetHeight([UIScreen mainScreen].bounds);
}

+ (CGFloat)_portraitScreenHeight {
     return UIInterfaceOrientationIsPortrait([UIApplication sharedApplication].statusBarOrientation) ? CGRectGetHeight([UIScreen mainScreen].bounds) : CGRectGetWidth([UIScreen mainScreen].bounds);
}

+ (UIView *)_keyWindow {
     return [UIApplication sharedApplication].delegate.window;
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
