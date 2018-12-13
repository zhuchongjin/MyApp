//
//  AutoLayoutOneVC.m
//  linjinsuo
//
//  Created by mac on 2018/12/10.
//  Copyright © 2018年 admin. All rights reserved.
//

#import "AutoLayoutOneVC.h"
static CGFloat changeValue = -18;//记录变化值

@interface AutoLayoutOneVC ()
@property (weak, nonatomic) IBOutlet UIImageView *imageV;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *imageVWidth;

@end

@implementation AutoLayoutOneVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self setTitleName:@"AutoLayoutOneVC进阶"];
    [self setBackLeftButton:@""];
    
    [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(action) userInfo:nil repeats:YES];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



-(void)action{
    _imageVWidth.constant += changeValue;
    if(_imageVWidth.constant<=150){//最小宽度
        changeValue = 18;
    }else if(_imageVWidth.constant>320){//最大宽度
        changeValue = -18;;
    }
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
