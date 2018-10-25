//
//  Regular.m
//  linjinsuo
//
//  Created by zcj on 2018/4/10.
//  Copyright © 2018年 admin. All rights reserved.
//

#import "Regular.h"

@implementation Regular


/**
 用户名字   纯汉字
 
 @param name <#name description#>
 @return <#return value description#>
 */
+ (BOOL)getvalidateUserName:(NSString *)name
{
    name = [name stringByReplacingOccurrencesOfString:@" " withString:@""];
    NSString *userNameRegex = @"^[\u4e00-\u9fa5]{2,6}+$";
    NSPredicate *userNamePredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",userNameRegex];
    BOOL B = [userNamePredicate evaluateWithObject:name];
    return B;
}


/**
 手机号验证  11位
 
 @param phoneNumber <#phoneNumber description#>
 @return <#return value description#>
 */
+ (BOOL)getcheckPhone:(NSString *)phoneNumber

{
    phoneNumber = [phoneNumber stringByReplacingOccurrencesOfString:@" " withString:@""];
    
    if (phoneNumber.length != 11) {
        return NO;
    }
    
    NSString *regex = @"^((19[0-9])|(13[0-9])|(147)|(15[^4,\\D])|(18[0-9])|(17[0-9]))\\d{8}$";
    
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    
    BOOL isMatch = [pred evaluateWithObject:phoneNumber];
    
    if (!isMatch)
    {
        
        return NO;
        
    }
    return YES;
    
}

/**
 邮箱验证
 
 @param Email <#Email description#>
 @return <#return value description#>
 */
+ (BOOL)getIsEmailAdress:(NSString *)Email
{
    Email = [Email stringByReplacingOccurrencesOfString:@" " withString:@""];
    NSString *emailCheck = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES%@",emailCheck];
    return [emailTest evaluateWithObject:Email];
}


/**
 验证QQ号长度 4-12 位
 
 @param strQQ <#strQQ description#>
 @return <#return value description#>
 */
+ (BOOL)getQQNum:(NSString *)strQQ{
    
    strQQ = [strQQ stringByReplacingOccurrencesOfString:@" " withString:@""];
    NSString *QQNum = @"[1-9][0-9]{4,12}";
    NSPredicate *QQTest = [NSPredicate predicateWithFormat:@"SELF MATCHES%@",QQNum];
    
    return [QQTest evaluateWithObject:strQQ];
}


/**
 手机号验证码   4 位纯数字
 
 @param auth <#auth description#>
 @return <#return value description#>
 */
+ (BOOL)getPhoneNumAouth:(NSString *)auth{
    
    auth = [auth stringByReplacingOccurrencesOfString:@" " withString:@""];
    NSString *QQNum = @"[0-9]{4}";
    NSPredicate *QQTest = [NSPredicate predicateWithFormat:@"SELF MATCHES%@",QQNum];
    
    return [QQTest evaluateWithObject:auth];
}


/**
 实名付 验证码 6位纯数字
 
 @param auth <#auth description#>
 @return <#return value description#>
 */
+ (BOOL)getSMFAouth:(NSString *)auth{
    
    auth = [auth stringByReplacingOccurrencesOfString:@" " withString:@""];
    NSString *QQNum = @"[0-9]{6}";
    NSPredicate *QQTest = [NSPredicate predicateWithFormat:@"SELF MATCHES%@",QQNum];
    
    return [QQTest evaluateWithObject:auth];
}



/**
 
 交易密码 设置  6位数字
 @param str <#str description#>
 @return <#return value description#>
 */
+ (BOOL)getDealCode:(NSString *)auth{
    
    auth = [auth stringByReplacingOccurrencesOfString:@" " withString:@""];
    NSString *QQNum = @"[0-9]{6}";
    NSPredicate *QQTest = [NSPredicate predicateWithFormat:@"SELF MATCHES%@",QQNum];
    
    return [QQTest evaluateWithObject:auth];
}

/**
 身份证验证
 
 @param Identity <#Identity description#>
 @return <#return value description#>
 */
+ (BOOL)getVerifyIdentityCardNum:(NSString *)Identity{
    
    Identity = [Identity stringByReplacingOccurrencesOfString:@" " withString:@""];
    if (Identity.length <= 0) {
        return NO;
    }
    
    NSString *QQNum = @"^(\\d{14}|\\d{17})(\\d|[xX])$";
    NSPredicate *QQTest = [NSPredicate predicateWithFormat:@"SELF MATCHES%@",QQNum];
    
    return [QQTest evaluateWithObject:Identity];
    
}


/**
 登陆  密码 数字 字母大小写 下划线 6-20位
 
 @param str <#str description#>
 @return <#return value description#>
 */
+ (BOOL)getLogInPassWord:(NSString *)str{
    
    str = [str stringByReplacingOccurrencesOfString:@" " withString:@""];
    NSString *QQNum = @"[a-zA-Z0-9_]{6,20}";
    NSPredicate *QQTest = [NSPredicate predicateWithFormat:@"SELF MATCHES%@",QQNum];
    
    return [QQTest evaluateWithObject:str];
    
}


/**
 昵称 4-20位 汉字大小字母 下划线
 
 @param str <#str description#>
 @return <#return value description#>
 */
+ (BOOL)getNickName:(NSString *)str{
    
    str = [str stringByReplacingOccurrencesOfString:@" " withString:@""];
    NSString *QQNum = @"[\u4e00-\u9fa5_a-zA-Z0-9_]{2,20}";
    NSPredicate *QQTest = [NSPredicate predicateWithFormat:@"SELF MATCHES%@",QQNum];
    
    return [QQTest evaluateWithObject:str];
    
}

/**
 图片验证  4 位数字大小写英文
 
 @param str <#str description#>
 @return <#return value description#>
 */
+ (BOOL)getPicAuth:(NSString *)str{
    
    str = [str stringByReplacingOccurrencesOfString:@" " withString:@""];
    NSString *QQNum = @"[a-zA-Z0-9]{4}";
    NSPredicate *QQTest = [NSPredicate predicateWithFormat:@"SELF MATCHES%@",QQNum];
    
    return [QQTest evaluateWithObject:str];
    
}


/**
 银行卡验证
 
 @param cardNumber <#cardNumber description#>
 @return <#return value description#>
 */
+(BOOL)getIsBankCardNum:(NSString *)cardNumber{
    if(cardNumber.length==0){
        return NO;
    }
    NSString *digitsOnly = @"";
    char c;
    for (int i = 0; i < cardNumber.length; i++){
        c = [cardNumber characterAtIndex:i];
        if (isdigit(c)){
            digitsOnly =[digitsOnly stringByAppendingFormat:@"%c",c];
        }
    }
    int sum = 0;
    int digit = 0;
    int addend = 0;
    BOOL timesTwo = false;
    for (NSInteger i = digitsOnly.length - 1; i >= 0; i--){
        digit = [digitsOnly characterAtIndex:i] - '0';
        if (timesTwo){
            addend = digit * 2;
            if (addend > 9) {
                addend -= 9;
            }
        }
        else {
            addend = digit;
        }
        sum += addend;
        timesTwo = !timesTwo;
    }
    int modulus = sum % 10;
    return modulus == 0;
}

/**
 详细地址  汉字数字横线
 
 @param str <#str description#>
 @return <#return value description#>
 */
+(BOOL)getDetailAddress:(NSString *)str{
    
    //    str = [str stringByReplacingOccurrencesOfString:@" " withString:@""];
    NSString *QQNum = @"[A-Za-z0-9_()\\-\\u4e00-\\u9fa5]{1,50}";
    
    //    NSString *QQNum = @"[\u4e00-\u9fa5_a-zA-Z0-9_]{1,50}";
    
    NSPredicate *QQTest = [NSPredicate predicateWithFormat:@"SELF MATCHES%@",QQNum];
    
    return [QQTest evaluateWithObject:str];
}




/**
 信用码
 
 @param str <#str description#>
 @return <#return value description#>
 */
+ (BOOL)getXYM:(NSString *)str{
    
    str = [str stringByReplacingOccurrencesOfString:@" " withString:@""];
    NSString *QQNum = @"[A-Z0-9]{18,20}";
    NSPredicate *QQTest = [NSPredicate predicateWithFormat:@"SELF MATCHES%@",QQNum];
    
    return [QQTest evaluateWithObject:str];
    
}



//NSDictionary *dic = responseBody[@"Head"];
//
//if (!IsNilOrNull(dic)) {
//    [ws.view showImageHUDText:[NSString stringWithFormat:@"%@",dic[@"msg"]]];
//}else{
//    NSLog(@"注册失败");
//}



//- (void)alertControllerTitle:(NSString *)str{
//    
//    UIAlertController *alert = [UIAlertController alertControllerWithTitle:str message:nil preferredStyle:UIAlertControllerStyleAlert];
//    UIAlertAction *action = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleCancel handler:nil];
//    [alert addAction:action];
//    [self presentViewController:alert animated:YES completion:nil];
//    
//}

@end
