//
//  Regular.h
//  linjinsuo
//
//  Created by zcj on 2018/4/10.
//  Copyright © 2018年 admin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Regular : NSObject



/**
 用户名字   纯汉字
 
 @param name <#name description#>
 @return <#return value description#>
 */
+ (BOOL)getvalidateUserName:(NSString *)name;

/**
 手机号验证  11位
 
 @param phoneNumber <#phoneNumber description#>
 @return <#return value description#>
 */
+ (BOOL)getcheckPhone:(NSString *)phoneNumber;


/**
 邮箱验证
 
 @param Email <#Email description#>
 @return <#return value description#>
 */
+ (BOOL)getIsEmailAdress:(NSString *)Email;


/**
 验证QQ号长度 4-12 位
 
 @param strQQ <#strQQ description#>
 @return <#return value description#>
 */
+ (BOOL)getQQNum:(NSString *)strQQ;



/**
 手机号验证码   4 位纯数字
 
 @param auth <#auth description#>
 @return <#return value description#>
 */
+ (BOOL)getPhoneNumAouth:(NSString *)auth;


/**
 身份证验证
 
 @param Identity <#Identity description#>
 @return <#return value description#>
 */
+ (BOOL)getVerifyIdentityCardNum:(NSString *)Identity;

/**
 
 交易密码 设置  6位数字
 @param str <#str description#>
 @return <#return value description#>
 */
+ (BOOL)getDealCode:(NSString *)auth;
/**
 实名付 验证码 6位纯数字
 
 @param auth <#auth description#>
 @return <#return value description#>
 */
+ (BOOL)getSMFAouth:(NSString *)auth;
/**
 登陆密码 数字字母大小写下划线 6-20位
 
 @param str <#str description#>
 @return <#return value description#>
 */
+ (BOOL)getLogInPassWord:(NSString *)str;



/**
 昵称 4-20位 汉字大小字母 下划线
 
 @param str <#str description#>
 @return <#return value description#>
 */
+ (BOOL)getNickName:(NSString *)str;

/**
 图片验证  4 位数字大小写英文
 
 @param str <#str description#>
 @return <#return value description#>
 */
+ (BOOL)getPicAuth:(NSString *)str;
/**
 银行卡验证
 
 @param cardNumber <#cardNumber description#>
 @return <#return value description#>
 */
+(BOOL)getIsBankCardNum:(NSString *)cardNumber;


/**
 详细地址  汉字数字横线
 
 @param str <#str description#>
 @return <#return value description#>
 */
+(BOOL)getDetailAddress:(NSString *)str;
/**
 信用吗
 
 @param str <#str description#>
 @return <#return value description#>
 */
+ (BOOL)getXYM:(NSString *)str;

@end
