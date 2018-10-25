//
//  JMWebViewController.m
//  Financial
//
//  Created by Chausson on 16/3/9.
//  Copyright © 2016年 Chausson. All rights reserved.
//

#import "JMWebViewController.h"
#import "JMWebViewProress.h"
#import "JMWebProgressView.h"


//#import "UINavigationBar+Extension.h"

@interface JMWebViewController ()<JMWebViewDelegate,UIGestureRecognizerDelegate>

//返回按钮
@property (nonatomic)UIBarButtonItem* customBackBarItem;
//关闭按钮
@property (nonatomic)UIBarButtonItem* closeButtonItem;

@property (nonatomic ,strong) NSURLRequest *req;
@property (nonatomic ,assign) BOOL hiddenNavtionBar;
@end

@implementation JMWebViewController{
    BOOL _isFile;
    JMWebProgressView *_progressView;
    JMWebViewProress *_progressProxy;
    
}
- (instancetype)initWithURL:(NSString *)url
{
    if (self = [super init]) {
        _url = [NSURL URLWithString:url];
        
    }
    return self;
}
- (instancetype)initWithFile:(NSString *)url{
    if (self = [super init]) {
        _url = [NSURL fileURLWithPath:url];
        _isFile = YES;
    }
    return self;
}

- (NSURLRequest *)req{
    if (!_req) {
        _req = [NSURLRequest requestWithURL:self.url];
    }
    return _req;
}
#pragma mark Activity
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setBackLeftButton:@""];
    [self setTitleName:self.name];
    self.navigationController.interactivePopGestureRecognizer.delegate = self;
   
    [self initialize];
//    [self layout];

}



- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    if (_hiddenProgressView) {
        [_progressView removeFromSuperview];
    }
    
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
   
    
}

-(void)customBackItemClicked{
    NSLog(@"customBackItemClicked %d",self.webView.canGoBack);
    if (self.webView.canGoBack) {
        [self.webView goBack];
    }else{
        [self.navigationController popViewControllerAnimated:YES];
    }
}
-(void)closeItemClicked{
    [self.navigationController popViewControllerAnimated:YES];
}


- (void)initialize{
    CGRect rect = CGRectMake(0, topHeight , self.view.frame.size.width, self.view.frame.size.height-topHeight-SafeAreaBottomHeight-40);
    //#if __IPHONE_OS_VERSION_MAX_ALLOWED < __IPHONE_8_0
    //#else
    //#endif
    if (self.useUIWebView) {
        _webView = [[JMWebView alloc]initWithUIWebView:rect];
    }else{
        _webView = [[JMWebView alloc]initWithFrame:rect];
        
    }
    [_webView loadRequest:self.req];
    _webView.delegate = self;
    [self.view addSubview:_webView];
    
    
    
    _progressView = [[JMWebProgressView alloc]initWithFrame:CGRectMake(0, [self isNavigationHidden]?0:64, self.view.frame.size.width, 2)];
    if(_tintColor){
        _progressView.color = _tintColor;
    }
    if([self isNavigationHidden]){
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
    [self.view addSubview:_progressView];
    
    
}
- (void)layout{
    [_webView setTranslatesAutoresizingMaskIntoConstraints:NO];
    //layout 子view
    NSLayoutConstraint *contraint1 = [NSLayoutConstraint constraintWithItem:_webView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop multiplier:1.0 constant:0.0];
    NSLayoutConstraint *contraint2 = [NSLayoutConstraint constraintWithItem:_webView attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeft multiplier:1.0 constant:0.0];
    NSLayoutConstraint *contraint3 = [NSLayoutConstraint constraintWithItem:_webView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeBottom multiplier:1.0 constant:0.0];
    NSLayoutConstraint *contraint4 = [NSLayoutConstraint constraintWithItem:_webView attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeRight multiplier:1.0 constant:0.0];
    //把约束添加到父视图上
    NSArray *array = [NSArray arrayWithObjects:contraint1, contraint2, contraint3, contraint4, nil];
    [self.view addConstraints:array];
}
#pragma mark - WebViewDelegate

- (void)webView:(JMWebView *)webVie  updateProgress:(NSProgress *)progress{
    [_progressView setProgress:progress];
}
- (void)webView:(JMWebView *)webView withError:(NSError *)error{
    
}
- (void)webViewDidFinshLoad:(JMWebView *)webView{
    if (_hiddenTitleView) {
        [self.navigationItem.titleView setHidden:YES];
    }
    else
    {
    if (self.title.length == 0) {
        self.title = webView.title;
    }
    }
}
- (void)webViewDidStartLoad:(JMWebView *)webView{
    
}

- (void)webView:(WKWebView *)webView runJavaScriptAlertPanelWithMessage:(NSString *)message initiatedByFrame:(WKFrameInfo *)frame completionHandler:(void (^)(void))completionHandler{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:nil message:message preferredStyle:UIAlertControllerStyleAlert];
    [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        if(completionHandler){
            completionHandler();
        }
    }]];
    if (self) {
        [self presentViewController:alert animated:YES completion:NULL];
    }
}





-(BOOL)webView:(JMWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(JMWebViewNavigationType)navigationType
{
   
    return YES;
}
/**
 * @brief Register Invoke JavaScript observe
 */
- (NSObject *)registerJavaScriptHandler{
    return self;
}
- (NSArray <NSString *>*)registerJavascriptName{
    return nil;
}
#pragma mark Public

- (void)invokeJavaScript:(NSString *)function{
    [self.webView invokeJavaScript:function];
    
}

- (void)invokeJavaScript:(NSString *)function completionHandler:(void (^)( id, NSError * error))completionHandler{
    [self.webView invokeJavaScript:function completionHandler:completionHandler];
}

#pragma makr Private
- (BOOL)isNavigationHidden{
    return !self.navigationController
            || !self.navigationController.navigationBar.isTranslucent
            || !self.navigationController.navigationBar;
}

-(BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldBeRequiredToFailByGestureRecognizer:(nonnull UIGestureRecognizer *)otherGestureRecognizer
{
    return YES;
}

-(void)webViewShowLogin
{
    [self showLoginWindow];
}

-(void)notifyMethod:(NSNotification*)notifications
{
  
    
}
-(void)dealloc{

    RemoveNofify;
}
@end
