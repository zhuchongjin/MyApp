//
//  HDNetworking.m
//  PortableTreasure
//
//  Created by HeDong on 16/2/10.
//  Copyright © 2016年 hedong. All rights reserved.
//

#import "HDNetworking.h"
#import "HDPicModle.h"
#import "UIImage+HDExtension.h"
#import "AFNetworking.h"

@implementation HDNetworking
HDSingletonM(HDNetworking) // 单例实现

/**
 *  网络监测(在什么网络状态)
 *
 *  @param unknown          未知网络
 *  @param reachable        无网络
 *  @param reachableViaWWAN 蜂窝数据网
 *  @param reachableViaWiFi WiFi网络
 */
- (void)networkStatusUnknown:(Unknown)unknown reachable:(Reachable)reachable reachableViaWWAN:(ReachableViaWWAN)reachableViaWWAN reachableViaWiFi:(ReachableViaWiFi)reachableViaWiFi
{
    // 创建网络监测者
    AFNetworkReachabilityManager *manager = [AFNetworkReachabilityManager sharedManager];
    
    [manager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        // 监测到不同网络的情况
        NSLog(@"ddsfdsfdsfsdfs%ld",(long)status);
        switch (status)
        {
            case AFNetworkReachabilityStatusUnknown:
                unknown();
                break;
                
            case AFNetworkReachabilityStatusNotReachable:
                reachable();
                break;
                
            case AFNetworkReachabilityStatusReachableViaWWAN:
                reachableViaWWAN();
                
                break;
            case AFNetworkReachabilityStatusReachableViaWiFi:
                reachableViaWiFi();
                break;
                
            default:
                break;
        }
    }] ;
}




/**
 *  封装的get请求
 *
 *  @param URLString  请求的链接
 *  @param parameters 请求的参数
 *  @param success    请求成功回调
 *  @param failure    请求失败回调
 */
- (void)GET:(NSString *)URLString parameters:(NSDictionary *)parameters success:(Success)success failure:(Failure)failure
{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    
    NSMutableSet *contentTypes = [[NSMutableSet alloc] initWithSet:manager.responseSerializer.acceptableContentTypes];
    [contentTypes addObject:@"text/html"];
    [contentTypes addObject:@"text/plain"];
    [contentTypes addObject:@"application/json"];
    [contentTypes addObject:@"image/jpeg"];
    [contentTypes addObject:@"image/jpg"];
    [contentTypes addObject:@"application/octet-stream"];
    
    [manager.requestSerializer setValue:@"max-age=0" forHTTPHeaderField:@"Cache-Control"];
    [manager.requestSerializer setValue:@"text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8" forHTTPHeaderField:@"Accept"];
    [manager.requestSerializer setValue:@"zh-cn,zh;q=0.8,en-us;q=0.5,en;q=0.3" forHTTPHeaderField:@"Accept-Language"];
    [manager.requestSerializer setValue:@"gzip, deflate" forHTTPHeaderField:@"Accept-Encoding"];
    [manager.requestSerializer setValue:@"binary" forHTTPHeaderField:@"Content-Encoding"];
    [manager.requestSerializer setValue:@"keep-alive" forHTTPHeaderField:@"Connection"];
    manager.responseSerializer.acceptableContentTypes = self.acceptableContentTypes;
    manager.requestSerializer.timeoutInterval = (self.timeoutInterval ? self.timeoutInterval : TIMEOUT);
    
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
    
    [manager GET:URLString parameters:parameters progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        if (success)
        {
            success(responseObject);
        }
        
        [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        if (failure)
        {
            failure(error);
        }
        
        [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
    }];
}

/**
 *  封装的POST请求
 *
 *  @param URLString  请求的链接
 *  @param parameters 请求的参数
 *  @param success    请求成功回调
 *  @param failure    请求失败回调
 */
- (void)POST:(NSString *)URLString parameters:(id)parameters success:(Success)success failure:(Failure)failure
{

    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    NSMutableSet *contentTypes = [[NSMutableSet alloc] initWithSet:manager.responseSerializer.acceptableContentTypes];
    [contentTypes addObject:@"text/html"];
    [contentTypes addObject:@"text/plain"];
    [contentTypes addObject:@"application/json"];
    [contentTypes addObject:@"image/jpeg"];
    [contentTypes addObject:@"image/jpg"];
    [contentTypes addObject:@"application/octet-stream"];
    
    [manager.requestSerializer setValue:@"max-age=0" forHTTPHeaderField:@"Cache-Control"];
    [manager.requestSerializer setValue:@"application/json,text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8" forHTTPHeaderField:@"Accept"];
    [manager.requestSerializer setValue:@"zh-cn,zh;q=0.8,en-us;q=0.5,en;q=0.3" forHTTPHeaderField:@"Accept-Language"];
    [manager.requestSerializer setValue:@"gzip, deflate" forHTTPHeaderField:@"Accept-Encoding"];
    [manager.requestSerializer setValue:@"binary" forHTTPHeaderField:@"Content-Encoding"];
    [manager.requestSerializer setValue:@"keep-alive" forHTTPHeaderField:@"Connection"];
    
    manager.responseSerializer.acceptableContentTypes = self.acceptableContentTypes;
    manager.requestSerializer.timeoutInterval = (self.timeoutInterval ? self.timeoutInterval : TIMEOUT);
    
//    
//    NSString *cerPath = [[NSBundle mainBundle] pathForResource:@"web.linjinsuo.tech" ofType:@"cer"];
//    NSData *cerData = [NSData dataWithContentsOfFile:cerPath];
//    NSSet *cerSet = [[NSSet alloc]initWithObjects:cerData, nil];
//    AFSecurityPolicy *securityPoliy = [AFSecurityPolicy defaultPolicy];
//    //allowInvalidCertificates 是否允许无效证书（也就是自建的证书），默认为NO
//    //如果是需要验证自建证书，需要设置为YES
//    securityPoliy.allowInvalidCertificates = YES;
//    securityPoliy.validatesDomainName = NO;
//    //设置证书
//    [securityPoliy setPinnedCertificates:cerSet];
//
//    manager.securityPolicy = securityPoliy;
    

    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES]; // 开启状态栏动画
    [manager POST:URLString parameters:parameters progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        if (success)
        {
            success(responseObject);
            ErrorModel * model = [ErrorModel mj_objectWithKeyValues:[responseObject valueForKey:@"Head"]];
            if ([model.code isEqualToString:@"1037"]) {
                SendNotify(LOGOUT, nil);
                NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
                
                [defaults removeObjectForKey:@"UserInfo"];
                
                [defaults synchronize];
            }
        }
        
        [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO]; // 关闭状态栏动画
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        if (failure)
        {
            failure(error);
        }
        
        [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO]; // 关闭状态栏动画
    }];
}

-(AFSecurityPolicy *)customSecurityPolicy
{
    // 先导入证书，在这加证书，一般情况适用于单项认证
    // 证书的路径
    NSString *cerPath = [[NSBundle mainBundle] pathForResource:@"tech" ofType:@"cer"];
    
    NSData *cerData = [NSData dataWithContentsOfFile:cerPath];
    
    if (cerData == nil) {
        return nil;
    }
    NSSet *setData = [NSSet setWithObject:cerData];
    //AFSSLPinningModeCertificate 使用证书验证模式
    AFSecurityPolicy *securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeCertificate];
    
    // allowInvalidCertificates 是否允许无效证书(也就是自建的证书)，默认为NO
    // 如果是需要验证自建证书，需要设置为YES
    securityPolicy.allowInvalidCertificates = YES;
    
    // validatesDomainName 是否需要验证域名，默认为YES;
    // 假如证书的域名与你请求的域名不一致，需要把该项设置为NO；如设成NO的话，即服务器使用其他可信任机构颁发的证书，也可以建立连接，这个非常危险，建议打开。
    // 设置为NO，主要用于这种情况：客户端请求的事子域名，而证书上的是另外一个域名。因为SSL证书上的域名是独立的，假如证书上注册的域名是www.google.com,那么mail.google.com是无法验证通过的；当然有钱可以注册通配符的域名*.google.com，但这个还是比较贵的。
    // 如设置为NO，建议自己添加对应域名的校验逻辑。
    securityPolicy.validatesDomainName = NO;
    
    [securityPolicy setPinnedCertificates:setData];
    
    return securityPolicy;
}

/**
 *  封装的POST请求
 *
 *  @param URLString  请求的链接
 *  @param parameters 请求的参数
 *  @param success    请求成功回调
 *  @param failure    请求失败回调
 */
- (void)POST:(NSString *)URLString status:(NSString *)status parameters:(id)parameters success:(Success)success failure:(Failure)failure
{
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    NSMutableSet *contentTypes = [[NSMutableSet alloc] initWithSet:manager.responseSerializer.acceptableContentTypes];
    [contentTypes addObject:@"text/html"];
    [contentTypes addObject:@"text/plain"];
    [contentTypes addObject:@"application/json"];
    [contentTypes addObject:@"image/jpeg"];
    [contentTypes addObject:@"image/jpg"];
    [contentTypes addObject:@"application/octet-stream"];
    
    [manager.requestSerializer setValue:@"max-age=0" forHTTPHeaderField:@"Cache-Control"];
    [manager.requestSerializer setValue:@"application/json,text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8" forHTTPHeaderField:@"Accept"];
    [manager.requestSerializer setValue:@"zh-cn,zh;q=0.8,en-us;q=0.5,en;q=0.3" forHTTPHeaderField:@"Accept-Language"];
    [manager.requestSerializer setValue:@"gzip, deflate" forHTTPHeaderField:@"Accept-Encoding"];
    [manager.requestSerializer setValue:@"binary" forHTTPHeaderField:@"Content-Encoding"];
    [manager.requestSerializer setValue:@"keep-alive" forHTTPHeaderField:@"Connection"];
    
    manager.responseSerializer.acceptableContentTypes = self.acceptableContentTypes;
    manager.requestSerializer.timeoutInterval = (self.timeoutInterval ? self.timeoutInterval : TIMEOUT);
    
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES]; // 开启状态栏动画
    [manager POST:URLString parameters:parameters progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        if (success)
        {
            success(responseObject);
        }
        
        [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO]; // 关闭状态栏动画
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        if (failure)
        {
            failure(error);
        }
        
        [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO]; // 关闭状态栏动画
    }];
}


/**
 *  封装的POST请求
 *
 *  @param URLString  请求的链接
 *  @param parameters 请求的参数
 *  @param success    请求成功回调
 *  @param failure    请求失败回调
 */
- (void)POST:(NSString *)URLString parametersStr:(NSString *)parameters success:(Success)success failure:(Failure)failure{
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    NSMutableSet *contentTypes = [[NSMutableSet alloc] initWithSet:manager.responseSerializer.acceptableContentTypes];
    [contentTypes addObject:@"text/html"];
    [contentTypes addObject:@"text/plain"];
    [contentTypes addObject:@"application/json"];
    [contentTypes addObject:@"image/jpeg"];
    [contentTypes addObject:@"image/jpg"];
    [contentTypes addObject:@"application/octet-stream"];
    
    [manager.requestSerializer setValue:@"max-age=0" forHTTPHeaderField:@"Cache-Control"];
    [manager.requestSerializer setValue:@"application/json,text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8" forHTTPHeaderField:@"Accept"];
    [manager.requestSerializer setValue:@"zh-cn,zh;q=0.8,en-us;q=0.5,en;q=0.3" forHTTPHeaderField:@"Accept-Language"];
    [manager.requestSerializer setValue:@"gzip, deflate" forHTTPHeaderField:@"Accept-Encoding"];
    [manager.requestSerializer setValue:@"binary" forHTTPHeaderField:@"Content-Encoding"];
    [manager.requestSerializer setValue:@"keep-alive" forHTTPHeaderField:@"Connection"];
    
    manager.responseSerializer.acceptableContentTypes = self.acceptableContentTypes;
    manager.requestSerializer.timeoutInterval = (self.timeoutInterval ? self.timeoutInterval : TIMEOUT);
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES]; // 开启状态栏动画
    
    [manager POST:URLString parameters:parameters progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        if (success)
        {
            success(responseObject);
        }
        
        [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO]; // 关闭状态栏动画
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        if (failure)
        {
            failure(error);
        }
        
        [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO]; // 关闭状态栏动画
    }];
    
}

/**
 *  封装POST图片上传(多张图片) // 可扩展成多个别的数据上传如:mp3等
 *
 *  @param URLString  请求的链接
 *  @param parameters 请求的参数
 *  @param picArray   存放图片模型(HDPicModle)的数组
 *  @param progress   进度的回调
 *  @param success    发送成功的回调
 *  @param failure    发送失败的回调
 */
- (void)POST:(NSString *)URLString parameters:(NSDictionary *)parameters andPicArray:(NSArray *)picArray progress:(Progress)progress success:(Success)success failure:(Failure)failure
{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    manager.responseSerializer.acceptableContentTypes = self.acceptableContentTypes;
    manager.requestSerializer.timeoutInterval = (self.timeoutInterval ? self.timeoutInterval : 20);
    manager.requestSerializer = [AFHTTPRequestSerializer serializer]; // 请求不使用AFN默认转换,保持原有数据
    manager.responseSerializer = [AFHTTPResponseSerializer serializer]; // 响应不使用AFN默认转换,保持原有数据
    
    [manager POST:URLString parameters:parameters constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        
        NSInteger count = picArray.count;
        NSString *fileName = @"";
        NSData *data = [NSData data];
        
        for (int i = 0; i < count; i++)
        {
            @autoreleasepool {
                HDPicModle *picModle = picArray[i];
                fileName = [NSString stringWithFormat:@"pic%02d.jpg", i];
                /**
                 *  压缩图片然后再上传(1.0代表无损 0~~1.0区间)
                 */
                data = UIImageJPEGRepresentation(picModle.pic, 1.0);
                CGFloat precent = self.picSize / (data.length / 1024.0);
                if (precent > 1)
                {
                    precent = 1.0;
                }
                data = nil;
                data = UIImageJPEGRepresentation(picModle.pic, precent);
                
                [formData appendPartWithFileData:data name:picModle.picName fileName:fileName mimeType:@"image/jpeg"];
                data = nil;
                picModle.pic = nil;
            }
        }
        
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        
        if (progress)
        {
            progress(uploadProgress); // HDLog(@"%lf", 1.0 * uploadProgress.completedUnitCount / uploadProgress.totalUnitCount);
        }
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        if (success)
        {
            success(responseObject);
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        if (failure)
        {
            failure(error);
        }
    }];
}

/**
 *  封装POST图片上传(单张图片) // 可扩展成单个别的数据上传如:mp3等
 *
 *  @param URLString  请求的链接
 *  @param parameters 请求的参数
 *  @param picModle   上传的图片模型
 *  @param progress   进度的回调
 *  @param success    发送成功的回调
 *  @param failure    发送失败的回调
 */
- (void)POST:(NSString *)URLString parameters:(NSDictionary *)parameters andPic:(HDPicModle *)picModle progress:(Progress)progress success:(Success)success failure:(Failure)failure
{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    manager.responseSerializer.acceptableContentTypes = self.acceptableContentTypes;
    manager.requestSerializer.timeoutInterval = (self.timeoutInterval ? self.timeoutInterval : 20);
    manager.requestSerializer = [AFHTTPRequestSerializer serializer]; // 请求不使用AFN默认转换,保持原有数据
    manager.responseSerializer = [AFHTTPResponseSerializer serializer]; // 响应不使用AFN默认转换,保持原有数据
    
    [manager POST:URLString parameters:parameters constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        
        /**
         *  压缩图片然后再上传(1.0代表无损 0~~1.0区间)
         */
        NSData *data = UIImageJPEGRepresentation(picModle.pic, 1.0);
        CGFloat precent = self.picSize / (data.length / 1024.0);
        if (precent > 1)
        {
            precent = 1.0;
        }
        data = nil;
        data = UIImageJPEGRepresentation(picModle.pic, precent);
        
        NSString *fileName = [NSString stringWithFormat:@"%@.jpg", picModle.picName];
        
        [formData appendPartWithFileData:data name:picModle.picName fileName:fileName mimeType:@"image/jpeg"];
        
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        
        if (progress)
        {
            progress(uploadProgress); // HDLog(@"%lf", 1.0 * uploadProgress.completedUnitCount / uploadProgress.totalUnitCount);
        }
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        if (success)
        {
            success(responseObject);
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        if (failure)
        {
            failure(error);
        }
    }];
}

/**
 *  封装POST上传url资源
 *
 *  @param URLString  请求的链接
 *  @param parameters 请求的参数
 *  @param picModle   上传的图片模型(资源的url地址)
 *  @param progress   进度的回调
 *  @param success    发送成功的回调
 *  @param failure    发送失败的回调
 */
- (void)POST:(NSString *)URLString parameters:(NSDictionary *)parameters andPicUrl:(HDPicModle *)picModle progress:(Progress)progress success:(Success)success failure:(Failure)failure;
{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    manager.responseSerializer.acceptableContentTypes = self.acceptableContentTypes;
    manager.requestSerializer.timeoutInterval = (self.timeoutInterval ? self.timeoutInterval : 20);
    manager.requestSerializer = [AFHTTPRequestSerializer serializer]; // 请求不使用AFN默认转换,保持原有数据
    manager.responseSerializer = [AFHTTPResponseSerializer serializer]; // 响应不使用AFN默认转换,保持原有数据
    
    [manager POST:URLString parameters:parameters constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        
        NSString *fileName = [NSString stringWithFormat:@"%@.jpg", picModle.picName];
        // 根据本地路径获取url(相册等资源上传)
        NSURL *url = [NSURL fileURLWithPath:picModle.url]; // [NSURL URLWithString:picModle.url] 可以换成网络的图片在上传
        
        [formData appendPartWithFileURL:url name:picModle.picName fileName:fileName mimeType:@"application/octet-stream" error:nil];
        
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        
        if (progress)
        {
            progress(uploadProgress); // HDLog(@"%lf", 1.0 * uploadProgress.completedUnitCount / uploadProgress.totalUnitCount);
        }
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        if (success)
        {
            success(responseObject);
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        if (failure)
        {
            failure(error);
        }
    }];
}

/**
 *  下载
 *
 *  @param URLString       请求的链接
 *  @param progress        进度的回调
 *  @param destination     返回URL的回调
 *  @param downLoadSuccess 发送成功的回调
 *  @param failure         发送失败的回调
 */
- (NSURLSessionDownloadTask *)downLoadWithURL:(NSString *)URLString progress:(Progress)progress destination:(Destination)destination downLoadSuccess:(DownLoadSuccess)downLoadSuccess failure:(Failure)failure;
{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    NSMutableSet *contentTypes = [[NSMutableSet alloc] initWithSet:manager.responseSerializer.acceptableContentTypes];
    [contentTypes addObject:@"text/html"];
    [contentTypes addObject:@"text/plain"];
    [contentTypes addObject:@"application/json"];
    [contentTypes addObject:@"application/zip"];
    [contentTypes addObject:@"image/jpg"];
    [contentTypes addObject:@"application/octet-stream"];
    
    [manager.requestSerializer setValue:@"max-age=0" forHTTPHeaderField:@"Cache-Control"];
    [manager.requestSerializer setValue:@"text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8" forHTTPHeaderField:@"Accept"];
    [manager.requestSerializer setValue:@"zh-cn,zh;q=0.8,en-us;q=0.5,en;q=0.3" forHTTPHeaderField:@"Accept-Language"];
    [manager.requestSerializer setValue:@"gzip, deflate" forHTTPHeaderField:@"Accept-Encoding"];
    [manager.requestSerializer setValue:@"binary" forHTTPHeaderField:@"Content-Encoding"];
    [manager.requestSerializer setValue:@"keep-alive" forHTTPHeaderField:@"Connection"];
    manager.responseSerializer.acceptableContentTypes = self.acceptableContentTypes;
    manager.requestSerializer.timeoutInterval = (self.timeoutInterval ? self.timeoutInterval : TIMEOUT);
    
    
    
    NSURL *url = [NSURL URLWithString:URLString];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    // 下载任务
    NSURLSessionDownloadTask *task = [manager downloadTaskWithRequest:request progress:^(NSProgress * _Nonnull downloadProgress) {
        
        if (progress)
        {
            progress(downloadProgress); // HDLog(@"%lf", 1.0 * uploadProgress.completedUnitCount / uploadProgress.totalUnitCount);
        }
        
    } destination:^NSURL * _Nonnull(NSURL * _Nonnull targetPath, NSURLResponse * _Nonnull response) {
        
        if (destination)
        {
            return destination(targetPath, response);
        }
        else
        {
            return nil;
        }
        
    } completionHandler:^(NSURLResponse * _Nonnull response, NSURL * _Nullable filePath, NSError * _Nullable error) {
        
        if (error)
        {
            failure(error);
        }
        else
        {
            downLoadSuccess(response, filePath);
        }
    }];
    
    // 开始启动任务
    [task resume];
    
    return task;
}

/**
 *  封装的POST请求
 *
 *  @param URLString  请求的链接
 *  @param avatar 请求的参数
 *  @param success    请求成功回调
 *  @param failure    请求失败回调
 */
- (void)POST:(NSString *)URLString avatar:(UIImage *)avatar progress:(Progress)progress success:(Success)success failure:(Failure)failure
{
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    NSMutableSet *contentTypes = [[NSMutableSet alloc] initWithSet:manager.responseSerializer.acceptableContentTypes];
    [contentTypes addObject:@"text/html"];
    [contentTypes addObject:@"text/plain"];
    [contentTypes addObject:@"application/json"];
    [contentTypes addObject:@"image/jpeg"];
    [contentTypes addObject:@"image/jpg"];
    [contentTypes addObject:@"application/octet-stream"];
    
    [manager.requestSerializer setValue:@"max-age=0" forHTTPHeaderField:@"Cache-Control"];
    [manager.requestSerializer setValue:@"text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8" forHTTPHeaderField:@"Accept"];
    [manager.requestSerializer setValue:@"zh-cn,zh;q=0.8,en-us;q=0.5,en;q=0.3" forHTTPHeaderField:@"Accept-Language"];
    [manager.requestSerializer setValue:@"gzip, deflate" forHTTPHeaderField:@"Accept-Encoding"];
    [manager.requestSerializer setValue:@"binary" forHTTPHeaderField:@"Content-Encoding"];
    [manager.requestSerializer setValue:@"keep-alive" forHTTPHeaderField:@"Connection"];
    manager.responseSerializer.acceptableContentTypes = self.acceptableContentTypes;
    manager.requestSerializer.timeoutInterval = (self.timeoutInterval ? self.timeoutInterval : TIMEOUT);
    [manager POST:URLString
       parameters:nil
constructingBodyWithBlock:^(id<AFMultipartFormData> formData){
    NSData *imageData =  UIImageJPEGRepresentation(avatar,0.5);
    [formData appendPartWithFileData:imageData name:[NSString stringWithFormat:@"headerimg"] fileName:[NSString stringWithFormat:@"file.png"] mimeType:@"application/octet-stream"];
}
          success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
              
              if (success)
              {
                  NSLog(@"at response Body %@",responseObject);
                  success(responseObject);
              }
          }
          failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
              
              if (failure)
              {
                  failure(error);
              }
          }];
    
    /*
     [manager POST:URLString parameters:nil constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
     
     NSData *imageData =  UIImageJPEGRepresentation(avatar,0.5);
     [formData appendPartWithFileData:imageData name:[NSString stringWithFormat:@"headerimg"] fileName:[NSString stringWithFormat:@"file.png"] mimeType:@"application/octet-stream"];
     } progress:^(NSProgress * _Nonnull uploadProgress) {
     
     if (progress)
     {
     progress(uploadProgress); // HDLog(@"%lf", 1.0 * uploadProgress.completedUnitCount / uploadProgress.totalUnitCount);
     }
     
     }
     success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
     
     if (success)
     {
     NSLog(@"at response Body %@",responseObject);
     success(responseObject);
     }
     }
     failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
     
     if (failure)
     {
     failure(error);
     }
     }];*/
    
    
}
- (void)uploadSiglePicture:(NSString *)urlStr
                   imgData:(NSData *)imageData
                      name:(NSString *)uploadName
                parameters:(NSDictionary *)parameters
                andSuccess:(void (^)(id responseObject))success
                   failure:(void (^)(void))failure
{
    AFSecurityPolicy *securityPolicy = [[AFSecurityPolicy alloc] init];
    [securityPolicy setAllowInvalidCertificates:YES];
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/html", @"text/plain", nil];
    
    [manager POST:urlStr parameters:parameters constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        
        NSString *fileName = [NSString stringWithFormat:@"%@%@", uploadName, @".png"];
        
        [formData appendPartWithFileData:imageData name:uploadName fileName:fileName mimeType:@"image/png"];
        
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        success(responseObject);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failure();
    }];
}
@end
