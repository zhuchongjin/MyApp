//
//  MenuListVC.m
//  linjinsuo
//
//  Created by zcj on 2021/12/4.
//  Copyright © 2021 admin. All rights reserved.
//

#import "MenuListVC.h"
#import "YCMenuView.h"

@interface MenuListVC ()
@property (weak, nonatomic) IBOutlet UIButton *btn1;
@property (weak, nonatomic) IBOutlet UIButton *btn2;

@end

@implementation MenuListVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self setTitleName:@"指定UI下拉列表"];
    [self setBackLeftButton:@""];
}
- (IBAction)btn1Action:(id)sender {
    
    NSArray *list = @[@"当天",@"近两天",@"近五天",@"近十天",@"近一个月",@"近三个月",@"全部",@"按日期"];
    NSMutableArray *actionArray = [NSMutableArray array];
    for (int i = 0; i < list.count; i++) {
        
        YCMenuAction *action = [YCMenuAction actionWithTitle:list[i] image:[UIImage imageNamed:@"cash"] handler:^(YCMenuAction *action) {
            NSLog(@"==== %@ ",list[i]);
            [UIView addMJNotifierWithText:list[i] dismissAutomatically:YES];

        }];
        [actionArray addObject:action];
    }
    YCMenuView *view = [YCMenuView menuWithActions:actionArray width:150 relyonView:self.btn1];
    [view show];
    
}
- (IBAction)btn2Action:(id)sender {
    
    
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
