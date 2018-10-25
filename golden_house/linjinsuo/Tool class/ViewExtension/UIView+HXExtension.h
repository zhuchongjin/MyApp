//
//  UIView+HXExtension.h
//  微博照片选择
//
//  Created by 洪欣 on 17/2/16.
//  Copyright © 2017 洪欣. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (HXExtension)

- (void)showImageHUDText:(NSString *)text;
- (void)showLoadingHUDText:(NSString *)text;
- (void)handleLoading;
- (void)showLoading;
@end


@interface HXHUD : UIView
- (instancetype)initWithFrame:(CGRect)frame imageName:(NSString *)imageName text:(NSString *)text;
- (void)showloading;
- (void)showloading1;
@end
