//
//  BaseTabViewController.h
//  linjinsuo
//
//  Created by zcj on 2018/4/2.
//  Copyright © 2018年 admin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseTabViewController : UITableViewController
@property(strong,nonatomic) NSMutableDictionary * psddDic;
@property(strong,nonatomic) NSMutableDictionary * BodyDic;
@property(strong,nonatomic) NSMutableDictionary * param;
-(NSString *)urldecode:(NSMutableDictionary *) input;
-(BOOL)isLogin;
@end
