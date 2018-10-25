//
//  NoDataView.m
//  NoDataView
//
//  Created by LvJianfeng on 16/4/18.
//  Copyright © 2016年 LvJianfeng. A rights reserved.
//

#import "NoDataView.h"


@implementation NoDataView
- (instancetype)initNoDataWithFrame:(CGRect)frame description:(NSString *)description canTouch:(BOOL)isCanTouch{
    self = [super initWithFrame:frame];
    if (self) {
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(frame.size.width*0.5-IconWidth*0.5, (frame.size.height/4), IconWidth, IconHeight)];
        imageView.image = [UIImage imageNamed:@"no_data_katong_"];
        [self addSubview:imageView];
        
        Label *tipLabel = [[Label alloc] initWithFrame:CGRectMake(0, imageView.bottom+DescriptionTopSpace, SCREEN_WIDTH, DescriptionHeight)];
        tipLabel.textColor = TextDarkG;
        tipLabel.font = [UIFont systemFontOfSize:DescriptionFontSize];
        tipLabel.textAlignment = NSTextAlignmentCenter;
        tipLabel.verticalAlignment = VerticalAlignmentTop;
        tipLabel.text = description;
        [self addSubview:tipLabel];
        
        if (isCanTouch) {
            UIButton *btnTouchView =  [UIButton buttonWithType:UIButtonTypeCustom];
            btnTouchView.frame = CGRectMake((SCREEN_WIDTH/2)-85,tipLabel.bottom+10,170,40);
            [btnTouchView setTitle:@"随便逛逛" forState:UIControlStateNormal];
            btnTouchView.titleLabel.font = [UIFont systemFontOfSize:19];
            [btnTouchView setBackgroundColor:ThemesColor];
            btnTouchView.layer.cornerRadius =5;
            [btnTouchView addTarget:self action:@selector(windowTouchAction) forControlEvents:UIControlEventTouchUpInside];
            [self addSubview:btnTouchView];
        }
        
    }
    return self;
}

- (instancetype)initNoInternetWithFrame:(CGRect)frame description:(NSString *)description canTouch:(BOOL)isCanTouch{
    self = [super initWithFrame:frame];
    if (self) {
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(frame.size.width*0.5-IconWidth*0.5, (frame.size.height/4), IconWidth, IconHeight)];

        imageView.image = [UIImage imageNamed:@"network_empty"];
        [self addSubview:imageView];
        
        Label *tipLabel = [[Label alloc] initWithFrame:CGRectMake(0, imageView.bottom+DescriptionTopSpace, SCREEN_WIDTH, DescriptionHeight)];
        tipLabel.textColor = TextDarkG;
        tipLabel.font = [UIFont systemFontOfSize:DescriptionFontSize];
        tipLabel.textAlignment = NSTextAlignmentCenter;
        tipLabel.verticalAlignment = VerticalAlignmentTop;
        tipLabel.text = description;
        [self addSubview:tipLabel];
        
        if (isCanTouch) {

            UIButton *btnTouchView =  [UIButton buttonWithType:UIButtonTypeCustom];
            btnTouchView.frame = CGRectMake((SCREEN_WIDTH/2)-85,tipLabel.bottom+10,170,40);
            btnTouchView.titleLabel.font = [UIFont systemFontOfSize:19];
            [btnTouchView setBackgroundColor:ThemesColor];
            
            [btnTouchView addTarget:self action:@selector(windowTouchAction) forControlEvents:UIControlEventTouchUpInside];
            [self addSubview:btnTouchView];
            
        }
    }
    return self;
}

- (instancetype)initImageWithFrame:(CGRect)frame image:(UIImage *)image description:(NSString *)description canTouch:(BOOL)isCanTouch{
    self = [super initWithFrame:frame];
    if (self) {
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(frame.size.width*0.5-IconWidth*0.5, (frame.size.height/4), IconWidth, IconHeight)];
        imageView.image = image;
        [self addSubview:imageView];
        
        Label *tipLabel = [[Label alloc] initWithFrame:CGRectMake(0, imageView.bottom+DescriptionTopSpace, SCREEN_WIDTH, DescriptionHeight)];
        tipLabel.textColor = TextDarkG;
        tipLabel.font = [UIFont systemFontOfSize:DescriptionFontSize];
        tipLabel.textAlignment = NSTextAlignmentCenter;
        tipLabel.verticalAlignment = VerticalAlignmentTop;
        tipLabel.text = description;
        [self addSubview:tipLabel];
        
        if (isCanTouch) {
            UIButton *btnTouchView =  [UIButton buttonWithType:UIButtonTypeCustom];
            btnTouchView.frame = CGRectMake((SCREEN_WIDTH/2)-90,tipLabel.bottom+10,180,40);
            [btnTouchView setTitle:@"随便逛逛" forState:UIControlStateNormal];
            btnTouchView.titleLabel.font = [UIFont systemFontOfSize:19];
            [btnTouchView setBackgroundColor:ThemesColor];
            
            [btnTouchView addTarget:self action:@selector(windowTouchAction) forControlEvents:UIControlEventTouchUpInside];
            [self addSubview:btnTouchView];

        }
    }
    return self;
}

- (instancetype)initImageNameWithFrame:(CGRect)frame imageName:(NSString *)imageName description:(NSString *)description canTouch:(BOOL)isCanTouch
{
    self = [super initWithFrame:frame];
    if (self) {
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(frame.size.width*0.5-IconWidth*0.5, (frame.size.height/4), IconWidth, IconHeight)];
        imageView.image = [UIImage imageNamed:imageName];
        [self addSubview:imageView];
        
        Label *tipLabel = [[Label alloc] initWithFrame:CGRectMake(0, imageView.bottom+DescriptionTopSpace, SCREEN_WIDTH, DescriptionHeight)];
        tipLabel.textColor = TextDarkG;
        tipLabel.font = [UIFont systemFontOfSize:DescriptionFontSize];
        tipLabel.textAlignment = NSTextAlignmentCenter;
        tipLabel.verticalAlignment = VerticalAlignmentTop;
        tipLabel.text = description;
        [self addSubview:tipLabel];
        
        if (isCanTouch) {
            UIButton *btnTouchView =  [UIButton buttonWithType:UIButtonTypeCustom];
            btnTouchView.frame = CGRectMake((SCREEN_WIDTH/2)-90,tipLabel.bottom+10,180,40);
            [btnTouchView setTitle:@"随便逛逛" forState:UIControlStateNormal];
            btnTouchView.titleLabel.font = [UIFont systemFontOfSize:19];
            [btnTouchView setBackgroundColor:ThemesColor];
            [btnTouchView addTarget:self action:@selector(windowTouchAction) forControlEvents:UIControlEventTouchUpInside];
            [self addSubview:btnTouchView];
        }
    }
    return self;
}

//空数据View的点击响应协议
- (void)windowTouchAction{
    if ([self.delegate respondsToSelector:@selector(didTouchNoDataView)]) {
        [self.delegate didTouchNoDataView];
    }
}
@end


@implementation Label
- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.verticalAlignment = VerticalAlignmentMiddle;
    }
    return self;
}

- (void)setverticalAlignment:(VerticalAlignment)verticalAlignment{
    _verticalAlignment = verticalAlignment;
    [self setNeedsDisplay];
}

- (CGRect)textRectForBounds:(CGRect)bounds limitedToNumberOfLines:(NSInteger)numberOfLines {
    CGRect textRect = [super textRectForBounds:bounds limitedToNumberOfLines:numberOfLines];
    switch (self.verticalAlignment) {
        case VerticalAlignmentTop:
            textRect.origin.y = bounds.origin.y;
            break;
        case VerticalAlignmentBottom:
            textRect.origin.y = bounds.origin.y + bounds.size.height - textRect.size.height;
            break;
        case VerticalAlignmentMiddle:
            // Fa through.
        default:
            textRect.origin.y = bounds.origin.y + (bounds.size.height - textRect.size.height) / 2.0;
    }
    return textRect;
}

-(void)drawTextInRect:(CGRect)requestedRect {
    CGRect actualRect = [self textRectForBounds:requestedRect limitedToNumberOfLines:self.numberOfLines];
    [super drawTextInRect:actualRect];
}
@end
