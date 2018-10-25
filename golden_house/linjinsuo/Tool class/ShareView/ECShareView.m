//
//  ECShareView.m
//  jinyingmeileNative
//
//  Created by Rathakrishnan on 17/03/2017.
//  Copyright © 2017 Jinyingmeile. All rights reserved.
//

#import "ECShareView.h"

#import "UIButton+Addition.h"

@interface ECShareView ()
/** 分享到*/
@property (nonatomic, weak) UILabel *titleL;
/** 背景视图*/
@property (nonatomic, weak) UIView *bgView;
/** 取消*/
@property (nonatomic, weak) UIButton *cancelBtn;
/** 标题数组*/
@property (nonatomic, strong) NSArray *titleArray;
/** 图片数组*/
@property (nonatomic, strong) NSArray *imageArray;
@property (nonatomic, strong) NSArray *bottomTitleArray;

@property (nonatomic, strong) NSArray *bottomImageArray;
@property (nonatomic, weak) UIView *contentView;
@property (nonatomic, assign) ECShareViewType type;

/** 是否已经收藏*/
@property (nonatomic, assign) BOOL hasRepinFlag;
@end


@implementation ECShareView{
    ECShareViewItemClickHandle _itemClickHandle;
    ECShareViewBottomItemClickHandle _bottomItemClickHandle;
}

+ (instancetype)shareViewWithType:(ECShareViewType)type {
    return [self shareViewWithType:type hasRepinFlag:NO];
}

+ (instancetype)shareViewWithType:(ECShareViewType)type hasRepinFlag:(BOOL)hasRepinFlag {
    ECShareView *shareView = [[ECShareView alloc] init];
    shareView.type = type;
    shareView.hasRepinFlag = hasRepinFlag;
    return shareView;
}

- (void)showInView:(UIView *)view {
    if (view == nil) {
        view = [UIApplication sharedApplication].keyWindow;
    } else {
        view = view.window;
    }
    
    self.frame = view.bounds;
    [view addSubview:self];
    [self configSubViews];
    self.bgView.alpha = 0.0;
    [UIView animateKeyframesWithDuration:0.3 delay:0 options:UIViewKeyframeAnimationOptionCalculationModeLinear animations:^{
        self.bgView.alpha = 1.0;
        self.contentView.y = SCREEN_HEIGHT - self.contentView.height;
    } completion:NULL];
}

- (void)configSubViews {
    
    self.bgView.frame = self.bounds;
    [self sendSubviewToBack:self.bgView];
    
    CGFloat contentX = 0;
    CGFloat contentY = SCREEN_HEIGHT;
    CGFloat contentW = SCREEN_WIDTH;
    CGFloat contentH = 290;
    self.contentView.frame = CGRectMake(contentX, contentY, contentW, contentH);
    
    CGFloat leftMargin = 25;
    CGFloat titleX = leftMargin;
    CGFloat titleY = 5;
    CGFloat titleW = SCREEN_WIDTH - leftMargin * 2;
    CGFloat titleH = 25;
    self.titleL.frame = CGRectMake(titleX, titleY, titleW, titleH);
    
    CGFloat margin = 20;
    CGFloat itemViewW = (SCREEN_WIDTH - 20 * 2) / 3.0;
    CGFloat itemViewH = itemViewW;
    CGFloat itemViewX = 0;
    CGFloat itemViewY = 0;
    UIView *view = [[UIView alloc] init];
    [self.contentView addSubview:view];
    view.frame = CGRectMake(0, self.titleL.bottom, self.width, itemViewH * 2);
    
    for (int i = 0; i < self.titleArray.count; i++) {
        NSString *title = self.titleArray[i];
        UIView *itemView = [[UIView alloc] init];
        [view addSubview:itemView];
        itemView.tag = i + 1;
        itemView.userInteractionEnabled = YES;
        [itemView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(viewTapGest:)]];
        
        NSInteger row = i / 3;
        NSInteger col = i % 3;
        itemViewX = itemViewW * col + margin;
        itemViewY = itemViewH * row;
//        NSLog(@"hhhhhhhhhhhh%@",itemViewY);
        itemView.frame = CGRectMake(itemViewX, itemViewY, itemViewW, itemViewH);
        
        UIImageView *img = [[UIImageView alloc] init];
        [itemView addSubview:img];
        img.frame = CGRectMake(0, 0, itemView.width, itemView.height * 0.7);
        img.contentMode = UIViewContentModeCenter;
        img.image = [UIImage imageNamed:self.imageArray[i]];
        
        UILabel *label = [[UILabel alloc] init];
        [itemView addSubview:label];
        label.textAlignment = NSTextAlignmentCenter;
        label.text = title;
        label.font = LHTitleFont13;
        label.textColor = TextColor;
        label.frame = CGRectMake(0, img.bottom+3, itemView.width, itemView.height - img.bottom);
    }
    
    CGFloat cancelY = view.bottom + 10;
    if (self.type == ECShareViewTypeShowCopyAndCollect) {
        
        CGFloat btnW = 55;
        CGFloat btnY = view.bottom + 10;
        CGFloat btnMargin = 25;
        CGFloat leftMargin = 25 ;
        for (int i = 0; i < 3; i++) {
            
            UIImageView *img = [[UIImageView alloc] init];
            [self.contentView addSubview:img];
            img.frame = CGRectMake(leftMargin + btnMargin * i + btnW * i, btnY, btnW, 55);
            img.contentMode = UIViewContentModeCenter;
            img.image = [UIImage imageNamed:self.bottomImageArray[i]];
            img.userInteractionEnabled = YES;
            img.tag = 100 + i;
           
            if (i == 2) {
                 [img addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(imgTapGest:)]];
            }else
            {
            
                [img addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(viewTapGest:)]];
            }
            UILabel *label = [[UILabel alloc] init];
            [self.contentView addSubview:label];
            label.textAlignment = NSTextAlignmentCenter;
            label.text = self.bottomTitleArray[i];
            label.font = LHTitleFont13;
            label.textColor = TextColor;
            label.frame =  CGRectMake(img.x-15, img.bottom, btnW+30, 20);
            cancelY = label.bottom + 10;
        }
    }else if (self.type == ECShareViewTypeDontShowCopyAndCollect)
    {
//        CGFloat btnW = 55;
//        CGFloat btnY = view.bottom + 10;
//        CGFloat btnMargin = 25;
//        CGFloat leftMargin = (SCREEN_WIDTH - btnW *3 - btnMargin*2 )/2.0;
//        for (int i = 0; i < 3; i++) {
//
//            UIImageView *img = [[UIImageView alloc] init];
//            [self.contentView addSubview:img];
//            img.frame = CGRectMake(leftMargin + btnMargin * i + btnW * i, btnY, btnW, 55);
//            img.contentMode = UIViewContentModeCenter;
//            img.image = [UIImage imageNamed:self.bottomImageArray[i]];
//            img.userInteractionEnabled = YES;
//            img.tag = 100 + i;
//            [img addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(imgTapGest:)]];
//
//            UILabel *label = [[UILabel alloc] init];
//            [self.contentView addSubview:label];
//            label.textAlignment = NSTextAlignmentCenter;
//            label.text = self.bottomTitleArray[i];
//            label.font = LHTitleFont13;
//            label.textColor = TextColor;
//            label.frame =  CGRectMake(img.x-15, img.bottom, btnW+30, 20);
//            cancelY = label.bottom + 10;
//        }


    }
    UIView *lin = [[UIView alloc] initWithFrame:CGRectMake(0, cancelY, SCREEN_WIDTH, 1)];
    lin.backgroundColor = [ThemeBorderColor colorWithAlphaComponent:0.8f];
    [self.contentView addSubview:lin];
    
    CGFloat cancelX = 0;
    CGFloat cancelW = SCREEN_WIDTH;
    CGFloat cancelH = 40;
    self.cancelBtn.frame = CGRectMake(cancelX, cancelY+1, cancelW, cancelH);
    
    self.contentView.frame = CGRectMake(0, SCREEN_HEIGHT, SCREEN_WIDTH, self.cancelBtn.bottom);
}

- (void)imgTapGest:(UITapGestureRecognizer *)tapGest {
    WeakSelf(weakSelf);
    [self dismissWithBlock:^{
        UIImageView *img = (UIImageView *)tapGest.view;
        NSInteger index = img.tag - 100;
        if (_bottomItemClickHandle) {
            _bottomItemClickHandle(weakSelf, weakSelf.bottomImageArray[index], index);
        }
    }];
    
    
}

- (void)dismiss {
    [self dismissWithBlock:nil];
}
- (void)dismissWithBlock:(void(^)())block {
    [UIView animateKeyframesWithDuration:0.3 delay:0 options:UIViewKeyframeAnimationOptionCalculationModeLinear animations:^{
        self.contentView.y = SCREEN_HEIGHT;
        self.bgView.alpha = 0.0;
    } completion:^(BOOL finished) {
        if (finished) {
            if (block) {
                block();
            }
            [self.bgView removeFromSuperview];
            [self.contentView removeFromSuperview];
            [self removeFromSuperview];
        }
    }];
}

- (void)setUpItemClickHandle:(ECShareViewItemClickHandle)itemClickHandle {
    _itemClickHandle = itemClickHandle;
}

/** 点击收藏，复制，举报回调事件*/
- (void)setUpBottomItemClickHandle:(ECShareViewBottomItemClickHandle)bottomItemClickHandle {
    _bottomItemClickHandle = bottomItemClickHandle;
}

- (void)viewTapGest:(UITapGestureRecognizer *)tapGest {
    WeakSelf(weakSelf);
    [self dismissWithBlock:^{
        UIView *view = tapGest.view;
        NSInteger index = view.tag - 1;
        NSString *title = weakSelf.titleArray[index];
        if (_itemClickHandle) {
            _itemClickHandle(weakSelf, title, index, index + 1);
        }
    }];
}

- (UILabel *)titleL {
    if (!_titleL) {
        UILabel *title = [[UILabel alloc] init];
        [self.contentView addSubview:title];
        _titleL = title;
        title.text = @"分享到";
        title.font = LHTitleFont14;
        title.textColor = ThemeLightTextColor;
        title.textAlignment = NSTextAlignmentCenter;
    }
    return _titleL;
}

- (UIButton *)cancelBtn {
    if (!_cancelBtn) {
        UIButton *cancel = [UIButton buttonWithTitle:@"取消" normalColor:TextColor selectedColor:TextColor fontSize:16 target:self action:@selector(dismiss)];
        cancel.backgroundColor = LHWhiteColor;
        [self.contentView addSubview:cancel];
        _cancelBtn = cancel;
    }
    return _cancelBtn;
}

- (UIView *)bgView {
    if (!_bgView) {
        UIView *bg = [[UIView alloc] init];
        [self addSubview:bg];
        _bgView = bg;
        bg.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.2];
        WeakSelf(weakSelf);
        [bg setTapActionWithBlock:^{
            [weakSelf dismiss];
        }];
    }
    return _bgView;
}

- (UIView *)contentView {
    if (!_contentView) {
        UIView *content = [[UIView alloc] init];
        [self addSubview:content];
        _contentView = content;
        content.backgroundColor = [LHWhiteColor colorWithAlphaComponent:0.95f];
    }
    return _contentView;
}

- (NSArray *)titleArray {
    if (!_titleArray) {
        _titleArray = @[@"微信", @"朋友圈", @"微博",@"手机QQ", @"QQ空间",@"复制链接"]; //
    }
    return _titleArray;
}

- (NSArray *)bottomTitleArray {
    if (!_bottomTitleArray) {
        _bottomTitleArray = @[@"手机QQ", @"QQ空间",@"复制链接"];
    }
    return _bottomTitleArray;
}

- (NSArray *)bottomImageArray {
    if (!_bottomImageArray) {
        _bottomImageArray = @[@"qq_popover", @"qqkongjian_popover",@"url_popover"];
    }
    return _bottomImageArray;
}

- (NSArray *)imageArray {
    if (!_imageArray) {
        _imageArray = @[ @"weixin_popover",@"weixinpengyou_popover",@"invite-weibo",@"qq_popover", @"qqkongjian_popover",@"url_popover"]; //, @"invite-weibo"
    }
    return _imageArray;
}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
