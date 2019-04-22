//
//  PPMakerVC.m
//  linjinsuo
//
//  Created by mac on 2019/4/9.
//  Copyright © 2019年 admin. All rights reserved.
//

#import "PPMakerVC.h"
#import "PPMaker.h"
#import "PPMake+UILabel.h"

@interface PPMakerVC ()
@property (nonatomic,strong) UILabel *lab;
@property (nonatomic,strong) UILabel *labAttr;

@end

@implementation PPMakerVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setTitleName:@"PPMaker快速创建UI链式创建"];
    [self setBackLeftButton:@""];
    
//    UILabel *lab = [UILabel pp_lab];
    
   
    
//    UILabel *lab = [PPMAKELB pp_make:^(PPMake *make) {
//        make.intoView(self.view);
//        make.frame(CGRectMake(100, 100, 100, 30)).bgColor([UIColor redColor]);
//
//    } ];
//
    [self.view addSubview:self.lab];
    
  
//    [self.view addSubview:self.labAttr];
    self.labAttr = [PPMAKE(PPMakeTypeLB) pp_make:^(PPMake *make) {
        
        make.intoView(self.view);
        make.frame(CGRectMake(20, 150, 300, 40));
        make.text(@"").bgColor(LHRedColor);
        
        NSString *str1 = @"费用明细";
    }];
    
}

- (void)bbbb{
    
    NSLog(@"+++++");
}



- (UILabel *)lab{
    if (!_lab) {
        _lab = [PPMAKELB pp_make:^(PPMake *make) {
            make.frame(CGRectMake(100, 100, 100, 30)).bgColor([UIColor redColor]);
            make.text(@"1111").font([UIFont systemFontOfSize:12]).textColor(LHBlueColor);
            make.numberOfLines(0).textAlignment(NSTextAlignmentLeft);
            
        } ];
    }
    

    return _lab;
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
