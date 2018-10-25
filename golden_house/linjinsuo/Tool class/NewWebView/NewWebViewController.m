//
//  NewWebViewController.m
//  小睿云
//
//  Created by Rathakrishnan on 2017/10/25.
//  Copyright © 2017 xiaoruiyun.com. All rights reserved.
//

#import "NewWebViewController.h"
#import "MTWebProgressLayer.h"
#import "ECShareView.h"
#import <MJRefresh/MJRefresh.h>
@interface NewWebViewController ()<UIWebViewDelegate>
{
    UIButton * goback;
}
@property (nonatomic, strong) MTWebProgressLayer *progressLayer;

@property (nonatomic, copy) NSString *page;
@property (nonatomic, copy) NSString * titileName;
@property (nonatomic, copy) NSString * url;
//返回按钮
@property (nonatomic, strong) UIBarButtonItem *backItem;
//关闭按钮
@property (nonatomic, strong) UIBarButtonItem *closeItem;
//H5可不可以返回上一页
@property (nonatomic, assign) BOOL isCanGoBack;
@end

@implementation NewWebViewController
-(void)viewWillAppear:(BOOL)animated
{
    if (self.isPush) {
        //进度条初始化
        [self progressLayerInitialize];
    }
    
}
// 控制状态栏的现实与隐藏
- (void)viewDidLoad {
    [super viewDidLoad];
    if (self.isHidenNavi) {
         self.image.hidden = YES;
    }
    [self setTitleName:self.Showname];
   
    [self setBackLeftButton:@""];
    [self setTopLabel];
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self commonWebViewInitialize];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(tabBarDidClick) name:@"LLTabBarDidClickNotification" object:nil];
    
}
-(void)tabBarDidClick
{
    [self.commonWebView.scrollView.mj_header beginRefreshing];
}

/**
 *  webView初始化
 */
- (void)commonWebViewInitialize {
    
    if (self.isHidenNavi) {
       self.commonWebView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-2*topHeight-36-2*SafeAreaBottomHeight-TabBarHeight)];
    }else
    {
        self.commonWebView = [[UIWebView alloc] initWithFrame:CGRectMake(0,screenTopHeight, SCREEN_WIDTH, SCREEN_HEIGHT-2*SafeAreaBottomHeight-20)];
        self.commonWebView.scrollView.contentInset = UIEdgeInsetsMake(topHeight-screenTopHeight, 0, 0, 0);
    }
    self.commonWebView.opaque = NO;
    self.commonWebView.delegate = self;
    self.commonWebView.backgroundColor =LHBackgroundColor;
    self.commonWebView.dataDetectorTypes = UIDataDetectorTypeNone;
    self.commonWebView.scalesPageToFit = YES;
    
    [self.view addSubview:_commonWebView];
    [self.view bringSubviewToFront:self.image];

    [self laodHtml];
   
    
}
-(void)refreshList
{
    if (self.commonWebView.canGoBack) {
        
//        NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:self.url]];
//        [_commonWebView loadRequest:request];
        [self endRefresh];
    } else
    {
        [self laodHtml];
        [self endRefresh];
    }
   
}
#pragma mark - 结束下拉刷新和上拉加载
- (void)endRefresh{

    //当请求数据成功或失败后，如果你导入的MJRefresh库是最新的库，就用下面的方法结束下拉刷新和上拉加载事件
    [self.commonWebView.scrollView.mj_header endRefreshing];
    [self.commonWebView.scrollView.mj_footer endRefreshing];
    
}
-(void)laodHtml
{
    NSString *path = @"";
    
    if (self.htmlData) {
        
        NSString *htmlStr = [[NSString alloc] initWithData:self.htmlData encoding:NSUTF8StringEncoding];
        [_commonWebView loadHTMLString:htmlStr baseURL:nil];
    }
    
    if (self.htmlUrl) {
        
        path = self.htmlUrl;
        
        NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:path]];
        
        [_commonWebView loadRequest:request];
    }
}
/**
 *  进度条初始化
 */
- (void)progressLayerInitialize {
    
    _progressLayer = [MTWebProgressLayer new];
     if (self.isHidenNavi) {
         _progressLayer.frame = CGRectMake(0, -1, [UIScreen mainScreen].bounds.size.width-1, 2);
         [self.view.layer addSublayer:_progressLayer];
     }else
     {
         _progressLayer.frame = CGRectMake(0, topHeight-2, [UIScreen mainScreen].bounds.size.width, 2);
         [self.view.layer addSublayer:_progressLayer];
     }
  
}

#pragma mark - UIWebViewDelegate
- (void)webViewDidStartLoad:(UIWebView *)webView {
    [_progressLayer startLoad];
    
}
-(void)backClick:(UIButton *)sender
{
    if (self.commonWebView.canGoBack) {
        [goback removeFromSuperview];
        //如果有则返回
        [self.commonWebView goBack];
        
    } else {
        if (self.presentingViewController) {
            [self dismissViewControllerAnimated:YES completion:nil];
        } else {
            [self.navigationController popViewControllerAnimated:YES];
        }
    }
}
- (void)webViewDidFinishLoad:(UIWebView *)webView {
    UIWebView *web = webView;
    //注册JSContext
    self.jsContext = [webView valueForKeyPath:@"documentView.webView.mainFrame.javaScriptContext"];
    self.jsContext[@"MicroTown"] = self;
    self.jsContext.exceptionHandler = ^(JSContext *context, JSValue *exceptionValue){
        context.exception = exceptionValue;
    };
    NSString *currentURL = [web stringByEvaluatingJavaScriptFromString:@"document.location.href"];
    self.url = currentURL;
    [_progressLayer finishedLoad];
    
    self.title = [webView stringByEvaluatingJavaScriptFromString:@"document.title"];
    NSString *urlStr = [webView.request.URL absoluteString];
    if ([urlStr rangeOfString:@"www.cnrisk.cn/appPage/jcWithdrawCB.jsp"].location != NSNotFound || [urlStr rangeOfString:@"www.microtown.cn/appPage/jcWithdrawCB.jsp"].location != NSNotFound || [urlStr rangeOfString:@"www.cnrisk.cn/appPage/jcRechargeCB.jsp"].location != NSNotFound || [urlStr rangeOfString:@"www.microtown.cn/appPage/jcRechargeCB.jsp"].location != NSNotFound) {
        
        [self.navigationItem setHidesBackButton:YES animated:YES];
        return;
    }
    if (self.commonWebView.canGoBack) {
      
        goback= [UIButton buttonWithType:UIButtonTypeCustom];
        goback.frame = CGRectMake(self.BackleftButton.right-5, screenTopHeight+2, 30,30);
        UIImageView * imageview = [[UIImageView alloc]initWithFrame:CGRectMake(0, 12.5, 15, 15)];
        UIImage *image = [UIImage imageNamed:@"close"];
        image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
        imageview.image = image;
        [goback addSubview:imageview];
        goback.tintColor = LHBlackColor;
        [self.image addSubview:goback];
        goback.adjustsImageWhenHighlighted = NO;
        [goback addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    }
    
}
-(void)back
{
    if (self.presentingViewController) {
        [self dismissViewControllerAnimated:YES completion:nil];
    } else {
        [self.navigationController popViewControllerAnimated:YES];
    }
}
- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    [_progressLayer finishedLoad];
}

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    if (navigationType == UIWebViewNavigationTypeLinkClicked)
    {
        if ([[request.URL absoluteString] containsString:@"mailto:"]) {
            UIPasteboard *pasteboard = [UIPasteboard generalPasteboard];
            pasteboard.string = @"service@linjinsuo.com";
            [self.view showImageHUDText:@"复制成功"];
            return NO;
        }
        
    }
    return YES;
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    [_progressLayer finishedLoad];
}

- (void)addLeftButton
{
    self.navigationItem.leftBarButtonItem = self.backItem;
}

//点击返回的方法
- (void)backNative
{
    //判断是否有上一层H5页面
    if (self.commonWebView.canGoBack) {
        //如果有则返回、
        [goback removeFromSuperview];
        [self.commonWebView goBack];
      
    } else {
        [self closeNative];
    }
}

//关闭H5页面，直接回到原生页面
- (void)closeNative
{
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
