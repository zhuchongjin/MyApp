//
//  Util.m
//  linjinsuo
//
//  Created by zcj on 2018/4/4.
//  Copyright © 2018年 admin. All rights reserved.
//

#import "Util.h"
#import <sys/utsname.h>

@implementation Util


//
//+ (void)getAuthCodePictureWith:(UIImageView *)imageV{
//
//    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
//
//    NSString *strCookieValue = @"";
//
//    if (!IsNilOrNull([userDefaults objectForKey:@"UserInfo"])) {
//        strCookieValue = [NSString stringWithFormat:@"%@",[[userDefaults objectForKey:@"UserInfo"] objectForKey:@"linKingTokenSid"]];
//    }
//
//    //    NSLog(@"---------%@",[NSString stringWithFormat:@"%@",[[userDefaults objectForKey:@"UserInfo"] objectForKey:@"linKingTokenPid"]]);
//    //    NSLog(@"+++++++++%@",strCookieValue);
//    //    NSLog(@"sidsid%@",strCookieValue);
//    NSString *value = [NSString stringWithFormat:@"linKingTokenSid=%@",strCookieValue];
//
//    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@%d",AuthCodeUrl,arc4random_uniform(100000000)]];
//    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url];
//    // 添加header
//    NSMutableURLRequest *mutableRequest = [request mutableCopy];    //拷贝request
//
//    [mutableRequest addValue:value forHTTPHeaderField:@"Cookie"];
//    request = [mutableRequest copy];
//     //   NSLog(@"%@",mutableRequest.allHTTPHeaderFields);
//
//    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
//    NSFileManager*fileManager = [NSFileManager defaultManager];
//    // 储存 filePath
//    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
//    //    NSLog(@"+++%@",[defaults objectForKey:@"filePath"]);
//
//    [defaults synchronize];
//    [fileManager removeItemAtPath:[defaults objectForKey:@"filePath"] error:nil];
//
//    BOOL isFile = [fileManager fileExistsAtPath:[defaults objectForKey:@"filePath"]];
//    if (isFile) {
//
//        NSLog(@"缓存删除失败");
//    }else{
//
//        NSLog(@"缓存删除成功");
//    }
//    ////    NSLog(@"temp目录内容：删除之后：%@",[fileManager contentsOfDirectoryAtPath:[defaults objectForKey:@"filePath"] error:nil]);
//    NSURLSessionDownloadTask *download = [manager downloadTaskWithRequest:request progress:^(NSProgress * _Nonnull downloadProgress) {
//
//    } destination:^NSURL * _Nonnull(NSURL * _Nonnull targetPath, NSURLResponse * _Nonnull response) {
//
//        NSError *error = nil;
//        NSURL *URL = [[NSFileManager defaultManager] URLForDirectory:NSDocumentDirectory inDomain:NSUserDomainMask appropriateForURL:nil create:NO error:&error];
//
//        return[URL URLByAppendingPathComponent:[response suggestedFilename]isDirectory:NO];
//
//    } completionHandler:^(NSURLResponse * _Nonnull response, NSURL * _Nullable filePath, NSError * _Nullable error) {
//        //        NSLog(@"temp目录内容：%@",[filePath path]);
//        [defaults setObject:[filePath path] forKey:@"filePath"];
//        BOOL isFile = [fileManager fileExistsAtPath:[filePath path]];
//
//        if (isFile) {
//            dispatch_async(dispatch_get_main_queue(), ^{
//                //设置图片视图的的图片
//                imageV.image= [UIImage imageWithContentsOfFile:[defaults objectForKey:@"filePath"]];
//            });
//        }else{
//            NSLog(@"filePath is not");
//        }
//        //        NSLog(@"++++++++%@",[filePath path]);
//        //        NSLog(@"--------%@",[defaults objectForKey:@"filePath"])
//        //        [fileManager removeItemAtPath:[defaults objectForKey:@"filePath"] error:nil];
//        //        NSLog(@"temp目录内容：删除之后：%@",[fileManager contentsOfDirectoryAtPath:[defaults objectForKey:@"filePath"] error:nil]);
//    }];
//
//
//    [download resume];
//
//}


+ (NSString *)getSid{
    
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    NSDictionary * userinfo = [userDefault objectForKey:@"UserInfo"];
    if (IsNilOrNull(userinfo)) {
        return @"";
    }
    
    return [NSString stringWithFormat:@"%@",[userinfo valueForKey:@"linKingTokenSid"]];
}
+ (NSString *)getPid{
    
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    NSDictionary * userinfo = [userDefault objectForKey:@"UserInfo"];
    if (IsNilOrNull(userinfo)) {
        return @"";
    }
    
    return [NSString stringWithFormat:@"%@",[userinfo valueForKey:@"linKingTokenPid"]];
}
+(NSString *)replaceStringWithAsterisk:(NSString *)originalStr startLocation:(NSInteger)startLocation lenght:(NSInteger)lenght
{
    NSString *newStr = originalStr;
    
    for (int i = 0; i < lenght; i++) {
        
        NSRange range = NSMakeRange(startLocation, 1);
        
        newStr = [newStr stringByReplacingCharactersInRange:range withString:@"*"];
        
        startLocation ++;
    }
    
    return newStr;
}
+ (UILabel *)labelWithFrame:(CGRect)frame backgroundColor:(UIColor *)backgroundColor  cornerRadius:(float)cornerRadius font:(UIFont *)font textColor:(UIColor *)textColor textAlignment:(NSTextAlignment)textAlignment text:(NSString *)text{
    UILabel *view = [[UILabel alloc] initWithFrame:frame];
    
    if (backgroundColor) {
        view.backgroundColor = backgroundColor;
    }
    
    if (cornerRadius > 0) {
        view.layer.cornerRadius = cornerRadius;
        view.layer.masksToBounds = YES;
    }
    
    if (font) {
        view.font = font;
    }
    
    if (textColor) {
        view.textColor = textColor;
    }
    
    view.textAlignment = textAlignment;
    
    if (text) {
        view.text = text;
    }
    
    return view;
}

+ (UIButton *)buttonWithFrame:(CGRect)frame title:(NSString *)title titleColor:(UIColor *)titleColor backgroundColor:(UIColor *)backgroundColor titleFont:(UIFont *)titleFont cornerRadius:(float)cornerRadius Target:(id)target action:(SEL)action{
    UIButton *view = [UIButton buttonWithType:UIButtonTypeCustom];
    
    view.frame = frame;
    
    if (title) {
        [view setTitle:title forState:UIControlStateNormal];
    }
    
    if (titleColor) {
        [view setTitleColor:titleColor forState:UIControlStateNormal];
    }
    
    
    if (backgroundColor) {
        view.backgroundColor = backgroundColor;
    }
    
    if (titleFont) {
        view.titleLabel.font = titleFont;
    }
    
    if (cornerRadius > 0) {
        view.layer.cornerRadius = cornerRadius;
        view.layer.masksToBounds = YES;
    }
    
    if (target && action) {
        [view addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    }
    
    return view;
}

+ (UIView *)viewWithFrame:(CGRect)frame backgroundColor:(UIColor *)backgroundColor  cornerRadius:(float)cornerRadius{
    UIView *view = [[UIView alloc] initWithFrame:frame];
    
    if (backgroundColor) {
        view.backgroundColor = backgroundColor;
    }
    
    
    if (cornerRadius > 0) {
        view.layer.cornerRadius = cornerRadius;
        view.layer.masksToBounds = YES;
    }
    
    return view;
}

+ (UIImageView *)imageViewWithFrame:(CGRect)frame backgroundColor:(UIColor *)backgroundColor borderColor:(UIColor *)borderColor cornerRadius:(float)cornerRadius image:(UIImage *)image contentMode:(NSNumber *)contentMode{
    UIImageView *view = [[UIImageView alloc] initWithFrame:frame];
    
    if (backgroundColor) {
        view.backgroundColor = backgroundColor;
    }

    if (cornerRadius > 0) {
        view.layer.cornerRadius = cornerRadius;
        view.layer.masksToBounds = YES;
    }
    
    if (image) {
        [view setImage:image];
    }
    
    if (contentMode) {
        view.contentMode = [contentMode integerValue];
    }
    
    return view;
}


+ (UITableView *)tableViewFrame:(CGRect)frame style:(UITableViewStyle)style backgroundColor:(UIColor *)backgroundColor separatorStyle:(UITableViewCellSeparatorStyle)separatorStyle dataSource:(id<UITableViewDataSource>)dataSource delegate:(id<UITableViewDelegate>)delegate{
    UITableView *view = [[UITableView alloc] initWithFrame:frame style:style];
    
    if (backgroundColor) {
        view.backgroundColor = backgroundColor;
    }
    
    view.separatorStyle = separatorStyle;
    
    if (dataSource) {
        view.dataSource = dataSource;
    }
    
    if (delegate) {
        view.delegate = delegate;
    }
    
    return view;
}

+ (UITextField *)textFieldWithFrame:(CGRect)frame placeholder:(NSString *)placeholder backgroundColor:(UIColor *)backgroundColor borderColor:(UIColor *)borderColor cornerRadius:(float)cornerRadius font:(UIFont *)font textColor:(UIColor *)textColor textAlignment:(NSTextAlignment)textAlignment text:(NSString *)text delegate:(id<UITextFieldDelegate>)delegate{
    
    UITextField *view = [[UITextField alloc] initWithFrame:frame];
    
    if (placeholder) {
        view.placeholder = placeholder;
    }
    
    if (backgroundColor) {
        view.backgroundColor = backgroundColor;
    }
    
    
    
    if (cornerRadius > 0) {
        view.layer.cornerRadius = cornerRadius;
        view.layer.masksToBounds = YES;
    }
    
    if (font) {
        view.font = font;
    }
    
    if (textColor) {
        view.textColor = textColor;
    }
    
    if (text) {
        view.text = text;
    }
    
    if (delegate) {
        view.delegate = delegate;
    }
    
    view.textAlignment = textAlignment;
    
    return view;
}


@end
