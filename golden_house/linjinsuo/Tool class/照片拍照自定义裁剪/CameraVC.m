//
//  CameraVC.m
//  linjinsuo
//
//  Created by mac on 2018/10/25.
//  Copyright © 2018年 admin. All rights reserved.
//

#import "CameraVC.h"
#import "CameraViewController.h"
#import "GetPhoto.h"
@interface CameraVC ()<CameraDelegate>

@property(nonatomic, strong) CameraViewController *cameraViewvController;

@property (nonatomic, strong)  UIImageView *imgeView;


@end

@implementation CameraVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setTitleName:@"相机拍照剪裁"];
    [self setBackLeftButton:@""];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(100, 100, 100, 100);
    btn.backgroundColor = [UIColor redColor];
    [btn addTarget:self action:@selector(cameraAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    UIButton *btn1 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn1.frame = CGRectMake(100, 200, 100, 100);
    btn1.backgroundColor = [UIColor lightGrayColor];
    [btn1 addTarget:self action:@selector(cameraAction1) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn1];
    
    [self.view addSubview:self.imgeView];
}

- (void)cameraAction1
{
   
    [GetPhoto getPhoto:self completion:^(UIImage *curImage, NSData *imageData) {
        
        [UIView addMJNotifierWithText:@"+++++++" dismissAutomatically:YES];
    }];
    
}


- (void)cameraAction
{
    self.cameraViewvController = [[CameraViewController alloc] init];
    self.cameraViewvController.delegate = self;
    //self.navigationController.navigationBar.barTintColor = [UIColor blackColor];
    [self presentViewController:self.cameraViewvController animated:YES completion:nil];
    
    
}
//选取照片的回调
- (void)CameraTakePhoto:(UIImage *)image
{
    NSLog(@"-----%@",image);
    _imgeView.image = image;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (UIImageView *)imgeView{
    
    if (!_imgeView) {
        _imgeView = [UIImageView imageViewWithFrame:CGRectMake(50, 300, 80, 00) backgroundColor:nil borderColor:nil cornerRadius:0 image:[UIImage imageNamed:@"per"] contentMode:nil];
    }
    return _imgeView;
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
