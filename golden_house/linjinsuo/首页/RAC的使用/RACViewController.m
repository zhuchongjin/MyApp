//
//  RACViewController.m
//  linjinsuo
//
//  Created by mac on 2019/4/2.
//  Copyright © 2019年 admin. All rights reserved.
//

#import "RACViewController.h"
#import <ReactiveObjC/ReactiveObjC.h>

@interface RACViewController ()
@property (strong, nonatomic) IBOutlet UIButton *btnRelpace;
@property (strong, nonatomic) IBOutlet UITextField *field1;
@property (strong, nonatomic) IBOutlet UILabel *lab1;
@property (strong, nonatomic) IBOutlet UIButton *btnSendMessage; //发送验证码\

@property (strong, nonatomic) IBOutlet UIButton *btnNetWorkGetData;
@property (nonatomic,assign) int time;
@property (nonatomic,strong) RACDisposable *dispoable;

@end

@implementation RACViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self setTitleName:@"RAC 的简单学习使用"];
    [self setBackLeftButton:@""];
    
    
    //代替btn
    [[self.btnRelpace rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
        NSLog(@"++++++++代替btn  %@",x);
    }];
    // 监听 field 数值
//    [self.field1.rac_textSignal subscribeNext:^(NSString * _Nullable x) {
//
//        self.lab1.text = x;
//
//    }];
    
    RAC(self.lab1,text) = self.field1.rac_textSignal;
    
    // 发送验证码
    
    @weakify(self);
    [[self.btnSendMessage rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
        @strongify(self);
        
        [self getCode];
        x.enabled = NO;
        self.time = 10;
        
        //这个就是RAC中的GCD
        self.dispoable = [[RACSignal interval:1.0 onScheduler:[RACScheduler mainThreadScheduler]] subscribeNext:^(NSDate * _Nullable x) {
            
            self.time --;
            NSString *strTitle = self.time > 0 ? LHStringWithFormat(@"请等待 %d 秒后 重试",self.time):@"发送验证码";
            [self.btnSendMessage setTitle:strTitle forState:UIControlStateNormal|UIControlStateDisabled];
            
            
            self.btnSendMessage.enabled = (self.time == 0)? YES:NO;
        }];
        
        
    }];

}

- (void)getCode{
    
    NSLog(@"获取验证码 ")
    
}

/**
 模拟网络请求

 @param sender <#sender description#>
 */
- (IBAction)btnNetWorkGetData:(UIButton *)sender {
    
    RACSignal *signal = [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
        NSLog(@"+++++ 发送网络请求");
        [subscriber sendNext:@"网络得到的数据"];
        return nil;
    }];
    
    RACMulticastConnection *connect = [signal publish];

    [connect.signal subscribeNext:^(id  _Nullable x) {
        NSLog(@"1  ===  %@",x);

    }];
    [connect connect];

//    [signal subscribeNext:^(id  _Nullable x) {
//
//        NSLog(@"1  ===  %@",x);
//    }];
}

/**
 RACSubject

 @param sender <#sender description#>
 */
- (IBAction)RACSubject:(UIButton *)sender {
    
    RACSubject *subject = [RACSubject subject];
    
    [subject subscribeNext:^(id  _Nullable x) {
        NSLog(@"RACSubject === %@",x);
        
    }];
    
    [subject sendNext:@"我是发送的数据"];
    
}

/**
 RACDisposable

 @param sender <#sender description#>
 */
- (IBAction)RACDisposable:(UIButton *)sender {
    
    RACSignal *signal = [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
        
        NSLog(@"创建一个信号 ");
        
        //发送
        [subscriber sendNext:@"发送信号了  那我"];
        
        NSLog(@"开始运行了么 ");
        
        return [RACDisposable disposableWithBlock:^{
            NSLog(@"disposable");

        }];
    }];
    
    // 订阅
    [signal subscribeNext:^(id  _Nullable x) {
        
        
        NSLog(@"收到信号了   %@",x);
    }];
}

/**
 常见信号 订阅 发送

 @param sender <#sender description#>
 */
- (IBAction)createSingle:(UIButton *)sender {
    
    RACSignal *signal = [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
        
        NSLog(@"创建一个信号 ");
        
        //发送
        [subscriber sendNext:@"发送信号了  那我"];
        
        NSLog(@"开始运行了么 ");

        return nil;
    }];
    
// 订阅
    [signal subscribeNext:^(id  _Nullable x) {


        NSLog(@"收到信号了   %@",x);
    }];
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
