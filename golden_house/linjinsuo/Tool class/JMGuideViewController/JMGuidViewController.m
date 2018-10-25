//
//  JMGuidViewController.m
//  金鹰美乐
//
//  Created by Rathakrishnan on 30/12/2016.
//  Copyright © 2016 Jinyingmeile. All rights reserved.
//

#import "JMGuidViewController.h"

#import "ChangeFontWithLabel.h"
#import "ChangeFontWithButton.h"
#import "GuidPageControlView.h"  // 自定义的Page视图
#import "RootViewController.h"


//#import "JMTabBarController.h"

#define showTitleLabelH 28*titleRatio

#define startButtonW  155*titleRatio   // 按钮的宽高
#define startButtonH  40*titleRatio

#define imageCount 3
@interface JMGuidViewController ()<UIScrollViewDelegate>
{
    GuidPageControlView *pageView;
    NSMutableArray *arrTitleName;
}

@end

@implementation JMGuidViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self createScrollView];
    //[self addPageControl];
}


#pragma mark 创建UIScrollView
-(void)createScrollView{
    arrTitleName=[NSMutableArray array];
    [arrTitleName addObjectsFromArray:@[@" ",@"",@"",@""]];
    
    UIScrollView *scrollView=[[UIScrollView alloc]init];
    scrollView.frame=[UIScreen mainScreen].bounds;
    scrollView.pagingEnabled=YES;//设置分页
    scrollView.showsHorizontalScrollIndicator=NO;
    scrollView.bounces=NO;//设置不能弹回
    scrollView.delegate=self;
    scrollView.contentSize=CGSizeMake(scrollView.frame.size.width*imageCount, 0);
    //添加图片
    for (int i=0; i<imageCount; i++) {
        UIImageView *imageView=[[UIImageView alloc]init];
        NSString *strImageName=[NSString stringWithFormat:@"startApp%zi",i];
        imageView.image=[UIImage imageNamed:strImageName];
        imageView.frame=CGRectMake(i*scrollView.frame.size.width, 0, scrollView.frame.size.width, scrollView.frame.size.height);
        
        ChangeFontWithLabel *showTitleLabel=[[ChangeFontWithLabel alloc]initWithFrame:CGRectMake(0, SCREEN_HEIGHT*0.7, SCREEN_WIDTH, showTitleLabelH)];  //在图片上面添加UILabel
        showTitleLabel.text=arrTitleName[i];
        showTitleLabel.textColor= HEX_RGB(0xff25ADEA);
        showTitleLabel.textAlignment=NSTextAlignmentCenter;
        showTitleLabel.cusFont=[UIFont systemFontOfSize:18];
        [imageView addSubview:showTitleLabel];
        
        //在最后一个UIImageView上面添加开始App按钮
        if (i==imageCount-1) {
            [self addStartButton:imageView];//在图片上面添加开始微博按钮
        }
        [scrollView addSubview:imageView];//将图片视图添加到ScrollView上面
    }
    [self.view addSubview:scrollView];//将ScrollView添加到控制器的View上面
}
#pragma mark ScrollView的代理
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGFloat  getNum=scrollView.contentOffset.x/scrollView.frame.size.width;
    NSInteger pageValue=(NSInteger)(getNum+0.5);
    
    pageView.indexNumWithSlide=pageValue; // 这个属性中的Setting会调用很多次,所以在其里面判断前后值
    pageView.hidden=YES;
    /*if(pageValue==(imageCount-1)){
        pageView.hidden=YES;
    }
    else{
        pageView.hidden=NO;
    }*/
}
#pragma mark 创建UIPageControl
-(void)addPageControl{
    CGRect rectValue=CGRectMake(0, self.view.frame.size.height*0.85, SCREEN_WIDTH, 33);
    UIImage *currentImage=[UIImage imageNamed:@"slidePoint"];
    UIImage *pageImage=[UIImage imageNamed:@"slideCirclePoint"];;
    pageView=[GuidPageControlView guidPageControlView:rectValue pageNum:imageCount currentPageIndex:0 currentShowImage:currentImage pageIndicatorShowImage:pageImage];
    [self.view addSubview:pageView];
}
#pragma mark 在图片上面添加开始按钮
-(void)addStartButton:(UIImageView *)imageView{
    
    imageView.userInteractionEnabled=YES;//设置UIImageView可以点击,不然UIButton不能点击
    ChangeFontWithButton *button=[[ChangeFontWithButton alloc]init];
   // [button setTitle:@"立即体验" forState:UIControlStateNormal];
   // button.cusFont=[UIFont systemFontOfSize:18];
   // button.layer.cornerRadius=startButtonH/2;
  //  button.layer.masksToBounds=YES;
  //  button.layer.borderColor=[HEX_RGB(0xff25ADEA) CGColor];
  //  button.layer.borderWidth=1.5;
  //  [button setTitleColor: HEX_RGB(0xff25ADEA) forState:UIControlStateNormal];
    
    button.frame=self.view.bounds;
    [button addTarget:self action:@selector(startApp) forControlEvents:UIControlEventTouchUpInside];
    [imageView addSubview:button];//将按钮添加到最后一个UIImageView里面
}
#pragma mark 开始App
-(void)startApp{
    
    
    NSString *currentBundleVersion = [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleVersion"];
    NSUserDefaults *standardUserDefaults = [NSUserDefaults standardUserDefaults];
    
    if (standardUserDefaults) {
        [standardUserDefaults setObject:currentBundleVersion forKey:@"PreviousBundleVersion"];
        [standardUserDefaults synchronize];
    }
    
    UIWindow *windows=KEYWINDOW;
   // windows.rootViewController=[MainTabBarController new];
    NSLog(@"at guid view ");
    RootViewController *tabBarCtrl = [[RootViewController alloc]init];

    windows.rootViewController = tabBarCtrl;
    [windows makeKeyAndVisible];
    
}
-(BOOL)prefersStatusBarHidden{
    return YES;
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
