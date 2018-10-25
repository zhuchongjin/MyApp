//
//  MyAlertView.m
//  linjinsuo
//
//  Created by zcj on 2018/4/2.
//  Copyright © 2018年 admin. All rights reserved.
//

#import "MyAlertView.h"
#define TagValue  1000
#define AlertTime 0.3 //弹出动画时间
#define DropTime 0.5 //落下动画时间

@interface MyAlertView()<UITextFieldDelegate>

@property(nonatomic,strong)UILabel *titleLB;
@property(nonatomic,strong)UILabel *ContentLB;
@property(nonatomic,strong)NSString *RiskStatus;
@property(nonatomic,strong)UIButton *cancleBtn;
@property(nonatomic,strong)UIButton *sureBtn;
@property(nonatomic,strong)NSString *type;
@property(strong,nonatomic) UITextField * moeny;
@property(strong,nonatomic) UITextField * password;
@property(nonatomic,copy)NSDictionary *dic;

@end

@implementation MyAlertView
-(instancetype)initWithFrame:(CGRect)frame withTitle:(NSString *)title alertMessage:(NSString *)msg  type:(NSString *)type WithNsmutaleArray:(NSMutableArray *)mutaleArray confrimBlock:(OnSureButtonClick)confrimBlock callblock:(OnCancleButtonClick)callblock{
    if (IsNilOrNull(mutaleArray)) {
        
    }else{
        NSLog(@"%@",mutaleArray);
        self.dic =  mutaleArray[0];
    }
    
    
    if (self = [super initWithFrame:frame]) {
        if ([type isEqualToString:@"2"]) {
            [self customUI1with:frame title:title message:msg type:type];
        }else
        {    // type   = 0   票据详情
            [self customUIwith:frame title:title message:msg type:type];
        }
        self.type = type;
        _sureBlock = confrimBlock;
        _cancleBlock = callblock;
    }
    return self;
}

-(void)customUI1with:(CGRect)frame title:(NSString *)title message:(NSString *)msg type:(NSString *)type{
    
    self.backgroundColor = LHWhiteColor;
    self.layer.masksToBounds = YES;
    self.layer.cornerRadius = 5;
    
    
    _titleLB = [[UILabel alloc] initWithFrame:CGRectMake(10, 15, self.frame.size.width, 20)];
    _titleLB.textColor = ThemeTextColor;
    _titleLB.text = title;
    _titleLB.textAlignment = NSTextAlignmentCenter;
    _titleLB.font = [UIFont systemFontOfSize:17];
    [self addSubview:_titleLB];
    
    self.moeny = [[UITextField alloc]initWithFrame:CGRectMake(90, _titleLB.bottom+10, self.width-100, 40)];
    self.moeny.leftView=[[UIView alloc] initWithFrame:CGRectMake(0, 0, 5, 40)];
    self.moeny.leftViewMode=UITextFieldViewModeAlways;
    self.moeny.delegate = self;
    self.moeny.placeholder = L(msg);
    self.moeny.layer.borderWidth=1.0f;
    self.moeny.layer.cornerRadius = 6.0f;
    self.moeny.layer.borderColor=[UIColor colorWithRed:0xbf/255.0f green:0xbf/255.0f blue:0xbf/255.0f alpha:1].CGColor;
    self.moeny.font = [UIFont systemFontOfSize:14];
    self.moeny.keyboardType = UIKeyboardTypeDecimalPad;
    self.moeny.clearButtonMode = UITextFieldViewModeWhileEditing;
    self.moeny.returnKeyType = UIReturnKeyNext;
    [self addSubview:self.moeny];
    
    
    UILabel * rengou = [[UILabel alloc]initWithFrame:CGRectMake(10, _titleLB.bottom+10, 80, 40)];
    rengou.text = @"认购金额：*";
    rengou.font = LHTitleFont14;
    rengou.textColor = ThemeTextColor;
    [self addSubview:rengou];
    
    self.password = [[UITextField alloc]initWithFrame:CGRectMake(90, self.moeny.bottom+10, self.width-100, 40)];
    self.password.leftView=[[UIView alloc] initWithFrame:CGRectMake(0, 0, 5, 40)];
    self.password.leftViewMode=UITextFieldViewModeAlways;
    self.password.layer.borderWidth=1.0f;
    self.password.layer.cornerRadius = 6.0f;
    self.password.layer.borderColor=[UIColor colorWithRed:0xbf/255.0f green:0xbf/255.0f blue:0xbf/255.0f alpha:1].CGColor;
    self.password.delegate = self;
    self.password.keyboardType = UIKeyboardTypeNumberPad;
    self.password.placeholder =  L(@"请输入交易密码");
    self.password.font = [UIFont systemFontOfSize:14];
    self.password.clearButtonMode = UITextFieldViewModeWhileEditing;
    self.password.secureTextEntry = YES;
    self.password.returnKeyType = UIReturnKeyDone;
    [self addSubview:self.password];
    
    
    UILabel * pass = [[UILabel alloc]initWithFrame:CGRectMake(10, self.moeny.bottom+10, 80, 40)];
    pass.text = @"交易密码：*";
    pass.font = LHTitleFont14;
    pass.textColor = ThemeTextColor;
    [self addSubview:pass];
    
    
    _cancleBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [_cancleBtn setTitle:@"取消" forState:UIControlStateNormal];
    [_cancleBtn setTitleColor:ThemeTextColor forState:UIControlStateNormal];
    _cancleBtn.frame = CGRectMake(0, self.frame.size.height-45, self.width/2, 40);
    [self addSubview:_cancleBtn];
    [_cancleBtn addTarget:self action:@selector(cancleBtnClick) forControlEvents:UIControlEventTouchUpInside];
    
    
    _sureBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [_sureBtn setTitle:@"确认" forState:UIControlStateNormal];
    [_sureBtn setTitleColor:ThemesColor forState:UIControlStateNormal];
    _sureBtn.frame = CGRectMake(self.width/2, self.frame.size.height-45, self.width/2, 40);
    [self addSubview:_sureBtn];
    [_sureBtn addTarget:self action:@selector(sureBtnClick) forControlEvents:UIControlEventTouchUpInside];
    
    UILabel * back2 = [[UILabel alloc]initWithFrame:CGRectMake(0, _sureBtn.top-5, self.width, 1)];
    back2.backgroundColor = LHBackgroundColor;
    [self addSubview:back2];
    
    UILabel * back1 = [[UILabel alloc]initWithFrame:CGRectMake(self.width/2, _sureBtn.top-5, 1, 50)];
    back1.backgroundColor = LHBackgroundColor;
    [self addSubview:back1];
}
-(void)customUIwith:(CGRect)frame title:(NSString *)title message:(NSString *)msg type:(NSString *)type{
    
    NSLog(@"------%@",title);
    NSLog(@"======%@",msg);
    
    //    NSDictionary *dic = self.mutableArray[0];
    //    NSLog(@"++++++++%@",self.dic);
    
    self.RiskStatus = @"1";
    self.backgroundColor = LHWhiteColor;
    self.layer.masksToBounds = YES;
    self.layer.cornerRadius = 5;
    
    _titleLB = [[UILabel alloc] initWithFrame:CGRectMake(10, 15, self.width - 20, 20)];
    _titleLB.textColor = ThemeLightTextColor;
    _titleLB.text = title;
    _titleLB.textAlignment = NSTextAlignmentLeft;
    _titleLB.font = [UIFont systemFontOfSize:15];
    [self addSubview:_titleLB];
    if ([type isEqualToString:@"0"]) {
        
        self.moeny = [[UITextField alloc]initWithFrame:CGRectMake(90, _titleLB.bottom+10, self.width-100, 40)];
        self.moeny.delegate = self;
        NSString *str = [NSString stringWithFormat:@"认购金额为%@的倍数",self.dic[@"stepAmount"]];
        self.moeny.placeholder = L(str);
        self.moeny.font = [UIFont systemFontOfSize:14];
        self.moeny.clearButtonMode = UITextFieldViewModeWhileEditing;
        self.moeny.returnKeyType = UIReturnKeyNext;
        self.moeny.keyboardType = UIKeyboardTypeNumberPad;
        [self addSubview:self.moeny];
        
        UILabel * back = [[UILabel alloc]initWithFrame:CGRectMake(10, self.moeny.bottom, self.width-20, 1)];
        back.backgroundColor = LHBackgroundColor;
        [self addSubview:back];
        
        UILabel * rengou = [[UILabel alloc]initWithFrame:CGRectMake(10, _titleLB.bottom+10, 80, 40)];
        rengou.text = @"认购金额：";
        rengou.font = LHTitleFont14;
        rengou.textColor = ThemeTextColor;
        [self addSubview:rengou];
        
        self.password = [[UITextField alloc]initWithFrame:CGRectMake(90, self.moeny.bottom+10, self.width-100, 40)];
        self.password.delegate = self;
        self.password.placeholder =  L(@"请输入交易密码");
        self.password.font = [UIFont systemFontOfSize:14];
        self.password.keyboardType = UIKeyboardTypeNumberPad;
        self.password.clearButtonMode = UITextFieldViewModeWhileEditing;
        self.password.secureTextEntry = YES;
        self.password.returnKeyType = UIReturnKeyDone;
        [self addSubview:self.password];
        
        UILabel * back2 = [[UILabel alloc]initWithFrame:CGRectMake(10, self.password.bottom, self.width-20, 1)];
        back2.backgroundColor = LHBackgroundColor;
        [self addSubview:back2];
        
        UILabel * pass = [[UILabel alloc]initWithFrame:CGRectMake(10, self.moeny.bottom+10, 80, 40)];
        pass.text = @"交易密码：";
        pass.font = LHTitleFont14;
        pass.textColor = ThemeTextColor;
        [self addSubview:pass];
        
        UIButton *remebi = [UIButton buttonWithType:UIButtonTypeCustom];
        remebi.frame = CGRectMake(10, self.password.bottom+10,110, 20);
        [remebi setTitle:L(@"我已阅读并同意") forState:UIControlStateNormal];
        remebi.isIgnore = YES;
        [remebi setImage:[UIImage imageNamed:@"checkbox_reg_normal"] forState:UIControlStateSelected];
        [remebi setImage:[UIImage imageNamed:@"checkbox_reg_pressed"] forState:UIControlStateNormal];
        [remebi setTitleColor:ThemeLightTextColor forState:UIControlStateNormal];
        remebi.titleLabel.font = [UIFont systemFontOfSize:13];
        [remebi addTarget:self action:@selector(remebi:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:remebi];
        
        UIButton * goRisk = [UIButton buttonWithType:UIButtonTypeCustom];
        [goRisk setTitle:L(@"风险揭示协议") forState:UIControlStateNormal];
        goRisk.titleLabel.font = [UIFont systemFontOfSize:13];
        goRisk.titleLabel.textAlignment = NSTextAlignmentLeft;
        [goRisk setTitleColor:TargetColor forState:UIControlStateNormal];
        [goRisk addTarget:self action:@selector(goRisk) forControlEvents:UIControlEventTouchUpInside];
        goRisk.frame = CGRectMake(remebi.right-10, self.password.bottom+10,100, 20);
        
        [self addSubview:goRisk];
        
    }else
    {
        self.password = [[UITextField alloc]initWithFrame:CGRectMake(90, _titleLB.bottom+10, SCREEN_WIDTH-135, 40)];
        self.password.delegate = self;
        self.password.placeholder =  L(@"请输入交易密码");
        self.password.font = [UIFont systemFontOfSize:14];
        self.password.keyboardType = UIKeyboardTypeNumberPad;
        self.password.clearButtonMode = UITextFieldViewModeWhileEditing;
        self.password.secureTextEntry = YES;
        self.password.returnKeyType = UIReturnKeyDone;
        [self addSubview:self.password];
        
        UILabel * back2 = [[UILabel alloc]initWithFrame:CGRectMake(10, self.password.bottom, self.width-20, 1)];
        back2.backgroundColor = LHBackgroundColor;
        [self addSubview:back2];
        
        UILabel * pass = [[UILabel alloc]initWithFrame:CGRectMake(10, _titleLB.bottom+10, 80, 40)];
        pass.text = @"交易密码：";
        pass.font = LHTitleFont14;
        pass.textColor = ThemeTextColor;
        [self addSubview:pass];
    }
    
    
    _cancleBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [_cancleBtn setTitle:@"取消" forState:UIControlStateNormal];
    [_cancleBtn setTitleColor:ThemeTextColor forState:UIControlStateNormal];
    _cancleBtn.frame = CGRectMake(0, self.frame.size.height-45, self.width/2, 40);
    [self addSubview:_cancleBtn];
    [_cancleBtn addTarget:self action:@selector(cancleBtnClick) forControlEvents:UIControlEventTouchUpInside];
    
    
    _sureBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [_sureBtn setTitle:@"确认" forState:UIControlStateNormal];
    [_sureBtn setTitleColor:ThemesColor forState:UIControlStateNormal];
    _sureBtn.frame = CGRectMake(self.width/2, self.frame.size.height-45, self.width/2, 40);
    [self addSubview:_sureBtn];
    [_sureBtn addTarget:self action:@selector(sureBtnClick) forControlEvents:UIControlEventTouchUpInside];
    
    UILabel * back2 = [[UILabel alloc]initWithFrame:CGRectMake(0, _sureBtn.top-5, self.width, 1)];
    back2.backgroundColor = LHBackgroundColor;
    [self addSubview:back2];
    
    UILabel * back1 = [[UILabel alloc]initWithFrame:CGRectMake(self.width/2, _sureBtn.top-5, 1, 50)];
    back1.backgroundColor = LHBackgroundColor;
    [self addSubview:back1];
}
-(void)remebi:(UIButton *)sender
{
    if (sender.selected == YES) {
        sender.selected = NO;
        self.RiskStatus =@"1";
    }else
    {
        sender.selected = YES;
        self.RiskStatus =@"0";
    }
}
-(void)goRisk
{
    if ([self.delegate respondsToSelector:@selector(cycleScrollViewDidScrollView:)]) {
        [self.delegate cycleScrollViewDidScrollView:@""];
    }
    
}
-(void)cancleBtnClick{
    [self hide];
    
    if (_cancleBlock) {
        _cancleBlock();
    }
}
-(void)sureBtnClick{
    
    // 判断   type  2
    
    if (_sureBlock && [_type isEqualToString:@"2"]) {
        
        //认购金额
        if ([self.moeny.text isEqualToString:@""]) {
            [self alertControllerTitle:@"认购金额不能为空"];
            return;
        }else if (![Regular getDealCode:self.password.text]){
            [self alertControllerTitle:@"交易密码为6位纯数字"];
            return;
        }else{
            
        }
        
    }
    
    
    // type == 0 票据详情
    if (_sureBlock && [_type isEqualToString:@"0"]) {
        
        NSString *str_stepAmount = [NSString stringWithFormat:@"%@",self.dic[@"stepAmount"]];
        BOOL isMultipleOfTen = ![self judgeStr:str_stepAmount with:self.moeny.text];
        // 最低可投金额  minBidAmt
        int minBidAmt = [self.dic[@"minBidAmt"] intValue];
        //最高可投金额   maxBidAmt
        int maxBidAmt = [self.dic[@"maxBidAmt"] intValue];
        
        // 剩余金额
        
        int canInvestA = [self.dic[@"canInvestAmt"] intValue];

        NSLog(@"+++++%d",canInvestA);
        
        //认购金额
        if ([self.moeny.text isEqualToString:@""]) {
            [self alertControllerTitle:@"认购金额不能为空"];
            return;
        }else if ([self.moeny.text isEqualToString:@"0"]){
            [self alertControllerTitle:[NSString stringWithFormat:@"认购金额为%@的整数倍",str_stepAmount]];
            return;
            
        }else if ([self.moeny.text isEqualToString:@"0."]){
            [self alertControllerTitle:[NSString stringWithFormat:@"认购金额为%@的整数倍",str_stepAmount]];
            return;
        }else if ([self.moeny.text isEqualToString:@"0.0"]){
            [self alertControllerTitle:[NSString stringWithFormat:@"认购金额为%@的整数倍",str_stepAmount]];
            return;
        }else if ([self.moeny.text isEqualToString:@"0.00"]){
            [self alertControllerTitle:[NSString stringWithFormat:@"认购金额为%@的整数倍",str_stepAmount]];
            return;
        }else if (![self.moeny.text isEqualToString:@""] && isMultipleOfTen == YES ){
            
            [self alertControllerTitle:[NSString stringWithFormat:@"认购金额为%@的整数倍",str_stepAmount]];
            return;
        }else if ([self.moeny.text intValue] < minBidAmt  &&canInvestA > minBidAmt){
            
            [self alertControllerTitle:[NSString stringWithFormat:@"最低起投金额不得低于%@",self.dic[@"minBidAmt"]]];
            return;
        }else if ([self.moeny.text intValue] > maxBidAmt){
            [self alertControllerTitle:[NSString stringWithFormat:@"最高起投金额不得高于%@",self.dic[@"maxBidAmt"]]];
            return;
        }else if ([self.moeny.text intValue] < minBidAmt  && canInvestA <  minBidAmt){
            if ([self.moeny.text intValue] != canInvestA ) {
            [self alertControllerTitle:[NSString stringWithFormat:@"尾标金额必须为%@",self.dic[@"canInvestAmt"]]];
            return;
            }else{}
        }
        
        else if (![Regular getDealCode:self.password.text]){
            [self alertControllerTitle:@"交易密码为6位纯数字"];
            return;
        }
        else{}
        
    }
    
    if (_sureBlock) {
        if ([_type isEqualToString:@"1"]) {
            NSString * passwords = self.password.text;
            _sureBlock(passwords,@"",@"");
        }else
        {
            NSString * passwords = self.password.text;
            NSString * passwords1 = self.moeny.text;
            _sureBlock(passwords1,passwords,self.RiskStatus);
        }
        
    }
}
-(BOOL)judgeStr:(NSString *)str1 with:(NSString *)str2

{
    
    int a=[str1 intValue];
    
    double s1=[str2 doubleValue];
    
    long int s2=[str2 longLongValue];
    
    
    
    if (s1/a-s2/a>0) {
        
        return NO;
        
    }
    
    return YES;
    
}

-(void)show{
    if (self.superview) {
        [self removeFromSuperview];
    }
    UIView *oldView = [[UIApplication sharedApplication].keyWindow viewWithTag:TagValue];
    if (oldView) {
        [[UIApplication sharedApplication].keyWindow removeFromSuperview];
    }else
    {
        UIView *iview = [[UIView alloc] initWithFrame:[UIApplication sharedApplication].keyWindow.bounds];
        iview.tag = TagValue;
        iview.userInteractionEnabled = YES;
        iview.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.6];
        [[UIApplication sharedApplication].keyWindow addSubview:iview];
        [[UIApplication sharedApplication].keyWindow addSubview:self];
        self.centerY = [UIApplication sharedApplication].keyWindow.centerY -50;
        self.centerX = [UIApplication sharedApplication].keyWindow.centerX;
        self.alpha = 0;
        self.transform = CGAffineTransformScale(self.transform,0.1,0.1);
        [UIView animateWithDuration:AlertTime animations:^{
            self.transform = CGAffineTransformIdentity;
            self.alpha = 1;
        }];
        
    }
    
}


//弹出隐藏
-(void)hide{
    if (self.superview) {
        [UIView animateWithDuration:AlertTime animations:^{
            self.transform = CGAffineTransformScale(self.transform,0.1,0.1);
            self.alpha = 0;
        } completion:^(BOOL finished) {
            UIView *bgview = [[UIApplication sharedApplication].keyWindow viewWithTag:TagValue];
            if (bgview) {
                [bgview removeFromSuperview];
            }
            [self removeFromSuperview];
        }];
    }
}

/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */

#pragma mark -------  UItextFielddete


- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    
    
    NSString *strTextField = [textField.text stringByReplacingCharactersInRange:range withString:string];
    
    if (![string isEqualToString:@""]) {
        
        if ([textField isEqual:self.moeny]) {
            
            //首位 是否 .
            if ([[strTextField substringWithRange:NSMakeRange(0, 1)] isEqualToString:@"."]) {
                [self alertControllerTitle:@"第一位不能输入小数点"];
                return NO;
            }
            
            
            // 首位位0  第二位必须为.
            if ([[strTextField substringWithRange:NSMakeRange(0, 1)] isEqualToString:@"0"] && strTextField.length == 2) {
                
                if ([[strTextField substringWithRange:NSMakeRange(1, 1)] isEqualToString:@"."]) {
                    
                    return YES;
                }else{
                    return NO;
                }
                
            }
            
            //获取小数点的位置
            NSInteger dotLocation = [strTextField rangeOfString:@"."].location;
            
            if (dotLocation != NSNotFound && range.location > dotLocation + 2) {
                
                [self alertControllerTitle:@"小数点后最多两位"];
                return NO;
                
            }else if (dotLocation != NSNotFound && range.location == dotLocation + 1){
                
                if ([string isEqualToString:@"."]) {
                    return NO;
                }
                
            }else if (dotLocation != NSNotFound && range.location == dotLocation + 2){
                
                if ([string isEqualToString:@"."]) {
                    return NO;
                }
                
                
            }else{}
        }
    }
    
    return YES;
    
}


- (void)alertControllerTitle:(NSString *)str{
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"提示" message:str delegate:self cancelButtonTitle:nil otherButtonTitles:@"确定", nil];
    [alert show];
}



@end

