//
//  ErrorModel.h
//  linjinsuo
//
//  Created by admin on 2018/3/12.
//  Copyright © 2018年 admin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ErrorModel : NSObject
@property (nonatomic, strong) NSString * code;
@property (nonatomic, strong) NSString *msg;
@property (nonatomic, strong) NSString *serviceCode;
@property (nonatomic, strong) NSString *reqTime;
@property (nonatomic, strong) NSString *rspTime;
@property (nonatomic, strong) NSString * service;
@property (nonatomic, strong) NSString *  useTime;
@property (nonatomic, strong) NSString *status;
@property (nonatomic, strong) NSString *fileId;



@end
