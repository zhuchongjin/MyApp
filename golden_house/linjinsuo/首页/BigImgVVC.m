//
//  BigImgVVC.m
//  linjinsuo
//
//  Created by mac on 2018/11/7.
//  Copyright © 2018年 admin. All rights reserved.
//

#import "BigImgVVC.h"
#import "SYBigImage.h"

@interface BigImgVVC ()
@property (weak, nonatomic) IBOutlet UIImageView *imgV;

@end

@implementation BigImgVVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
     [self setBackLeftButton:@""];
    [self setTitleName:@"图片点击放大缩小"];
   
    self.imgV.userInteractionEnabled = YES;
    SYBigImage * bigI = [[SYBigImage alloc]init];
    [self.imgV addGestureRecognizer:bigI];
    
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
