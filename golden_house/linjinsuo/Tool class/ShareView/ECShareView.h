//
//  ECShareView.h
//  jinyingmeileNative
//
//  Created by Rathakrishnan on 17/03/2017.
//  Copyright © 2017 Jinyingmeile. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ShareManager.h"

typedef NS_ENUM(NSUInteger, ECShareViewType) {
    /** 显示复制和收藏*/
    ECShareViewTypeShowCopyAndCollect,
    /** 不显示复制和收藏*/
    ECShareViewTypeDontShowCopyAndCollect,
};

@class ECShareView;
typedef void(^ECShareViewItemClickHandle)(ECShareView *shareView, NSString *title, NSInteger index, NSInteger shareType);

typedef void(^ECShareViewBottomItemClickHandle)(ECShareView *shareView, NSString *title, NSInteger index);


@interface ECShareView : UIView

+ (instancetype)shareViewWithType:(ECShareViewType)type;
+ (instancetype)shareViewWithType:(ECShareViewType)type hasRepinFlag:(BOOL)hasRepinFlag;
/** 展现*/
- (void)showInView:(UIView *)view;

/** 移除*/
- (void)dismiss;
- (void)dismissWithBlock:(void(^)())block;

/** 点击分享回调事件*/
- (void)setUpItemClickHandle:(ECShareViewItemClickHandle)itemClickHandle;
/** 点击收藏，复制，举报回调事件*/
- (void)setUpBottomItemClickHandle:(ECShareViewBottomItemClickHandle)bottomItemClickHandle;

@end
