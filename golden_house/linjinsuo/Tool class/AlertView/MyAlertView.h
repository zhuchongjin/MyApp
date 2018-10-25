//
//  MyAlertView.h
//  linjinsuo
//
//  Created by zcj on 2018/4/2.
//  Copyright © 2018年 admin. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^OnCancleButtonClick)();
typedef void (^OnSureButtonClick)(NSString * parameq,NSString *password,NSString * isagree);

@protocol MyAlertViewDelegate <NSObject>
@optional
- (void)cycleScrollViewDidScrollView:(NSString *)url;

@end


@interface MyAlertView : UIView

@property (nonatomic, copy) OnCancleButtonClick cancleBlock;
@property (nonatomic, copy) OnSureButtonClick sureBlock;


@property(assign,nonatomic) id<MyAlertViewDelegate> delegate;
-(instancetype)initWithFrame:(CGRect)frame withTitle:(NSString *)title alertMessage:(NSString *)msg type:(NSString *)type WithNsmutaleArray:(NSMutableArray *)mutaleArray confrimBlock:(OnSureButtonClick)confrimBlock callblock:(OnCancleButtonClick)callblock;
//弹出
-(void)show;

//隐藏
-(void)hide;

- (void)alertControllerTitle:(NSString *)str;
@end

