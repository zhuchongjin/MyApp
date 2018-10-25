//
//  NewWebViewController.h
//  小睿云
//
//  Created by Rathakrishnan on 2017/10/25.
//  Copyright © 2017 xiaoruiyun.com. All rights reserved.
//

#import "BaseViewController.h"
#import <JavaScriptCore/JavaScriptCore.h>
#import <WebKit/WebKit.h>

@interface NewWebViewController : BaseViewController
@property (nonatomic, strong) UIWebView *commonWebView;

@property (nonatomic, strong) JSContext *jsContext;

//非MTCommonHtml5Type的情况，直接传URL过来
@property (nonatomic, copy) NSString *htmlUrl;

//金城银行 传NSData过来
@property (nonatomic, strong) NSData *htmlData;

//判断是否隐藏标题栏
@property (nonatomic , assign) BOOL isHidenNavi;
//判断是否隐藏标题栏
@property (nonatomic , assign) BOOL isPush;
@property (nonatomic , assign) BOOL isFirst;
//判断是否隐藏标题
@property (nonatomic , assign) BOOL isShowTitle;
//网页显示名称
@property (nonatomic , copy) NSString * Showname;
//分享链接
@property (nonatomic, copy) NSString *shareUrlStr;
@end
